variable "rtd-ms-payment-instrument" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "rtd-ms-payment-instrument"
      branch_name     = "refs/heads/develop"
      pipelines_path  = ".devops"
      yml_prefix_name = "cstar-rtd"
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
      path               = "rtd\\rtd-ms-payment-instrument"
    }
  }
}

locals {
  # global vars
  rtd-ms-payment-instrument-variables = {
    dockerfile = "Dockerfile"
  }
  # global secrets
  rtd-ms-payment-instrument-variables_secret = {

  }
  # code_review vars
  rtd-ms-payment-instrument-variables_code_review = {
    sonarcloud_service_conn = "SONARCLOUD-SERVICE-CONN"
    sonarcloud_org          = var.rtd-ms-payment-instrument.repository.organization
    sonarcloud_project_key  = "${var.rtd-ms-payment-instrument.repository.organization}_${var.rtd-ms-payment-instrument.repository.name}"
    sonarcloud_project_name = var.rtd-ms-payment-instrument.repository.name
  }
  # code_review secrets
  rtd-ms-payment-instrument-variables_secret_code_review = {

  }
  # deploy vars
  rtd-ms-payment-instrument-variables_deploy = {
    K8S_IMAGE_REPOSITORY_NAME        = replace(var.rtd-ms-payment-instrument.repository.name, "-", "")
    DEPLOY_NAMESPACE                 = local.domain
    SETTINGS_XML_RW_SECURE_FILE_NAME = "settings-rw.xml"
    SETTINGS_XML_RO_SECURE_FILE_NAME = "settings-ro.xml"
    HELM_RELEASE_NAME                = var.rtd-ms-payment-instrument.repository.name

    DEV_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_dev_name
    DEV_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_dev
    DEV_CONTAINER_REGISTRY_NAME         = local.aks_dev_docker_registry_name
    DEV_AGENT_POOL                      = local.azdo_agent_pool_dev

    # UAT_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_uat_name
    # UAT_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_uat
    # UAT_CONTAINER_REGISTRY_NAME         = local.aks_uat_docker_registry_name
    # UAT_AGENT_POOL                      = local.azdo_agent_pool_uat

    #    PROD_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_prod_name
    #    PROD_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_prod
    #    PROD_CONTAINER_REGISTRY_NAME         = local.aks_prod_docker_registry_name
    #    PROD_AGENT_POOL                      = local.azdo_agent_pool_prod

  }
  # deploy secrets
  rtd-ms-payment-instrument-variables_secret_deploy = {
    DEV_RTD_WORKLOAD_IDENTITY_CLIENT_ID  = module.domain_dev_secrets.values["rtd-workload-identity-client-id"].value
    UAT_RTD_WORKLOAD_IDENTITY_CLIENT_ID  = module.domain_uat_secrets.values["rtd-workload-identity-client-id"].value
    PROD_RTD_WORKLOAD_IDENTITY_CLIENT_ID = module.domain_prod_secrets.values["rtd-workload-identity-client-id"].value

  }
}

module "rtd-ms-payment-instrument_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v5.4.0"
  count  = var.rtd-ms-payment-instrument.pipeline.enable_code_review == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.rtd-ms-payment-instrument.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.rtd-ms-payment-instrument.pipeline.path

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.rtd-ms-payment-instrument-variables,
    local.rtd-ms-payment-instrument-variables_code_review,
  )

  variables_secret = merge(
    local.rtd-ms-payment-instrument-variables_secret,
    local.rtd-ms-payment-instrument-variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
    data.azuredevops_serviceendpoint_sonarcloud.sonar_cloud.id,
  ]
}

module "rtd-ms-payment-instrument_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v5.4.0"
  count  = var.rtd-ms-payment-instrument.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.rtd-ms-payment-instrument.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.rtd-ms-payment-instrument.pipeline.path

  ci_trigger_use_yaml = true

  variables = merge(
    local.rtd-ms-payment-instrument-variables,
    local.rtd-ms-payment-instrument-variables_deploy,
  )

  variables_secret = merge(
    local.rtd-ms-payment-instrument-variables_secret,
    local.rtd-ms-payment-instrument-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_pr_id,

    local.service_endpoint_azure_dev_id,
    local.service_endpoint_azure_devops_docker_dev_id,
    azuredevops_serviceendpoint_kubernetes.aks_dev.id,
    /*

    local.service_endpoint_azure_uat_id,
    local.service_endpoint_azure_devops_docker_uat_id,
    azuredevops_serviceendpoint_kubernetes.aks_uat.id,

    local.service_endpoint_azure_prod_id,
    local.service_endpoint_azure_devops_docker_prod_id,
    azuredevops_serviceendpoint_kubernetes.aks_prod.id */
  ]
}
