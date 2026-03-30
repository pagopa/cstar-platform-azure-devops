variable "emd_ar_backoffice_fe" {
  default = {
    repository = {
      organization   = "pagopa"
      name           = "emd-ar-backoffice-fe"
      branch_name    = "refs/heads/main"
      pipelines_path = ".devops"
    }
    pipeline = {
      path = "mdc\\emd-ar-backoffice-fe"
    }
  }
}

locals {
  dev_backoffice_cdn_profile     = "${local.prefix}-d-${local.location_short}-${local.domain}-backoffice"
  dev_backoffice_cdn_endpoint    = "${local.prefix}-d-${local.location_short}-${local.domain}-backoffice"
  dev_backoffice_resource_group  = "${local.prefix}-d-${local.location_short}-${local.domain}-data-rg"
  dev_backoffice_storage_account = replace("${local.prefix}-d-${local.location_short}-${local.domain}backoffice", "-", "")
  dev_backoffice_cdn_domain   = "mdc.dev.cstar.pagopa.it"
  # TODO: sostituire con URL APIM quando configurato (es. https://api.dev.cstar.pagopa.it/emd/ar/backoffice)
  # Per ora punta all'ingress interno AKS — NON raggiungibile dal browser, solo placeholder
  dev_backoffice_api_base_url = "https://api-emd.dev.cstar.pagopa.it/emd/ar/backoffice"

  uat_backoffice_cdn_profile     = "${local.prefix}-u-${local.location_short}-${local.domain}-backoffice"
  uat_backoffice_cdn_endpoint    = "${local.prefix}-u-${local.location_short}-${local.domain}-backoffice"
  uat_backoffice_resource_group  = "${local.prefix}-u-${local.location_short}-${local.domain}-data-rg"
  uat_backoffice_storage_account = replace("${local.prefix}-u-${local.location_short}-${local.domain}backoffice", "-", "")
  uat_backoffice_cdn_domain   = "mdc.uat.cstar.pagopa.it"
  # TODO: sostituire con URL APIM quando configurato
  uat_backoffice_api_base_url = "https://api-emd.uat.cstar.pagopa.it/emd/ar/backoffice"

  prod_backoffice_cdn_profile     = "${local.prefix}-p-${local.location_short}-${local.domain}-backoffice"
  prod_backoffice_cdn_endpoint    = "${local.prefix}-p-${local.location_short}-${local.domain}-backoffice"
  prod_backoffice_resource_group  = "${local.prefix}-p-${local.location_short}-${local.domain}-data-rg"
  prod_backoffice_storage_account = replace("${local.prefix}-p-${local.location_short}-${local.domain}backoffice", "-", "")
  prod_backoffice_cdn_domain   = "mdc.cstar.pagopa.it"
  # TODO: sostituire con URL APIM quando configurato
  prod_backoffice_api_base_url = "https://api-emd.cstar.pagopa.it/emd/ar/backoffice"

  emd_ar_backoffice_fe_variables_deploy = {
    # AzureCLI@2 richiede il NOME della service connection (non l'id)
    DEV_AZURE_SUBSCRIPTION = local.dev_service_endpoint_azure_name
    DEV_CDN_ENDPOINT       = local.dev_backoffice_cdn_endpoint
    DEV_CDN_PROFILE        = local.dev_backoffice_cdn_profile
    DEV_RESOURCE_GROUP     = local.dev_backoffice_resource_group
    DEV_STORAGE_ACCOUNT    = local.dev_backoffice_storage_account
    DEV_CDN_DOMAINS        = local.dev_backoffice_cdn_domain
    DEV_API_BASE_URL       = local.dev_backoffice_api_base_url

    UAT_AZURE_SUBSCRIPTION = local.uat_service_endpoint_azure_name
    UAT_CDN_ENDPOINT       = local.uat_backoffice_cdn_endpoint
    UAT_CDN_PROFILE        = local.uat_backoffice_cdn_profile
    UAT_RESOURCE_GROUP     = local.uat_backoffice_resource_group
    UAT_STORAGE_ACCOUNT    = local.uat_backoffice_storage_account
    UAT_CDN_DOMAINS        = local.uat_backoffice_cdn_domain
    UAT_API_BASE_URL       = local.uat_backoffice_api_base_url

    PROD_AZURE_SUBSCRIPTION = local.prod_service_endpoint_azure_name
    PROD_CDN_ENDPOINT       = local.prod_backoffice_cdn_endpoint
    PROD_CDN_PROFILE        = local.prod_backoffice_cdn_profile
    PROD_RESOURCE_GROUP     = local.prod_backoffice_resource_group
    PROD_STORAGE_ACCOUNT    = local.prod_backoffice_storage_account
    PROD_CDN_DOMAINS        = local.prod_backoffice_cdn_domain
    PROD_API_BASE_URL       = local.prod_backoffice_api_base_url
  }
}

module "emd_ar_backoffice_fe_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.emd_ar_backoffice_fe.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.bot_github_pr.id

  pipeline_name         = "emd-ar-backoffice-fe.deploy"
  pipeline_yml_filename = "deploy-pipelines.yml"
  path                  = var.emd_ar_backoffice_fe.pipeline.path

  # Nessun trigger automatico: il deploy è sempre manuale con parametri ENV e VERSION
  ci_trigger_enabled  = false
  ci_trigger_use_yaml = true

  variables        = local.emd_ar_backoffice_fe_variables_deploy
  variables_secret = {}

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.bot_github_pr.id,
    local.dev_service_endpoint_azure_id,
    local.uat_service_endpoint_azure_id,
    local.prod_service_endpoint_azure_id
  ]
}
