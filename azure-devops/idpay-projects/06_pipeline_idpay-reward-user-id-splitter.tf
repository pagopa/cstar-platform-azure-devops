variable "idpay-reward-user-id-splitter" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-reward-user-id-splitter"
      branch_name     = "refs/heads/release-dev"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
      path               = "idpay\\idpay-reward-user-id-splitter"
    }
  }
}

locals {
  # global vars
  idpay-reward-user-id-splitter-variables = {
    dockerfile = "Dockerfile"
  }
  # global secrets
  idpay-reward-user-id-splitter-variables_secret = {

  }
  # code_review vars
  idpay-reward-user-id-splitter-variables_code_review = {
    sonarcloud_service_conn = "SONARCLOUD-SERVICE-CONN"
    sonarcloud_org          = var.idpay-reward-user-id-splitter.repository.organization
    sonarcloud_project_key  = "${var.idpay-reward-user-id-splitter.repository.organization}_${var.idpay-reward-user-id-splitter.repository.name}"
    sonarcloud_project_name = var.idpay-reward-user-id-splitter.repository.name
  }
  # code_review secrets
  idpay-reward-user-id-splitter-variables_secret_code_review = {

  }
  # deploy vars
  idpay-reward-user-id-splitter-variables_deploy = {
    K8S_IMAGE_REPOSITORY_NAME        = replace(var.idpay-reward-user-id-splitter.repository.name, "-", "")
    DEPLOY_NAMESPACE                 = local.domain
    SETTINGS_XML_RW_SECURE_FILE_NAME = "settings-rw.xml"
    SETTINGS_XML_RO_SECURE_FILE_NAME = "settings-ro.xml"
    HELM_RELEASE_NAME                = var.idpay-reward-user-id-splitter.repository.name

    DEV_CONTAINER_REGISTRY_SERVICE_CONN  = local.service_endpoint_azure_devops_docker_dev_name
    DEV_KUBERNETES_SERVICE_CONN          = local.srv_endpoint_name_aks_dev
    DEV_CONTAINER_REGISTRY_NAME          = local.aks_dev_docker_registry_name
    DEV_AGENT_POOL                       = local.azdo_agent_pool_dev
    UAT_CONTAINER_REGISTRY_SERVICE_CONN  = local.service_endpoint_azure_devops_docker_uat_name
    UAT_KUBERNETES_SERVICE_CONN          = local.srv_endpoint_name_aks_uat
    UAT_CONTAINER_REGISTRY_NAME          = local.aks_uat_docker_registry_name
    UAT_AGENT_POOL                       = local.azdo_agent_pool_uat
    PROD_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_prod_name
    PROD_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_prod
    PROD_CONTAINER_REGISTRY_NAME         = local.aks_prod_docker_registry_name
    PROD_AGENT_POOL                      = local.azdo_agent_pool_prod
  }
  # deploy secrets
  idpay-reward-user-id-splitter-variables_secret_deploy = {

  }
}

module "idpay-reward-user-id-splitter_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v5.4.0"
  count  = var.idpay-reward-user-id-splitter.pipeline.enable_code_review == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-reward-user-id-splitter.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-reward-user-id-splitter.pipeline.path

  ci_trigger_use_yaml           = true
  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay-reward-user-id-splitter-variables,
    local.idpay-reward-user-id-splitter-variables_code_review,
  )

  variables_secret = merge(
    local.idpay-reward-user-id-splitter-variables_secret,
    local.idpay-reward-user-id-splitter-variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
    data.azuredevops_serviceendpoint_sonarcloud.sonar_cloud.id,
  ]
}

module "idpay-reward-user-id-splitter_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v5.4.0"
  count  = var.idpay-reward-user-id-splitter.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-reward-user-id-splitter.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-reward-user-id-splitter.pipeline.path
  ci_trigger_use_yaml          = true

  variables = merge(
    local.idpay-reward-user-id-splitter-variables,
    local.idpay-reward-user-id-splitter-variables_deploy,
  )

  variables_secret = merge(
    local.idpay-reward-user-id-splitter-variables_secret,
    local.idpay-reward-user-id-splitter-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_pr_id,

    #dev
    local.service_endpoint_azure_dev_id,
    local.service_endpoint_azure_devops_docker_dev_id,
    azuredevops_serviceendpoint_kubernetes.aks_dev.id,
    #uat
    local.service_endpoint_azure_uat_id,
    local.service_endpoint_azure_devops_docker_uat_id,
    azuredevops_serviceendpoint_kubernetes.aks_uat.id,
    #prod
    local.service_endpoint_azure_prod_id,
    local.service_endpoint_azure_devops_docker_prod_id,
    azuredevops_serviceendpoint_kubernetes.aks_prod.id,
  ]

}
