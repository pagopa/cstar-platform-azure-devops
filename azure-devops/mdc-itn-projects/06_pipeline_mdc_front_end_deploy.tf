variable "rtp_front_end_deploy" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "rtp-start-app"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
      path               = "mdc"
    }
  }
}

locals {

  # deploy vars
  rtp_front_end_variables_deploy = {
    AZURE_DEVOPS_GITHUB_RO = azuredevops_serviceendpoint_github.bot_github_ro.service_endpoint_name

    DEV_AZURE_SUBSCRIPTION   = data.azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn.id
    DEV_STORAGE_ACCOUNT_RG   = local.dev_data_rg_name
    DEV_STORAGE_ACCOUNT_NAME = local.dev_storage_account_name
    DEV_CDN_ENDPOINT         = local.dev_cdn_endpoint
    DEV_CDN_PROFILE          = local.dev_cdn_profile

    UAT_AZURE_SUBSCRIPTION   = data.azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn.id
    UAT_STORAGE_ACCOUNT_RG   = local.uat_data_rg_name
    UAT_STORAGE_ACCOUNT_NAME = local.uat_storage_account_name
    UAT_CDN_ENDPOINT         = local.uat_cdn_endpoint
    UAT_CDN_PROFILE          = local.uat_cdn_profile

    PROD_AZURE_SUBSCRIPTION   = data.azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn.id
    PROD_STORAGE_ACCOUNT_RG   = local.prod_data_rg_name
    PROD_STORAGE_ACCOUNT_NAME = local.prod_storage_account_name
    PROD_CDN_ENDPOINT         = local.prod_cdn_endpoint
    PROD_CDN_PROFILE          = local.prod_cdn_profile
  }
}

module "rtp-front-end-deploy_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_deploy"

  project_id                   = data.azuredevops_project.this.id
  repository                   = var.rtp_front_end_deploy.repository
  github_service_connection_id = local.service_connection_github_pr_id

  path = var.rtp_front_end_deploy.pipeline.path

  ci_trigger_use_yaml = true

  variables = merge(
    local.rtp_front_end_variables_deploy,
  )

  variables_secret = {}

  service_connection_ids_authorization = [
    local.service_connection_github_pr_id,

    local.dev_service_endpoint_azure_id,
    local.uat_service_endpoint_azure_id,
    local.prod_service_endpoint_azure_id,
  ]
}
