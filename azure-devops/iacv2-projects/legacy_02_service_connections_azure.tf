#
# ⛩ Service connections
#

# DEV service connection
resource "azuredevops_serviceendpoint_azurerm" "DEV_CSTAR" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "DEV-CSTAR-SERVICE-CONN"
  description               = "DEV-CSTAR Service connection"
  azurerm_subscription_name = "DEV-CSTAR"
  azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id   = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
}

# UAT service connection
resource "azuredevops_serviceendpoint_azurerm" "UAT_CSTAR" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "UAT-CSTAR-SERVICE-CONN"
  description               = "UAT-CSTAR Service connection"
  azurerm_subscription_name = "UAT-CSTAR"
  azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id   = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
}

# PROD service connection
resource "azuredevops_serviceendpoint_azurerm" "PROD_CSTAR" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "PROD-CSTAR-SERVICE-CONN"
  description               = "PROD-CSTAR Service connection"
  azurerm_subscription_name = "PROD-CSTAR"
  azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id   = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id
}
