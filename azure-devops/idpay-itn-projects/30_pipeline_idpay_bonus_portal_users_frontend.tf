variable "idpay-portal-users-frontend" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-portal-users-frontend"
      path            = "idpay\\frontend"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      path = "idpay\\idpay-portal-bonus-users-frontend"
    }
  }
}

locals {

  # deploy vars
  idpay_portal_users_frontend_variables_deploy = {

    blob_container_name    = "$web"
    AZURE_DEVOPS_GITHUB_RO = local.service_connection_github_ro_name

    DEV_AZURE_SUBSCRIPTION = local.dev_service_endpoint_azure_id
    DEV_CDN_ENDPOINT       = local.dev_bonus_portal_users_cdn_endpoint
    DEV_CDN_PROFILE        = local.dev_bonus_portal_users_cdn_profile
    DEV_RESOURCE_GROUP     = local.dev_storage_account_rg
    DEV_STORAGE_ACCOUNT    = local.dev_bonus_portal_users_account_name
    DEV_ANALYTICS_ENABLED  = local.dev_analytics_enabled
    DEV_ANALYTICS_MOCKED   = local.dev_analytics_mocked
    #DEV_VITE_KEYCLOAK_URL       = local.dev_vite_keycloak_url
    #DEV_VITE_KEYCLOAK_REALM     = local.dev_vite_keycloak_realm
    #DEV_VITE_KEYCLOAK_CLIENT_ID = local.dev_vite_keycloak_client_id


    UAT_AZURE_SUBSCRIPTION = local.uat_service_endpoint_azure_id
    UAT_ANALYTICS_ENABLED  = local.uat_analytics_enabled
    UAT_ANALYTICS_MOCKED   = local.uat_analytics_mocked
    UAT_CDN_ENDPOINT       = local.uat_bonus_portal_users_cdn_endpoint
    UAT_CDN_PROFILE        = local.uat_bonus_portal_users_cdn_profile
    UAT_RESOURCE_GROUP     = local.uat_storage_account_rg
    UAT_STORAGE_ACCOUNT    = local.uat_bonus_portal_users_account_name
    #UAT_VITE_KEYCLOAK_URL       = local.uat_vite_keycloak_url
    #UAT_VITE_KEYCLOAK_REALM     = local.uat_vite_keycloak_realm
    #UAT_VITE_KEYCLOAK_CLIENT_ID = local.uat_vite_keycloak_client_id

    PROD_AZURE_SUBSCRIPTION = local.prod_service_endpoint_azure_id
    PROD_ANALYTICS_ENABLED  = local.prod_analytics_enabled
    PROD_ANALYTICS_MOCKED   = local.prod_analytics_mocked
    PROD_CDN_ENDPOINT       = local.prod_bonus_portal_users_cdn_endpoint
    PROD_CDN_PROFILE        = local.prod_bonus_portal_users_cdn_profile
    PROD_RESOURCE_GROUP     = local.prod_storage_account_rg
    PROD_STORAGE_ACCOUNT    = local.prod_bonus_portal_users_account_name
    #PROD_VITE_KEYCLOAK_URL       = local.prod_vite_keycloak_url
    #PROD_VITE_KEYCLOAK_REALM     = local.prod_vite_keycloak_realm
    #PROD_VITE_KEYCLOAK_CLIENT_ID = local.prod_vite_keycloak_client_id

  }
}

module "idpay-fe-users_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.idpay-portal-users-frontend.repository
  github_service_connection_id = local.service_connection_github_ro_id


  pipeline_name         = "${local.product}-fe-users.deploy"
  pipeline_yml_filename = "deploy-pipelines.yml"
  path                  = var.idpay-portal-users-frontend.pipeline.path

  ci_trigger_enabled  = true
  ci_trigger_use_yaml = true

  variables = merge(
    local.idpay_portal_users_frontend_variables_deploy,
  )

  variables_secret = {}

  service_connection_ids_authorization = [
    local.service_connection_github_ro_id,
    local.dev_service_endpoint_azure_id,
    local.uat_service_endpoint_azure_id,
    local.prod_service_endpoint_azure_id
  ]

}
