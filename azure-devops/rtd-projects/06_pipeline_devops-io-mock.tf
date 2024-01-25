variable "cstar-io-mock" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "cstar-io-mock"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = "cstar"
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
      path               = "rtd\\io-mock"
    }
  }
}

locals {
  # global vars
  cstar-io-mock-variables = {
    dockerfile = "Dockerfile"
  }
  # global secrets
  cstar-io-mock-variables_secret = {

  }
  # code_review vars
  cstar-io-mock-variables_code_review = {
    sonarcloud_service_conn = "SONARCLOUD-SERVICE-CONN"
    sonarcloud_org          = var.cstar-io-mock.repository.organization
    sonarcloud_project_key  = "${var.cstar-io-mock.repository.organization}_${var.cstar-io-mock.repository.name}"
    sonarcloud_project_name = var.cstar-io-mock.repository.name
  }
  # code_review secrets
  cstar-io-mock-variables_secret_code_review = {

  }
  # deploy vars
  cstar-io-mock-variables_deploy = {
    K8S_IMAGE_REPOSITORY_NAME = replace(var.cstar-io-mock.repository.name, "-", "")
    DEPLOY_NAMESPACE          = local.domain
    HELM_RELEASE_NAME         = var.cstar-io-mock.repository.name

    DEV_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_dev_name
    DEV_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_dev
    DEV_CONTAINER_REGISTRY_NAME         = local.aks_dev_docker_registry_name
    DEV_AGENT_POOL                      = local.azdo_agent_pool_dev

    UAT_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_uat_name
    UAT_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_uat
    UAT_CONTAINER_REGISTRY_NAME         = local.aks_uat_docker_registry_name
    UAT_AGENT_POOL                      = local.azdo_agent_pool_uat

    PROD_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_prod_name
    PROD_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_prod
    PROD_CONTAINER_REGISTRY_NAME         = local.aks_prod_docker_registry_name
    PROD_AGENT_POOL                      = local.azdo_agent_pool_prod

  }
  # deploy secrets
  cstar-io-mock-variables_secret_deploy = {

  }
}

module "cstar-io-mock_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v3.1.1"
  count  = var.cstar-io-mock.pipeline.enable_code_review == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.cstar-io-mock.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.cstar-io-mock.pipeline.path

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.cstar-io-mock-variables,
    local.cstar-io-mock-variables_code_review,
  )

  variables_secret = merge(
    local.cstar-io-mock-variables_secret,
    local.cstar-io-mock-variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
    local.azuredevops_serviceendpoint_sonarcloud_id,
  ]
}

module "cstar-io-mock_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v5.2.0"
  count  = var.cstar-io-mock.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.cstar-io-mock.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.cstar-io-mock.pipeline.path

  ci_trigger_use_yaml = true

  variables = merge(
    local.cstar-io-mock-variables,
    local.cstar-io-mock-variables_deploy,
  )

  variables_secret = merge(
    local.cstar-io-mock-variables_secret,
    local.cstar-io-mock-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_pr_id,

    local.service_endpoint_azure_dev_id,
    local.service_endpoint_azure_devops_docker_dev_id,
    azuredevops_serviceendpoint_kubernetes.aks_dev.id,


    local.service_endpoint_azure_uat_id,
    local.service_endpoint_azure_devops_docker_uat_id,
    azuredevops_serviceendpoint_kubernetes.aks_uat.id,

    local.service_endpoint_azure_prod_id,
    local.service_endpoint_azure_devops_docker_prod_id,
    azuredevops_serviceendpoint_kubernetes.aks_prod.id
  ]
}
