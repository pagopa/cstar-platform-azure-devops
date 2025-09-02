###
### Plan & Deploy service connections created in the iacv2-projects folder will be used.
###

data "azuredevops_serviceendpoint_azurerm" "dev_azurerm_iac_plan_service_conn" {
  project_id            = data.azuredevops_project.project.project_id
  service_endpoint_name = "azdo-dev-${local.prefix}-iac-plan-v2-service-conn"
}

data "azuredevops_serviceendpoint_azurerm" "uat_azurerm_iac_plan_service_conn" {
  project_id            = data.azuredevops_project.project.project_id
  service_endpoint_name = "azdo-uat-${local.prefix}-iac-plan-v2-service-conn"
}

data "azuredevops_serviceendpoint_azurerm" "prod_azurerm_iac_plan_service_conn" {
  project_id            = data.azuredevops_project.project.project_id
  service_endpoint_name = "azdo-prod-${local.prefix}-iac-plan-v2-service-conn"
}
