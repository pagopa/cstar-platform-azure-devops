#
# DEV
#
module "DEV-CSTAR-PLAN-SERVICE-CONN" {

  providers = {
    azurerm = azurerm.dev
  }

  depends_on = [data.azuredevops_project.project]
  source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan?ref=v5.2.0"

  name_suffix                 = "${local.project_prefix_short}-dev"
  iac_aad_group_name          = "azure-devops-iac-service-connection"
  password_time_rotation_days = 365
  renew_token                 = "v2"


  project_id      = data.azuredevops_project.project.id
  tenant_id       = data.azurerm_client_config.current.tenant_id
  subscription_id = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id

  credential_key_vault_name           = local.dev_idpay_key_vault_name
  credential_key_vault_resource_group = local.dev_idpay_key_vault_resource_group
}

#
# UAT
#
module "UAT-CSTAR-PLAN-SERVICE-CONN" {

  providers = {
    azurerm = azurerm.uat
  }

  depends_on = [data.azuredevops_project.project]
  source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan?ref=v5.2.0"

  name_suffix                 = "${local.project_prefix_short}-uat"
  iac_aad_group_name          = "azure-devops-iac-service-connection"
  password_time_rotation_days = 365
  renew_token                 = "v2"


  project_id      = data.azuredevops_project.project.id
  tenant_id       = data.azurerm_client_config.current.tenant_id
  subscription_id = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id

  credential_key_vault_name           = local.uat_idpay_key_vault_name
  credential_key_vault_resource_group = local.uat_idpay_key_vault_resource_group
}

#
# PROD
#
module "PROD-CSTAR-PLAN-SERVICE-CONN" {

  providers = {
    azurerm = azurerm.prod
  }

  depends_on = [data.azuredevops_project.project]
  source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan?ref=v5.2.0"

  name_suffix                 = "${local.project_prefix_short}-prod"
  iac_aad_group_name          = "azure-devops-iac-service-connection"
  password_time_rotation_days = 365
  renew_token                 = "v2"


  project_id      = data.azuredevops_project.project.id
  tenant_id       = data.azurerm_client_config.current.tenant_id
  subscription_id = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id

  credential_key_vault_name           = local.prod_idpay_key_vault_name
  credential_key_vault_resource_group = local.prod_idpay_key_vault_resource_group
}
