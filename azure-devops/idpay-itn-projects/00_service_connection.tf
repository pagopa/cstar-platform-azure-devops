#
# GITHUB
#
data "azuredevops_serviceendpoint_github" "arc_azure_devops_github_rw" {
  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "io-azure-devops-github-rw"
}

data "azuredevops_serviceendpoint_github" "arc_azure_devops_github_ro" {
  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "io-azure-devops-github-ro"
}

#
# SERVICE CONNECTION Azure
#
data "azuredevops_serviceendpoint_azurerm" "dev_azurerm_service_conn" {
  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "${data.azurerm_subscriptions.dev.subscriptions[0].display_name}-SERVICE-CONN"
}

data "azuredevops_serviceendpoint_azurerm" "uat_azurerm_service_conn" {
  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "${data.azurerm_subscriptions.uat.subscriptions[0].display_name}-SERVICE-CONN"
}

data "azuredevops_serviceendpoint_azurerm" "prod_azurerm_service_conn" {
  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "${data.azurerm_subscriptions.prod.subscriptions[0].display_name}-SERVICE-CONN"
}

#
# SONAR CLOUD
#
data "azuredevops_serviceendpoint_sonarcloud" "azure_devops_sonar" {
  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "SONARCLOUD-SERVICE-CONN"
}
