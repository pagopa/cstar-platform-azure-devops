variable "rtp_iac" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "cstar-infrastructure"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = "rtp"
    }
    pipeline = {
      enable_code_review   = true
      enable_deploy        = true
      path                 = "rtp-infrastructure"
      pipeline_name_prefix = "rtp-infra"
    }
  }
}

locals {
  # global vars
  rtp_iac_variables = {
    #dev
    # tf_dev01_aks_apiserver_url         = module.rtp_dev_secrets.values["cstar-d-weu-dev01-aks-apiserver-url"].value,
    # tf_dev01_aks_azure_devops_sa_cacrt = module.rtp_dev_secrets.values["cstar-d-weu-dev01-aks-azure-devops-sa-cacrt"].value,
    # tf_dev01_aks_azure_devops_sa_token = base64decode(module.rtp_dev_secrets.values["cstar-d-weu-dev01-aks-azure-devops-sa-token"].value),
    tf_aks_dev_name                    = var.aks_dev_platform_name
    #uat
    # tf_uat01_aks_apiserver_url         = module.rtp_uat_secrets.values["cstar-u-weu-uat01-aks-apiserver-url"].value,
    # tf_uat01_aks_azure_devops_sa_cacrt = module.rtp_uat_secrets.values["cstar-u-weu-uat01-aks-azure-devops-sa-cacrt"].value,
    # tf_uat01_aks_azure_devops_sa_token = base64decode(module.rtp_uat_secrets.values["cstar-u-weu-uat01-aks-azure-devops-sa-token"].value),
    tf_aks_uat_name                    = var.aks_uat_platform_name
    #prod
    # tf_prod01_aks_apiserver_url         = module.rtp_prod_secrets.values["cstar-p-weu-prod01-aks-apiserver-url"].value,
    # tf_prod01_aks_azure_devops_sa_cacrt = module.rtp_prod_secrets.values["cstar-p-weu-prod01-aks-azure-devops-sa-cacrt"].value,
    # tf_prod01_aks_azure_devops_sa_token = base64decode(module.rtp_prod_secrets.values["cstar-p-weu-prod01-aks-azure-devops-sa-token"].value),
    tf_aks_prod_name                    = var.aks_prod_platform_name

  }
  # global secrets
  rtp_iac_variables_secret = {}

  # code_review vars
  rtp_iac_variables_code_review = {}
  # code_review secrets
  rtp_iac_variables_secret_code_review = {}

  # deploy vars
  rtp_iac_variables_deploy = {}
  # deploy secrets
  rtp_iac_variables_secret_deploy = {}
}

module "rtp_iac_code_review" {
  #   source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v5.2.0"
  source = "./.terraform/modules/__azdo__/azuredevops_build_definition_code_review"

  count = var.rtp_iac.pipeline.enable_code_review == true ? 1 : 0
  path  = var.rtp_iac.pipeline.path

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.rtp_iac.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  pipeline_name_prefix = var.rtp_iac.pipeline.pipeline_name_prefix

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.rtp_iac_variables,
    local.rtp_iac_variables_code_review,
  )

  variables_secret = merge(
    local.rtp_iac_variables_secret,
    local.rtp_iac_variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id,
    module.DEV-CSTAR-PLAN-SERVICE-CONN.service_endpoint_id,
    module.UAT-CSTAR-PLAN-SERVICE-CONN.service_endpoint_id,
    module.PROD-CSTAR-PLAN-SERVICE-CONN.service_endpoint_id,
  ]
}

module "rtp_iac_deploy" {
  #   source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v5.2.0"
  source = "./.terraform/modules/__azdo__/azuredevops_build_definition_deploy"

  count = var.rtp_iac.pipeline.enable_deploy == true ? 1 : 0
  path  = var.rtp_iac.pipeline.path

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.rtp_iac.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  pipeline_name_prefix = var.rtp_iac.pipeline.pipeline_name_prefix

  ci_trigger_use_yaml = true

  variables = merge(
    local.rtp_iac_variables,
    local.rtp_iac_variables_deploy,
  )

  variables_secret = merge(
    local.rtp_iac_variables_secret,
    local.rtp_iac_variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id,
    azuredevops_serviceendpoint_azurerm.DEV-CSTAR.id,
    azuredevops_serviceendpoint_azurerm.UAT-CSTAR.id,
    azuredevops_serviceendpoint_azurerm.PROD-CSTAR.id,
  ]
}
