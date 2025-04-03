data "azuredevops_serviceendpoint_azurerm" "azure_dev" {
  project_id            = local.devops_project_id
  service_endpoint_name = "${data.azurerm_subscriptions.dev.subscriptions[0].display_name}-AZURE-SERVICE-CONN"
}

data "azuredevops_serviceendpoint_azurerm" "azure_uat" {
  project_id            = local.devops_project_id
  service_endpoint_name = "${data.azurerm_subscriptions.uat.subscriptions[0].display_name}-AZURE-SERVICE-CONN"
}

data "azuredevops_serviceendpoint_azurerm" "azure_prod" {
  project_id            = local.devops_project_id
  service_endpoint_name = "${data.azurerm_subscriptions.prod.subscriptions[0].display_name}-AZURE-SERVICE-CONN"
}

#
# GITHUB
#
data "azuredevops_serviceendpoint_github" "azure_devops_github_rw" {
  project_id            = local.devops_project_id
  service_endpoint_name = "azure-devops-github-rw"
}

data "azuredevops_serviceendpoint_github" "azure_devops_github_ro" {
  project_id            = local.devops_project_id
  service_endpoint_name = "azure-devops-github-ro"
}
