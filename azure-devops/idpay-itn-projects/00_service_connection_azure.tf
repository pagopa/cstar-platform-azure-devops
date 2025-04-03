data "azuredevops_serviceendpoint_azurerm" "azure_dev" {
  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "${data.azurerm_subscriptions.dev.subscriptions[0].display_name}-AZURE-SERVICE-CONN"
}

data "azuredevops_serviceendpoint_azurerm" "azure_uat" {
  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "${data.azurerm_subscriptions.uat.subscriptions[0].display_name}-AZURE-SERVICE-CONN"
}

data "azuredevops_serviceendpoint_azurerm" "azure_prod" {
  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "${data.azurerm_subscriptions.prod.subscriptions[0].display_name}-AZURE-SERVICE-CONN"
}
