###
### Apply service connections
###

data "azuredevops_serviceendpoint_azurerm" "dev_tf_azure_service_connection_apply" {
  for_each = local.projects

  project_id            = data.azuredevops_project.this[each.key].project_id
  service_endpoint_name = local.devops_settings[each.key].dev_tf_azure_service_connection_deploy_name
}

data "azuredevops_serviceendpoint_azurerm" "uat_tf_azure_service_connection_apply" {
  for_each = local.projects

  project_id            = data.azuredevops_project.this[each.key].project_id
  service_endpoint_name = local.devops_settings[each.key].uat_tf_azure_service_connection_deploy_name
}

data "azuredevops_serviceendpoint_azurerm" "prod_tf_azure_service_connection_apply" {
  for_each = local.projects

  project_id            = data.azuredevops_project.this[each.key].project_id
  service_endpoint_name = local.devops_settings[each.key].prod_tf_azure_service_connection_deploy_name
}
