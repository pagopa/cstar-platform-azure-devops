#
# ⛩ Service connection 2 🔐 KV@DEV 🛑
#
#tfsec:ignore:GEN003
module "DEV-APPINSIGHTS-SERVICE-CONN" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_limited?ref=v2.6.5"
  providers = {
    azurerm = azurerm.dev
  }

  project_id = data.azuredevops_project.project.id
  #tfsec:ignore:general-secrets-no-plaintext-exposure
  renew_token       = local.appinsights_renew_token
  name              = "${local.project_prefix_short}-d-${local.domain}-appinsights"
  tenant_id         = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  subscription_id   = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value
  subscription_name = local.dev_subscription_name

  credential_subcription              = local.dev_subscription_name
  credential_key_vault_name           = local.dev_domain_key_vault_name
  credential_key_vault_resource_group = local.dev_domain_key_vault_resource_group
}

data "azurerm_application_insights" "application_insights_dev" {
  provider            = azurerm.dev
  name                = local.dev_appinsights_name
  resource_group_name = local.dev_appinsights_resource_group
}

resource "azurerm_role_assignment" "appinsights_component_contributor_dev" {
  provider             = azurerm.dev
  scope                = data.azurerm_application_insights.application_insights_dev.id
  role_definition_name = "Application Insights Component Contributor"
  principal_id         = module.DEV-APPINSIGHTS-SERVICE-CONN.service_principal_object_id
}