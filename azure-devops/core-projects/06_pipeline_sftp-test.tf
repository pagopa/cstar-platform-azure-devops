variable "sftp-test" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "sftp-test"
      branch_name     = "release-dev"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = false
      enable_deploy      = true
      path               = "cstar\\sftp-test"
    }
  }
}

locals {
  # global vars
  sftp-test-variables = {
    dockerfile = "Dockerfile"
  }
  # global secrets
  sftp-test-variables_secret = {

  }
  # code_review vars
  sftp-test-variables_code_review = {

  }
  # code_review secrets
  sftp-test-variables_secret_code_review = {

  }
  # deploy vars
  sftp-test-variables_deploy = {
    K8S_IMAGE_REPOSITORY_NAME        = replace(var.sftp-test.repository.name, "-", "")
    DEPLOY_NAMESPACE                 = local.domain
    HELM_RELEASE_NAME                = var.sftp-test.repository.name

    DEV_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_acr_aks_dev_name
    DEV_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_dev
    DEV_CONTAINER_REGISTRY_NAME         = local.aks_cr_name_dev
    DEV_AGENT_POOL                      = local.azdo_agent_pool_dev
    # UAT_CONTAINER_REGISTRY_SERVICE_CONN  = azuredevops_serviceendpoint_azurecr.cstar-azurecr-uat.service_endpoint_name
    # UAT_KUBERNETES_SERVICE_CONN          = azuredevops_serviceendpoint_kubernetes.cstar-aks-uat.service_endpoint_name
    # UAT_CONTAINER_REGISTRY_NAME          = "cstaruacr.azurecr.io"
    # UAT_AGENT_POOL                       = "cstar-uat-linux"
    # PROD_CONTAINER_REGISTRY_SERVICE_CONN = azuredevops_serviceendpoint_azurecr.cstar-azurecr-prod.service_endpoint_name
    # PROD_KUBERNETES_SERVICE_CONN         = azuredevops_serviceendpoint_kubernetes.cstar-aks-prod.service_endpoint_name
    # PROD_CONTAINER_REGISTRY_NAME         = "cstarpacr.azurecr.io"
    # PROD_AGENT_POOL                      = "cstar-prod-linux"
  }
  # deploy secrets
  sftp-test-variables_secret_deploy = {

  }
}

module "sftp-test_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v2.2.0"
  count  = var.sftp-test.pipeline.enable_code_review == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.sftp-test.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.sftp-test.pipeline.path

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.sftp-test-variables,
    local.sftp-test-variables_code_review,
  )

  variables_secret = merge(
    local.sftp-test-variables_secret,
    local.sftp-test-variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
    local.azuredevops_serviceendpoint_sonarcloud_id,
  ]
}

module "sftp-test_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.2.0"
  count  = var.sftp-test.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.sftp-test.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.sftp-test.pipeline.path
  ci_trigger_use_yaml          = true

  variables = merge(
    local.sftp-test-variables,
    local.sftp-test-variables_deploy,
  )

  variables_secret = merge(
    local.sftp-test-variables_secret,
    local.sftp-test-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_pr_id,

    local.service_endpoint_azure_dev_id,
    local.service_endpoint_azure_devops_acr_aks_dev_id,
    azuredevops_serviceendpoint_kubernetes.aks_dev.id
  ]

}
