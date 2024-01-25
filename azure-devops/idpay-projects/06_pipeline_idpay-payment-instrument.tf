variable "idpay-payment-instrument" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-payment-instrument"
      branch_name     = "refs/heads/release-dev"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
      path               = "idpay\\idpay-payment-instrument"
    }
  }
}

locals {
  # global vars
  idpay-payment-instrument-variables = {
    dockerfile = "Dockerfile"
  }
  # global secrets
  idpay-payment-instrument-variables_secret = {

  }
  # code_review vars
  idpay-payment-instrument-variables_code_review = {
    sonarcloud_service_conn = "SONARCLOUD-SERVICE-CONN"
    sonarcloud_org          = var.idpay-payment-instrument.repository.organization
    sonarcloud_project_key  = "${var.idpay-payment-instrument.repository.organization}_${var.idpay-payment-instrument.repository.name}"
    sonarcloud_project_name = var.idpay-payment-instrument.repository.name
  }
  # code_review secrets
  idpay-payment-instrument-variables_secret_code_review = {

  }
  # deploy vars
  idpay-payment-instrument-variables_deploy = {
    K8S_IMAGE_REPOSITORY_NAME        = replace(var.idpay-payment-instrument.repository.name, "-", "")
    DEPLOY_NAMESPACE                 = local.domain
    SETTINGS_XML_RW_SECURE_FILE_NAME = "settings-rw.xml"
    SETTINGS_XML_RO_SECURE_FILE_NAME = "settings-ro.xml"
    HELM_RELEASE_NAME                = var.idpay-payment-instrument.repository.name

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
  idpay-payment-instrument-variables_secret_deploy = {

  }
}

module "idpay-payment-instrument_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v5.0.0"
  count  = var.idpay-payment-instrument.pipeline.enable_code_review == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-payment-instrument.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-payment-instrument.pipeline.path

  ci_trigger_use_yaml           = true
  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay-payment-instrument-variables,
    local.idpay-payment-instrument-variables_code_review,
  )

  variables_secret = merge(
    local.idpay-payment-instrument-variables_secret,
    local.idpay-payment-instrument-variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
    local.azuredevops_serviceendpoint_sonarcloud_id,
  ]
}

module "idpay-payment-instrument_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v5.0.0"
  count  = var.idpay-payment-instrument.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-payment-instrument.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-payment-instrument.pipeline.path
  ci_trigger_use_yaml          = true

  variables = merge(
    local.idpay-payment-instrument-variables,
    local.idpay-payment-instrument-variables_deploy,
  )

  variables_secret = merge(
    local.idpay-payment-instrument-variables_secret,
    local.idpay-payment-instrument-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_pr_id,

    local.service_endpoint_azure_dev_id,
    local.service_endpoint_azure_devops_docker_dev_id,
    azuredevops_serviceendpoint_kubernetes.aks_dev.id
  ]

}
