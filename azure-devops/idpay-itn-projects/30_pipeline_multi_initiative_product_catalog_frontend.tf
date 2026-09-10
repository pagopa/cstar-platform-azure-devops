variable "multi_initiative_product_catalog_frontend" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-product-catalog-portal"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      path = "idpay\\idpay-product-catalog-portal"
    }
  }
}

locals {

  # deploy vars
  multi_initiative_product_catalog_frontend_variables_deploy = {

    blob_container_name    = "$web"
    AZURE_DEVOPS_GITHUB_RO = local.service_connection_github_ro_name

    DEV_AZURE_SUBSCRIPTION = local.dev_service_endpoint_azure_id
    DEV_CDN_ENDPOINT       = "cstar-d-itn-idpay-cdn-web"
    DEV_CDN_PROFILE        = "cstar-d-itn-idpay-multi-initiative-cdn-profile"
    DEV_RESOURCE_GROUP     = local.dev_storage_account_rg
    DEV_STORAGE_ACCOUNT    = "cstarditnidpaymultinit"
    DEV_CDN_DOMAINS        = "dev.pari.pagopa.it"


    UAT_AZURE_SUBSCRIPTION = local.uat_service_endpoint_azure_id
    UAT_CDN_ENDPOINT       = "cstar-u-itn-idpay-cdn-web"
    UAT_CDN_PROFILE        = "cstar-u-itn-idpay-multi-initiative-cdn-profile"
    UAT_RESOURCE_GROUP     = local.uat_storage_account_rg
    UAT_STORAGE_ACCOUNT    = "cstaruitnidpaymultinit"
    UAT_CDN_DOMAINS        = "uat.pari.pagopa.it"

    PROD_AZURE_SUBSCRIPTION = local.prod_service_endpoint_azure_id
    PROD_CDN_ENDPOINT       = "cstar-p-itn-idpay-cdn-web"
    PROD_CDN_PROFILE        = "cstar-p-itn-idpay-multi-initiative-cdn-profile"
    PROD_RESOURCE_GROUP     = local.prod_storage_account_rg
    PROD_STORAGE_ACCOUNT    = "cstarpitnidpaymultinit"
    PROD_CDN_DOMAINS        = "pari.pagopa.it"
  }
}

module "multi_initiative_product_catalog_frontend_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.multi_initiative_product_catalog_frontend.repository
  github_service_connection_id = local.service_connection_github_ro_id


  pipeline_name         = "${local.product}-multi-initiative-product-catalog.deploy"
  pipeline_yml_filename = "multi-initiative-deploy-pipelines.yml"
  path                  = var.multi_initiative_product_catalog_frontend.pipeline.path

  ci_trigger_enabled  = true
  ci_trigger_use_yaml = true

  variables = merge(
    local.multi_initiative_product_catalog_frontend_variables_deploy,
  )

  variables_secret = {}

  service_connection_ids_authorization = [
    local.service_connection_github_ro_id,
    local.dev_service_endpoint_azure_id,
    local.uat_service_endpoint_azure_id,
    local.prod_service_endpoint_azure_id
  ]

}
