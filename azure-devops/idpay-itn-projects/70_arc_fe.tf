# variable "idpay_fe" {
#   default = {
#     repository = {
#       organization    = "pagopa"
#       name            = "arc-fe"
#       branch_name     = "refs/heads/main"
#       pipelines_path  = ".devops"
#       yml_prefix_name = null
#     }
#     pipeline = {
#       path = "idpay\\fe"
#     }
#   }
# }

# locals {

#   # deploy vars
#   idpay_fe_variables_deploy = {
#     AZURE_DEVOPS_GITHUB_RO = data.azuredevops_serviceendpoint_github.arc_azure_devops_github_ro.service_endpoint_name
#     DEPLOY_PATH            = "/pagamenti"

#     DEV_AZURE_SUBSCRIPTION     = data.azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn.id
#     DEV_STORAGE_ACCOUNT_RG     = local.dev_storage_account_rg
#     DEV_STORAGE_ACCOUNT_NAME   = local.dev_storage_account_name
#     DEV_CDN_ENDPOINT           = local.dev_cdn_endpoint
#     DEV_CDN_PROFILE            = local.dev_cdn_profile
#     DEV_APIM_PREFIX_DOMAIN     = local.dev_apim_prefix_domain
#     DEV_CHECKOUT_PREFIX_DOMAIN = local.dev_checkout_prefix_domain
#     DEV_CHECKOUT_PLATFORM_URL  = local.dev_checkout_platform_url
#     DEV_PAYMENT_RETURN_URL     = local.dev_payment_return_url

#     UAT_AZURE_SUBSCRIPTION     = data.azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn.id
#     UAT_STORAGE_ACCOUNT_RG     = local.uat_storage_account_rg
#     UAT_STORAGE_ACCOUNT_NAME   = local.uat_storage_account_name
#     UAT_CDN_ENDPOINT           = local.uat_cdn_endpoint
#     UAT_CDN_PROFILE            = local.uat_cdn_profile
#     UAT_APIM_PREFIX_DOMAIN     = local.uat_apim_prefix_domain
#     UAT_CHECKOUT_PREFIX_DOMAIN = local.uat_checkout_prefix_domain
#     UAT_CHECKOUT_PLATFORM_URL  = local.uat_checkout_platform_url
#     UAT_PAYMENT_RETURN_URL     = local.uat_payment_return_url

#     PROD_AZURE_SUBSCRIPTION     = data.azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn.id
#     PROD_STORAGE_ACCOUNT_RG     = local.prod_storage_account_rg
#     PROD_STORAGE_ACCOUNT_NAME   = local.prod_storage_account_name
#     PROD_CDN_ENDPOINT           = local.prod_cdn_endpoint
#     PROD_CDN_PROFILE            = local.prod_cdn_profile
#     PROD_APIM_PREFIX_DOMAIN     = local.prod_apim_prefix_domain
#     PROD_CHECKOUT_PREFIX_DOMAIN = local.prod_checkout_prefix_domain
#     PROD_CHECKOUT_PLATFORM_URL  = local.prod_checkout_platform_url
#     PROD_PAYMENT_RETURN_URL     = local.prod_payment_return_url
#   }
# }

# module "idpay_fe_deploy" {
#   source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

#   providers = {
#     azurerm = azurerm.prod
#   }

#   project_id                   = local.devops_project_id
#   repository                   = var.idpay_fe.repository
#   github_service_connection_id = data.azuredevops_serviceendpoint_github.arc_azure_devops_github_rw.id

#   pipeline_name         = "${local.product}-fe.deploy"
#   pipeline_yml_filename = "deploy-pipelines.yml"
#   path                  = var.idpay_fe.pipeline.path

#   ci_trigger_enabled  = true
#   ci_trigger_use_yaml = true

#   variables = merge(
#     local.idpay_fe_variables_deploy,
#   )

#   variables_secret = {}

#   service_connection_ids_authorization = [
#     data.azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn.id,
#     data.azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn.id,
#     data.azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn.id,
#     data.azuredevops_serviceendpoint_github.arc_azure_devops_github_ro.id
#   ]
# }
