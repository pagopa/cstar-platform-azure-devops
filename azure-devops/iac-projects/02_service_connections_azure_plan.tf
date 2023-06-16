#
# DEV
#
module "DEV-CSTAR-PLAN-SERVICE-CONN" {

  providers = {
    azurerm = azurerm.dev
  }

  depends_on = [data.azuredevops_project.project]
  source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan?ref=add-service-endpoint-sp-personal"

  name_suffix                 = "${local.project_prefix_short}-dev"
  iac_aad_group_name          = "azure-devops-iac-service-connection"
  password_time_rotation_days = 365
  renew_token                 = "v2"


  project_id      = data.azuredevops_project.project.id
  tenant_id       = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  subscription_id = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value

  credential_key_vault_name           = local.dev_idpay_key_vault_name
  credential_key_vault_resource_group = local.dev_idpay_key_vault_resource_group
}

# #
# # UAT
# #
# module "UAT-CSTAR-PLAN-SERVICE-CONN" {

#   providers = {
#     azurerm = azurerm.uat
#   }

#   depends_on = [data.azuredevops_project.project]
#   source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan?ref=add-service-endpoint-sp-personal"

#   name_suffix              = "${local.project_prefix_short}-uat"
#     iac_aad_group_name = "azure-devops-iac-service-connection"
#       password_time_rotation_days = 1



#   project_id        = data.azuredevops_project.project.id
#   tenant_id         = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
#   subscription_id   = module.secret_azdo.values["PAGOPAIT-UAT-CSTAR-SUBSCRIPTION-ID"].value

#   credential_key_vault_name           = local.uat_idpay_key_vault_name
#   credential_key_vault_resource_group = local.uat_idpay_key_vault_resource_group
# }

# #
# # PROD
# #
# module "PROD-CSTAR-PLAN-SERVICE-CONN" {

#   providers = {
#     azurerm = azurerm.prod
#   }

#   depends_on = [data.azuredevops_project.project]
#   source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan?ref=add-service-endpoint-sp-personal"

#   name_suffix              = "${local.project_prefix_short}-prod"
#     iac_aad_group_name = "azure-devops-iac-service-connection"
#       password_time_rotation_days = 1


#   project_id        = data.azuredevops_project.project.id
#   tenant_id         = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
#   subscription_id   = module.secret_azdo.values["PAGOPAIT-PROD-CSTAR-SUBSCRIPTION-ID"].value

#   credential_key_vault_name           = local.prod_idpay_key_vault_name
#   credential_key_vault_resource_group = local.prod_idpay_key_vault_resource_group
# }
