variable "idpay-portal-merchants-frontend" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-portal-merchants-frontend"
      path            = "idpay\\frontend"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      path               = "idpay\\idpay-portal-merchants-frontend"
    }
  }
}

locals {

  # deploy vars
  idpay-portal-merchants-frontend-variables_deploy = {
    AZURE_DEVOPS_GITHUB_RO = data.azuredevops_serviceendpoint_github.azure_devops_github_ro.service_endpoint_name

    DEV_AZURE_SUBSCRIPTION                                       = data.azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn.id
    DEV_CDN_ENDPOINT                                             = local.dev_cdn_endpoint
    DEV_CDN_PROFILE                                              = local.dev_cdn_profile
    DEV_RESOURCE_GROUP                                           = local.dev_storage_account_rg
    DEV_STORAGE_ACCOUNT                                          = local.dev_storage_account_name
    DEV_REACT_APP_URL_CDN                                        = local.dev_react_app_url_cdn
    DEV_REACT_APP_URL_FE_PRE_LOGIN_MERCHANTS                     = local.dev_react_app_url_fe_pre_login_merchants
    DEV_REACT_APP_URL_FE_LOGIN                                   = local.dev_react_app_url_fe_login
    DEV_REACT_APP_URL_FE_LANDING                                 = local.dev_react_app_url_fe_landing
    DEV_REACT_APP_URL_FE_ASSISTANCE_MERCHANTS                    = local.dev_react_app_url_fe_assistance_merchants
    DEV_REACT_APP_URL_API_MERCHANTS                              = local.dev_react_app_url_api_merchants
    DEV_REACT_APP_URL_API_MERCHANTS_PORTAL                       = local.dev_react_app_url_api_merchants_portal
    DEV_REACT_APP_URL_STORAGE                                    = local.dev_react_app_url_storage
    DEV_ANALYTICS_ENABLED                                        = local.dev_analytics_enabled
    DEV_ANALYTICS_MOCKED                                         = local.dev_analytics_mocked
    DEV_MIXPANEL_TOKEN                                           = local.dev_mixpanel_token
    DEV_ONETRUST_DOMAIN_ID                                       = local.dev_onetrust_domain_id
    DEV_REACT_APP_ONE_TRUST_OTNOTICE_CDN_URL                     = local.dev_react_app_one_trust_otnotice_cdn_url
    DEV_REACT_APP_ONE_TRUST_OTNOTICE_CDN_SETTINGS                = local.dev_react_app_one_trust_otnotice_cdn_settings
    DEV_REACT_APP_ONE_TRUST_PRIVACY_POLICY_ID_MERCHANTS          = local.dev_react_app_one_trust_privacy_policy_id_merchants
    DEV_REACT_APP_ONE_TRUST_PRIVACY_POLICY_JSON_URL_MERCHANTS    = local.dev_react_app_one_trust_privacy_policy_json_url_merchants
    DEV_REACT_APP_ONE_TRUST_TOS_ID_MERCHANTS                     = local.dev_react_app_one_trust_tos_id_merchants
    DEV_REACT_APP_ONE_TRUST_TOS_JSON_URL_MERCHANTS               = local.dev_react_app_one_trust_tos_json_url_merchants

    UAT_AZURE_SUBSCRIPTION                                       = data.azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn.id
    UAT_CDN_ENDPOINT                                             = local.uat_cdn_endpoint
    UAT_CDN_PROFILE                                              = local.uat_cdn_profile
    UAT_RESOURCE_GROUP                                           = local.uat_storage_account_rg
    UAT_STORAGE_ACCOUNT                                          = local.uat_storage_account_name
    UAT_REACT_APP_URL_CDN                                        = local.uat_react_app_url_cdn
    UAT_REACT_APP_URL_FE_PRE_LOGIN_MERCHANTS                     = local.uat_react_app_url_fe_pre_login_merchants
    UAT_REACT_APP_URL_FE_LOGIN                                   = local.uat_react_app_url_fe_login
    UAT_REACT_APP_URL_FE_LANDING                                 = local.uat_react_app_url_fe_landing
    UAT_REACT_APP_URL_FE_ASSISTANCE_MERCHANTS                    = local.uat_react_app_url_fe_assistance_merchants
    UAT_REACT_APP_URL_API_MERCHANTS                              = local.uat_react_app_url_api_merchants
    UAT_REACT_APP_URL_API_MERCHANTS_PORTAL                       = local.uat_react_app_url_api_merchants_portal
    UAT_REACT_APP_URL_STORAGE                                    = local.uat_react_app_url_storage
    UAT_ANALYTICS_ENABLED                                        = local.uat_analytics_enabled
    UAT_ANALYTICS_MOCKED                                         = local.uat_analytics_mocked
    UAT_MIXPANEL_TOKEN                                           = local.uat_mixpanel_token
    UAT_ONETRUST_DOMAIN_ID                                       = local.uat_onetrust_domain_id
    UAT_REACT_APP_ONE_TRUST_OTNOTICE_CDN_URL                     = local.uat_react_app_one_trust_otnotice_cdn_url
    UAT_REACT_APP_ONE_TRUST_OTNOTICE_CDN_SETTINGS                = local.uat_react_app_one_trust_otnotice_cdn_settings
    UAT_REACT_APP_ONE_TRUST_PRIVACY_POLICY_ID_MERCHANTS          = local.uat_react_app_one_trust_privacy_policy_id_merchants
    UAT_REACT_APP_ONE_TRUST_PRIVACY_POLICY_JSON_URL_MERCHANTS    = local.uat_react_app_one_trust_privacy_policy_json_url_merchants
    UAT_REACT_APP_ONE_TRUST_TOS_ID_MERCHANTS                     = local.uat_react_app_one_trust_tos_id_merchants
    UAT_REACT_APP_ONE_TRUST_TOS_JSON_URL_MERCHANTS               = local.uat_react_app_one_trust_tos_json_url_merchants

    PROD_AZURE_SUBSCRIPTION                                       = data.azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn.id
    PROD_CDN_ENDPOINT                                             = local.prod_cdn_endpoint
    PROD_CDN_PROFILE                                              = local.prod_cdn_profile
    PROD_RESOURCE_GROUP                                           = local.prod_storage_account_rg
    PROD_STORAGE_ACCOUNT                                          = local.prod_storage_account_name
    PROD_REACT_APP_URL_CDN                                        = local.prod_react_app_url_cdn
    PROD_REACT_APP_URL_FE_PRE_LOGIN_MERCHANTS                     = local.prod_react_app_url_fe_pre_login_merchants
    PROD_REACT_APP_URL_FE_LOGIN                                   = local.prod_react_app_url_fe_login
    PROD_REACT_APP_URL_FE_LANDING                                 = local.prod_react_app_url_fe_landing
    PROD_REACT_APP_URL_FE_ASSISTANCE_MERCHANTS                    = local.prod_react_app_url_fe_assistance_merchants
    PROD_REACT_APP_URL_API_MERCHANTS                              = local.prod_react_app_url_api_merchants
    PROD_REACT_APP_URL_API_MERCHANTS_PORTAL                       = local.prod_react_app_url_api_merchants_portal
    PROD_REACT_APP_URL_STORAGE                                    = local.prod_react_app_url_storage
    PROD_ANALYTICS_ENABLED                                        = local.prod_analytics_enabled
    PROD_ANALYTICS_MOCKED                                         = local.prod_analytics_mocked
    PROD_MIXPANEL_TOKEN                                           = local.prod_mixpanel_token
    PROD_ONETRUST_DOMAIN_ID                                       = local.prod_onetrust_domain_id
    PROD_REACT_APP_ONE_TRUST_OTNOTICE_CDN_URL                     = local.prod_react_app_one_trust_otnotice_cdn_url
    PROD_REACT_APP_ONE_TRUST_OTNOTICE_CDN_SETTINGS                = local.prod_react_app_one_trust_otnotice_cdn_settings
    PROD_REACT_APP_ONE_TRUST_PRIVACY_POLICY_ID_MERCHANTS          = local.prod_react_app_one_trust_privacy_policy_id_merchants
    PROD_REACT_APP_ONE_TRUST_PRIVACY_POLICY_JSON_URL_MERCHANTS    = local.prod_react_app_one_trust_privacy_policy_json_url_merchants
    PROD_REACT_APP_ONE_TRUST_TOS_ID_MERCHANTS                     = local.prod_react_app_one_trust_tos_id_merchants
    PROD_REACT_APP_ONE_TRUST_TOS_JSON_URL_MERCHANTS               = local.prod_react_app_one_trust_tos_json_url_merchants


  }
}

module "idpay-fe-merchants_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.idpay-portal-merchants-frontend.repository
  github_service_connection_id = data.azuredevops_serviceendpoint_github.azure_devops_github_rw.id


  pipeline_name            = "${local.product}-fe-merchants-welfare.deploy"
  pipeline_yml_filename    = "deploy-pipelines.yml"
  path                     = var.idpay-portal-merchants-frontend.pipeline.path

  ci_trigger_enabled  = true
  ci_trigger_use_yaml = true

  variables = merge(
    local.idpay-portal-merchants-frontend-variables_deploy,
  )

  variables_secret = {}

  service_connection_ids_authorization = [
    data.service_endpoint_io_azure_devops_github_ro_id,
    data.azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn.id,
    data.azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn.id,
    data.azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn.id,
  ]

}
