#
# ⛩ Service connection 2 🔐 KV@DEV 🛑
#

module "DEV-APPINSIGHTS-SERVICE-CONN-FEDERATED" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated?ref=v5.2.0"
  providers = {
    azurerm = azurerm.dev
  }

  location            = local.location
  resource_group_name = local.dev_identity_rg_name

  project_id = data.azuredevops_project.project.id
  name              = "${local.project_prefix_short}-d-${local.domain}-azdo-appinsights"
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_id   = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
  subscription_name = local.dev_subscription_name

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
  principal_id         = module.DEV-APPINSIGHTS-SERVICE-CONN-FEDERATED.service_principal_object_id
}
