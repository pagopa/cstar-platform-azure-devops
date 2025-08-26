variable "idpay-portal-welfare-frontend" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-welfare-portal-frontend"
      path            = "idpay\\frontend"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      path = "idpay\\idpay-portal-welfare-frontend"
    }
  }
}

locals {


  # deploy vars
  idpay_portal_welfare_frontend_variables_deploy = {

    blob_container_name    = "$web"
    AZURE_DEVOPS_GITHUB_RO = local.service_connection_github_ro_name

    DEV_AZURE_SUBSCRIPTION                          = local.dev_service_endpoint_azure_id
    DEV_CDN_ENDPOINT                                = local.dev_welfare_cdn_endpoint
    DEV_CDN_PROFILE                                 = local.dev_welfare_cdn_profile
    DEV_RESOURCE_GROUP                              = local.dev_storage_account_rg
    DEV_STORAGE_ACCOUNT                             = local.dev_welfare_storage_account_name
    DEV_REACT_APP_URL_CDN                           = local.dev_react_app_url_cdn
    DEV_REACT_APP_URL_FE_PRE_LOGIN                  = local.dev_react_app_url_fe_pre_login
    DEV_REACT_APP_URL_FE_LOGIN                      = local.dev_react_app_url_fe_login
    DEV_REACT_APP_URL_FE_LANDING                    = local.dev_react_app_url_fe_landing
    DEV_REACT_APP_URL_FE_ASSISTANCE_PORTAL          = local.dev_react_app_url_fe_assistance_portal
    DEV_REACT_APP_URL_API_INITIATIVE                = local.dev_react_app_url_api_initiative
    DEV_REACT_APP_URL_API_GROUPS                    = local.dev_react_app_url_api_groups
    DEV_REACT_APP_URL_API_ROLE_PERMISSION           = local.dev_react_app_url_api_role_permission
    DEV_REACT_APP_URL_API_EMAIL_NOTIFICATION        = local.dev_react_app_url_api_email_notification
    DEV_REACT_APP_URL_API_MERCHANTS                 = local.dev_react_app_url_api_merchants
    DEV_REACT_APP_URL_STORAGE                       = local.dev_react_app_url_storage
    DEV_ANALYTICS_ENABLED                           = local.dev_analytics_enabled
    DEV_ANALYTICS_MOCKED                            = local.dev_analytics_mocked
    DEV_MIXPANEL_TOKEN                              = local.dev_mixpanel_token
    DEV_ONETRUST_DOMAIN_ID                          = local.dev_onetrust_domain_id
    DEV_REACT_APP_ONE_TRUST_OTNOTICE_CDN_URL        = local.dev_react_app_one_trust_otnotice_cdn_url
    DEV_REACT_APP_ONE_TRUST_OTNOTICE_CDN_SETTINGS   = local.dev_react_app_one_trust_otnotice_cdn_settings
    DEV_REACT_APP_ONE_TRUST_PRIVACY_POLICY_ID       = local.dev_react_app_one_trust_privacy_policy_id
    DEV_REACT_APP_ONE_TRUST_PRIVACY_POLICY_JSON_URL = local.dev_react_app_one_trust_privacy_policy_json_url
    DEV_REACT_APP_ONE_TRUST_TOS_ID                  = local.dev_react_app_one_trust_tos_id
    DEV_REACT_APP_ONE_TRUST_TOS_JSON_URL            = local.dev_react_app_one_trust_tos_json_url

    UAT_AZURE_SUBSCRIPTION                          = local.uat_service_endpoint_azure_id
    UAT_CDN_ENDPOINT                                = local.uat_welfare_cdn_endpoint
    UAT_CDN_PROFILE                                 = local.uat_welfare_cdn_profile
    UAT_RESOURCE_GROUP                              = local.uat_storage_account_rg
    UAT_STORAGE_ACCOUNT                             = local.uat_welfare_storage_account_name
    UAT_REACT_APP_URL_CDN                           = local.uat_react_app_url_cdn
    UAT_REACT_APP_URL_FE_PRE_LOGIN                  = local.uat_react_app_url_fe_pre_login
    UAT_REACT_APP_URL_FE_LOGIN                      = local.uat_react_app_url_fe_login
    UAT_REACT_APP_URL_FE_LANDING                    = local.uat_react_app_url_fe_landing
    UAT_REACT_APP_URL_FE_ASSISTANCE_PORTAL          = local.uat_react_app_url_fe_assistance_portal
    UAT_REACT_APP_URL_API_INITIATIVE                = local.uat_react_app_url_api_initiative
    UAT_REACT_APP_URL_API_GROUPS                    = local.uat_react_app_url_api_groups
    UAT_REACT_APP_URL_API_ROLE_PERMISSION           = local.uat_react_app_url_api_role_permission
    UAT_REACT_APP_URL_API_EMAIL_NOTIFICATION        = local.uat_react_app_url_api_email_notification
    UAT_REACT_APP_URL_API_MERCHANTS                 = local.uat_react_app_url_api_merchants
    UAT_REACT_APP_URL_STORAGE                       = local.uat_react_app_url_storage
    UAT_ANALYTICS_ENABLED                           = local.uat_analytics_enabled
    UAT_ANALYTICS_MOCKED                            = local.uat_analytics_mocked
    UAT_MIXPANEL_TOKEN                              = local.uat_mixpanel_token
    UAT_ONETRUST_DOMAIN_ID                          = local.uat_onetrust_domain_id
    UAT_REACT_APP_ONE_TRUST_OTNOTICE_CDN_URL        = local.uat_react_app_one_trust_otnotice_cdn_url
    UAT_REACT_APP_ONE_TRUST_OTNOTICE_CDN_SETTINGS   = local.uat_react_app_one_trust_otnotice_cdn_settings
    UAT_REACT_APP_ONE_TRUST_PRIVACY_POLICY_ID       = local.uat_react_app_one_trust_privacy_policy_id
    UAT_REACT_APP_ONE_TRUST_PRIVACY_POLICY_JSON_URL = local.uat_react_app_one_trust_privacy_policy_json_url
    UAT_REACT_APP_ONE_TRUST_TOS_ID                  = local.uat_react_app_one_trust_tos_id
    UAT_REACT_APP_ONE_TRUST_TOS_JSON_URL            = local.uat_react_app_one_trust_tos_json_url

    PROD_AZURE_SUBSCRIPTION                          = local.prod_service_endpoint_azure_id
    PROD_CDN_ENDPOINT                                = local.prod_welfare_cdn_endpoint
    PROD_CDN_PROFILE                                 = local.prod_welfare_cdn_profile
    PROD_RESOURCE_GROUP                              = local.prod_storage_account_rg
    PROD_STORAGE_ACCOUNT                             = local.prod_welfare_storage_account_name
    PROD_REACT_APP_URL_CDN                           = local.prod_react_app_url_cdn
    PROD_REACT_APP_URL_FE_PRE_LOGIN                  = local.prod_react_app_url_fe_pre_login
    PROD_REACT_APP_URL_FE_LOGIN                      = local.prod_react_app_url_fe_login
    PROD_REACT_APP_URL_FE_LANDING                    = local.prod_react_app_url_fe_landing
    PROD_REACT_APP_URL_FE_ASSISTANCE_PORTAL          = local.prod_react_app_url_fe_assistance_portal
    PROD_REACT_APP_URL_API_INITIATIVE                = local.prod_react_app_url_api_initiative
    PROD_REACT_APP_URL_API_GROUPS                    = local.prod_react_app_url_api_groups
    PROD_REACT_APP_URL_API_ROLE_PERMISSION           = local.prod_react_app_url_api_role_permission
    PROD_REACT_APP_URL_API_EMAIL_NOTIFICATION        = local.prod_react_app_url_api_email_notification
    PROD_REACT_APP_URL_API_MERCHANTS                 = local.prod_react_app_url_api_merchants
    PROD_REACT_APP_URL_STORAGE                       = local.prod_react_app_url_storage
    PROD_ANALYTICS_ENABLED                           = local.prod_analytics_enabled
    PROD_ANALYTICS_MOCKED                            = local.prod_analytics_mocked
    PROD_MIXPANEL_TOKEN                              = local.prod_mixpanel_token
    PROD_ONETRUST_DOMAIN_ID                          = local.prod_onetrust_domain_id
    PROD_REACT_APP_ONE_TRUST_OTNOTICE_CDN_URL        = local.prod_react_app_one_trust_otnotice_cdn_url
    PROD_REACT_APP_ONE_TRUST_OTNOTICE_CDN_SETTINGS   = local.prod_react_app_one_trust_otnotice_cdn_settings
    PROD_REACT_APP_ONE_TRUST_PRIVACY_POLICY_ID       = local.prod_react_app_one_trust_privacy_policy_id
    PROD_REACT_APP_ONE_TRUST_PRIVACY_POLICY_JSON_URL = local.prod_react_app_one_trust_privacy_policy_json_url
    PROD_REACT_APP_ONE_TRUST_TOS_ID                  = local.prod_react_app_one_trust_tos_id
    PROD_REACT_APP_ONE_TRUST_TOS_JSON_URL            = local.prod_react_app_one_trust_tos_json_url


  }

}


module "idpay-fe-welfare_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.idpay-portal-welfare-frontend.repository
  github_service_connection_id = local.service_connection_github_ro_id


  pipeline_name         = "${local.product}-fe-welfare.deploy"
  pipeline_yml_filename = "deploy-pipelines.yml"
  path                  = var.idpay-portal-welfare-frontend.pipeline.path

  ci_trigger_enabled  = true
  ci_trigger_use_yaml = true

  variables = merge(
    local.idpay_portal_welfare_frontend_variables_deploy,
  )

  variables_secret = {}

  service_connection_ids_authorization = [
    local.service_connection_github_ro_id,
    local.dev_service_endpoint_azure_id,
    local.uat_service_endpoint_azure_id,
    local.prod_service_endpoint_azure_id
  ]

}
