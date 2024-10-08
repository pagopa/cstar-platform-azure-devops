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
      path               = "rtp"
    }
  }
}

locals {

  # deploy vars
  rtp_front_end_variables_deploy = {
    AZURE_DEVOPS_GITHUB_RO = data.azuredevops_serviceendpoint_github.io-azure-devops-github-ro.service_endpoint_name


    DEV_AZURE_SUBSCRIPTION     = data.azuredevops_serviceendpoint_azurerm.azure_dev.id
    DEV_STORAGE_ACCOUNT_RG     = local.dev_storage_account_rg
    DEV_STORAGE_ACCOUNT_NAME   = local.dev_storage_account_name
    DEV_CDN_ENDPOINT           = local.dev_cdn_endpoint
    DEV_CDN_PROFILE            = local.dev_cdn_profile
    DEV_APIM_PREFIX_DOMAIN     = local.dev_apim_prefix_domain

    UAT_AZURE_SUBSCRIPTION     = data.azuredevops_serviceendpoint_azurerm.azure_uat.id
    UAT_STORAGE_ACCOUNT_RG     = local.uat_storage_account_rg
    UAT_STORAGE_ACCOUNT_NAME   = local.uat_storage_account_name
    UAT_CDN_ENDPOINT           = local.uat_cdn_endpoint
    UAT_CDN_PROFILE            = local.uat_cdn_profile
    UAT_APIM_PREFIX_DOMAIN     = local.uat_apim_prefix_domain


    PROD_AZURE_SUBSCRIPTION     = data.azuredevops_serviceendpoint_azurerm.azure_prod.id
    PROD_STORAGE_ACCOUNT_RG     = local.prod_storage_account_rg
    PROD_STORAGE_ACCOUNT_NAME   = local.prod_storage_account_name
    PROD_CDN_ENDPOINT           = local.prod_cdn_endpoint
    PROD_CDN_PROFILE            = local.prod_cdn_profile
    PROD_APIM_PREFIX_DOMAIN     = local.prod_apim_prefix_domain

  }
}

module "rtp-front-end-deploy_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.rtp_front_end_deploy.repository
  github_service_connection_id = data.azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  pipeline_name         = "${local.prefix}-${local.domain}-fe.deploy"
  pipeline_yml_filename = "deploy-pipelines.yml"
  path                  = var.rtp_front_end_deploy.pipeline.path

  ci_trigger_enabled  = true
  ci_trigger_use_yaml = true

  variables = merge(
    local.rtp_front_end_variables_deploy,
  )

  variables_secret = {}

  service_connection_ids_authorization = [
    data.azuredevops_serviceendpoint_azurerm.azure_dev.id,
    data.azuredevops_serviceendpoint_azurerm.azure_uat.id,
    data.azuredevops_serviceendpoint_azurerm.azure_prod.id,
    data.azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id
  ]
}