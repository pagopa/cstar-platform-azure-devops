variable "multi_initiative_portal_user_frontend" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-portal-users-frontend"
      branch_name     = "refs/heads/deploy-multi-initiative"
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
  multi_initiative_portal_user_frontend_variables_deploy = {

    blob_container_name    = "$web"
    AZURE_DEVOPS_GITHUB_RO = local.service_connection_github_ro_name

    DEV_AZURE_SUBSCRIPTION        = local.dev_service_endpoint_azure_id
    DEV_CDN_ENDPOINT              = "cstar-d-itn-idpay-cdn-web"
    DEV_CDN_PROFILE               = "cstar-d-itn-idpay-multi-initiative-cdn-profile"
    DEV_RESOURCE_GROUP            = local.dev_storage_account_rg
    DEV_STORAGE_ACCOUNT           = "cstarditnidpaymultinit"
    DEV_ANALYTICS_ENABLED         = local.dev_analytics_enabled
    DEV_ANALYTICS_MOCKED          = local.dev_analytics_mocked
    DEV_VITE_KEYCLOAK_URL         = local.dev_vite_keycloak_url
    DEV_VITE_KEYCLOAK_REALM       = local.dev_vite_user_keycloak_realm
    DEV_VITE_URL_API_PORTAL_USERS = local.dev_vite_url_api_portal_users
    DEV_CDN_DOMAINS               = "dev.pari.pagopa.it"
    DEV_VITE_BASE_URL             = "https://dev.pari.pagopa.it"

    UAT_AZURE_SUBSCRIPTION        = local.uat_service_endpoint_azure_id
    UAT_CDN_ENDPOINT              = "cstar-u-itn-idpay-cdn-web"
    UAT_CDN_PROFILE               = "cstar-u-itn-idpay-multi-initiative-cdn-profile"
    UAT_RESOURCE_GROUP            = local.uat_storage_account_rg
    UAT_STORAGE_ACCOUNT           = "cstaruitnidpaymultinit"
    UAT_ANALYTICS_ENABLED         = local.uat_analytics_enabled
    UAT_ANALYTICS_MOCKED          = local.uat_analytics_mocked
    UAT_VITE_KEYCLOAK_URL         = local.uat_vite_keycloak_url
    UAT_VITE_KEYCLOAK_REALM       = local.uat_vite_user_keycloak_realm
    UAT_VITE_URL_API_PORTAL_USERS = local.uat_vite_url_api_portal_users
    UAT_CDN_DOMAINS               = "uat.pari.pagopa.it"
    UAT_VITE_BASE_URL             = "https://uat.pari.pagopa.it"

    PROD_AZURE_SUBSCRIPTION        = local.prod_service_endpoint_azure_id
    PROD_CDN_ENDPOINT              = "cstar-p-itn-idpay-cdn-web"
    PROD_CDN_PROFILE               = "cstar-p-itn-idpay-multi-initiative-cdn-profile"
    PROD_RESOURCE_GROUP            = local.prod_storage_account_rg
    PROD_STORAGE_ACCOUNT           = "cstarpitnidpaymultinit"
    PROD_ANALYTICS_ENABLED         = local.prod_analytics_enabled
    PROD_ANALYTICS_MOCKED          = local.prod_analytics_mocked
    PROD_VITE_KEYCLOAK_URL         = local.prod_vite_keycloak_url
    PROD_VITE_KEYCLOAK_REALM       = local.prod_vite_user_keycloak_realm
    PROD_VITE_URL_API_PORTAL_USERS = local.prod_vite_url_api_portal_users
    PROD_CDN_DOMAINS               = "pari.pagopa.it"
    PROD_VITE_BASE_URL             = "https://pari.pagopa.it"
  }
}

module "multi_initiative_portal_user_frontend_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.multi_initiative_portal_user_frontend.repository
  github_service_connection_id = local.service_connection_github_ro_id


  pipeline_name         = "${local.product}-multi-initiative-portal-users.deploy"
  pipeline_yml_filename = "multi-initiative-deploy-pipelines.yml"
  path                  = var.multi_initiative_portal_user_frontend.pipeline.path

  ci_trigger_enabled  = true
  ci_trigger_use_yaml = true

  variables = merge(
    local.multi_initiative_portal_user_frontend_variables_deploy,
  )

  variables_secret = {}

  service_connection_ids_authorization = [
    local.service_connection_github_ro_id,
    local.dev_service_endpoint_azure_id,
    local.uat_service_endpoint_azure_id,
    local.prod_service_endpoint_azure_id
  ]

}
