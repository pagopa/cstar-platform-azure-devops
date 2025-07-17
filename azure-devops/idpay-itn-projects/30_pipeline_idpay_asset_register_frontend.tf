variable "idpay_asset_register_frontend" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-asset-register-frontend"
      path            = "idpay\\frontend"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      path = "idpay\\idpay-asset-register-frontend"
    }
  }
}

locals {

  # deploy vars
  idpay_register_frontend_variables_deploy = {
    AZURE_DEVOPS_GITHUB_RO = local.service_connection_github_ro_name
    BLOB_CONTAINER_NAME    = "$web"

    DEV_AZURE_SUBSCRIPTION                 = local.dev_service_endpoint_azure_id
    DEV_CDN_ENDPOINT                       = local.dev_cdn_endpoint
    DEV_CDN_PROFILE                        = local.dev_cdn_profile
    DEV_RESOURCE_GROUP                     = local.dev_welfare_storage_account_rg
    DEV_STORAGE_ACCOUNT                    = local.dev_storage_asset_register_account_name
    DEV_REACT_APP_URL_CDN                  = local.dev_react_app_asset_register_url_cdn
    DEV_REACT_APP_URL_FE_PRE_LOGIN         = local.dev_react_app_asset_register_url_fe_pre_login
    DEV_REACT_APP_URL_FE_LOGIN             = local.dev_react_app_asset_register_url_fe_login
    DEV_REACT_APP_URL_FE_LANDING           = local.dev_react_app_asset_register_url_fe_landing
    DEV_REACT_APP_URL_FE_ASSISTANCE_PORTAL = local.dev_react_app_asset_register_url_fe_assistance_portal
    DEV_REACT_APP_URL_STORAGE              = local.dev_react_app_asset_register_url_storage
    DEV_REACT_APP_URL_API_REGISTER         = local.dev_react_app_url_api_register

    UAT_AZURE_SUBSCRIPTION                 = local.uat_service_endpoint_azure_id
    UAT_CDN_ENDPOINT                       = local.uat_cdn_endpoint
    UAT_CDN_PROFILE                        = local.uat_cdn_profile
    UAT_RESOURCE_GROUP                     = local.uat_welfare_storage_account_rg
    UAT_STORAGE_ACCOUNT                    = local.uat_storage_asset_register_account_name
    UAT_REACT_APP_URL_CDN                  = local.uat_react_app_asset_register_url_cdn
    UAT_REACT_APP_URL_FE_PRE_LOGIN         = local.uat_react_app_asset_register_url_fe_pre_login
    UAT_REACT_APP_URL_FE_LOGIN             = local.uat_react_app_asset_register_url_fe_login
    UAT_REACT_APP_URL_FE_LANDING           = local.uat_react_app_asset_register_url_fe_landing
    UAT_REACT_APP_URL_FE_ASSISTANCE_PORTAL = local.uat_react_app_asset_register_url_fe_assistance_portal
    UAT_REACT_APP_URL_STORAGE              = local.uat_react_app_asset_register_url_storage
    UAT_REACT_APP_URL_API_REGISTER         = local.uat_react_app_url_api_register

    PROD_AZURE_SUBSCRIPTION                 = local.prod_service_endpoint_azure_id
    PROD_CDN_ENDPOINT                       = local.prod_cdn_endpoint
    PROD_CDN_PROFILE                        = local.prod_cdn_profile
    PROD_RESOURCE_GROUP                     = local.prod_welfare_storage_account_rg
    PROD_STORAGE_ACCOUNT                    = local.prod_storage_asset_register_account_name
    PROD_REACT_APP_URL_CDN                  = local.prod_react_app_asset_register_url_cdn
    PROD_REACT_APP_URL_FE_PRE_LOGIN         = local.prod_react_app_asset_register_url_fe_pre_login
    PROD_REACT_APP_URL_FE_LOGIN             = local.prod_react_app_asset_register_url_fe_login
    PROD_REACT_APP_URL_FE_LANDING           = local.prod_react_app_asset_register_url_fe_landing
    PROD_REACT_APP_URL_FE_ASSISTANCE_PORTAL = local.prod_react_app_asset_register_url_fe_assistance_portal
    PROD_REACT_APP_URL_STORAGE              = local.prod_react_app_asset_register_url_storage
    PROD_REACT_APP_URL_API_REGISTER         = local.prod_react_app_url_api_register

  }
}

module "idpay-fe-register_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.idpay_asset_register_frontend.repository
  github_service_connection_id = local.service_connection_github_ro_id


  pipeline_name         = "${local.product}-fe-asset-register.deploy"
  pipeline_yml_filename = "deploy-pipelines.yml"
  path                  = var.idpay_asset_register_frontend.pipeline.path

  ci_trigger_enabled  = true
  ci_trigger_use_yaml = true

  variables = merge(
    local.idpay_register_frontend_variables_deploy,
  )

  variables_secret = {}

  service_connection_ids_authorization = [
    local.service_connection_github_ro_id,
    local.dev_service_endpoint_azure_id,
    local.uat_service_endpoint_azure_id,
    local.prod_service_endpoint_azure_id
  ]

}
