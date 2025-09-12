###
### Plan service connections
###

data "azuredevops_serviceendpoint_azurerm" "dev_tf_azure_service_connection_plan" {
  for_each = {
    for i in data.azuredevops_project.this : i.name => i
  }

  project_id            = each.value.project_id
  service_endpoint_name = local.devops_settings[each.key].dev_tf_azure_service_connection_plan_name
}

data "azuredevops_serviceendpoint_azurerm" "uat_tf_azure_service_connection_plan" {
  for_each = {
    for i in data.azuredevops_project.this : i.name => i
  }

  project_id            = each.value.project_id
  service_endpoint_name = local.devops_settings[each.key].uat_tf_azure_service_connection_plan_name
}

data "azuredevops_serviceendpoint_azurerm" "prod_tf_azure_service_connection_plan" {
  for_each = {
    for i in data.azuredevops_project.this : i.name => i
  }

  project_id            = each.value.project_id
  service_endpoint_name = local.devops_settings[each.key].prod_tf_azure_service_connection_plan_name
}
