variable "emd_ar_backoffice_admin_fe" {
  default = {
    repository = {
      organization   = "pagopa"
      name           = "emd-ar-backoffice-admin-fe"
      branch_name    = "refs/heads/main"
      pipelines_path = ".devops"
    }
    pipeline = {
      path = "mdc\\emd-ar-backoffice-admin-fe"
    }
  }
}

locals {
  dev_backoffice_admin_storage_account = replace("${local.prefix}-d-${local.location_short}-${local.domain}admin", "-", "")
  dev_keycloak_url                     = "https://api-mcshared.dev.cstar.pagopa.it/auth-itn"
  dev_keycloak_realm                   = "mdc"
  dev_keycloak_admin_client_id         = "ar-backoffice-portal-client"
  dev_backoffice_internal_api_base_url = "https://api-emd.dev.cstar.pagopa.it/emd/backoffice-internal"


  uat_backoffice_admin_storage_account = replace("${local.prefix}-u-${local.location_short}-${local.domain}admin", "-", "")
  uat_keycloak_url                     = "https://api-mcshared.uat.cstar.pagopa.it/auth-itn"
  uat_keycloak_realm                   = "mdc"
  uat_keycloak_admin_client_id         = "ar-backoffice-portal-client"
  uat_backoffice_internal_api_base_url = "https://api-emd.uat.cstar.pagopa.it/emd/backoffice-internal"

  prod_backoffice_admin_storage_account = replace("${local.prefix}-p-${local.location_short}-${local.domain}admin", "-", "")
  prod_keycloak_url                     = "https://api-mcshared.cstar.pagopa.it/auth-itn"
  prod_keycloak_realm                   = "mdc"
  prod_keycloak_admin_client_id         = "ar-backoffice-portal-client"
  prod_backoffice_internal_api_base_url = "https://api-emd.cstar.pagopa.it/emd/backoffice-internal"

  emd_ar_backoffice_admin_fe_variables_deploy = {
    # AzureCLI@2 richiede il NOME della service connection (non l'id)
    DEV_AGENT_POOL         = local.azdo_agent_pool_dev
    DEV_AZURE_SUBSCRIPTION = local.dev_service_endpoint_azure_name
    DEV_STORAGE_ACCOUNT    = local.dev_backoffice_admin_storage_account
    DEV_API_BASE_URL       = local.dev_backoffice_internal_api_base_url
    DEV_KEYCLOAK_URL       = local.dev_keycloak_url
    DEV_KEYCLOAK_REALM     = local.dev_keycloak_realm
    DEV_KEYCLOAK_CLIENT_ID = local.dev_keycloak_admin_client_id

    UAT_AGENT_POOL         = local.azdo_agent_pool_uat
    UAT_AZURE_SUBSCRIPTION = local.uat_service_endpoint_azure_name
    UAT_STORAGE_ACCOUNT    = local.uat_backoffice_admin_storage_account
    UAT_API_BASE_URL       = local.uat_backoffice_internal_api_base_url
    UAT_KEYCLOAK_URL       = local.uat_keycloak_url
    UAT_KEYCLOAK_REALM     = local.uat_keycloak_realm
    UAT_KEYCLOAK_CLIENT_ID = local.uat_keycloak_admin_client_id

    PROD_AGENT_POOL         = local.azdo_agent_pool_prod
    PROD_AZURE_SUBSCRIPTION = local.prod_service_endpoint_azure_name
    PROD_STORAGE_ACCOUNT    = local.prod_backoffice_admin_storage_account
    PROD_API_BASE_URL       = local.prod_backoffice_internal_api_base_url
    PROD_KEYCLOAK_URL       = local.prod_keycloak_url
    PROD_KEYCLOAK_REALM     = local.prod_keycloak_realm
    PROD_KEYCLOAK_CLIENT_ID = local.prod_keycloak_admin_client_id
  }
}

module "emd_ar_backoffice_admin_fe_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.emd_ar_backoffice_admin_fe.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.bot_github_rw.id

  pipeline_name         = "emd-ar-backoffice-admin-fe.deploy"
  pipeline_yml_filename = "deploy-pipelines.yml"
  path                  = var.emd_ar_backoffice_admin_fe.pipeline.path

  # Nessun trigger automatico: il deploy è sempre manuale con parametri ENV e VERSION
  ci_trigger_enabled  = false
  ci_trigger_use_yaml = true

  variables        = local.emd_ar_backoffice_admin_fe_variables_deploy
  variables_secret = {}

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.bot_github_rw.id,
    local.dev_service_endpoint_azure_id,
    local.uat_service_endpoint_azure_id,
    local.prod_service_endpoint_azure_id
  ]
}
