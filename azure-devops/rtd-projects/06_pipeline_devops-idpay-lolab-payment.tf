variable "idpay-lolab-payment" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-lolab-payment"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = "cstar-rtd"
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
      path               = "rtd\\idpay-lolab-payment"
    }
  }
}

locals {
  # global vars
  idpay-lolab-payment-variables = {
    dockerfile = "Dockerfile"
  }
  # global secrets
  idpay-lolab-payment-variables_secret = {

  }
  # code_review vars
  idpay-lolab-payment-variables_code_review = {
    sonarcloud_service_conn = "SONARCLOUD-SERVICE-CONN"
    sonarcloud_org          = var.idpay-lolab-payment.repository.organization
    sonarcloud_project_key  = "${var.idpay-lolab-payment.repository.organization}_${var.idpay-lolab-payment.repository.name}"
    sonarcloud_project_name = var.idpay-lolab-payment.repository.name
  }
  # code_review secrets
  idpay-lolab-payment-variables_secret_code_review = {

  }
  # deploy vars
  idpay-lolab-payment-variables_deploy = {
    K8S_IMAGE_REPOSITORY_NAME        = replace(var.idpay-lolab-payment.repository.name, "-", "")
    DEPLOY_NAMESPACE                 = local.domain
    SETTINGS_XML_RW_SECURE_FILE_NAME = "settings-rw.xml"
    SETTINGS_XML_RO_SECURE_FILE_NAME = "settings-ro.xml"
    HELM_RELEASE_NAME                = var.idpay-lolab-payment.repository.name

    DEV_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_dev_name
    DEV_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_dev
    DEV_CONTAINER_REGISTRY_NAME         = local.aks_dev_docker_registry_name
    DEV_AGENT_POOL                      = local.azdo_agent_pool_dev
  }

  # deploy secrets
  idpay-lolab-payment-variables_secret_deploy = {
        DEV_RTD_WORKLOAD_IDENTITY_CLIENT_ID  = module.domain_dev_secrets.values["rtd-workload-identity-client-id"].value
    UAT_RTD_WORKLOAD_IDENTITY_CLIENT_ID  = module.domain_uat_secrets.values["rtd-workload-identity-client-id"].value
    PROD_RTD_WORKLOAD_IDENTITY_CLIENT_ID = module.domain_prod_secrets.values["rtd-workload-identity-client-id"].value

  }
}

module "idpay-lolab-payment_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v5.4.0"
  count  = var.idpay-lolab-payment.pipeline.enable_code_review == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-lolab-payment.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-lolab-payment.pipeline.path

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay-lolab-payment-variables,
    local.idpay-lolab-payment-variables_code_review,
  )

  variables_secret = merge(
    local.idpay-lolab-payment-variables_secret,
    local.idpay-lolab-payment-variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
    data.azuredevops_serviceendpoint_sonarcloud.sonar_cloud.id,
  ]
}

module "idpay-lolab-payment_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v5.4.0"
  count  = var.idpay-lolab-payment.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-lolab-payment.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-lolab-payment.pipeline.path

  ci_trigger_use_yaml = true

  variables = merge(
    local.idpay-lolab-payment-variables,
    local.idpay-lolab-payment-variables_deploy,
  )

  variables_secret = merge(
    local.idpay-lolab-payment-variables_secret,
    local.idpay-lolab-payment-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_pr_id,

    local.service_endpoint_azure_dev_id,
    local.service_endpoint_azure_devops_docker_dev_id,
    azuredevops_serviceendpoint_kubernetes.aks_dev.id,

  ]
}
