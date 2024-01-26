
data "azuredevops_serviceendpoint_azurecr" "dev-azureacr-service-endpoint" {
  project_id = data.azuredevops_project.project.id
  service_endpoint_name = local.service_endpoint_azure_devops_docker_dev_name
}

data "azuredevops_serviceendpoint_azurecr" "uat-azureacr-service-endpoint" {
  project_id = data.azuredevops_project.project.id
  service_endpoint_name = local.service_endpoint_azure_devops_docker_uat_name
}

data "azuredevops_serviceendpoint_azurecr" "prod-azureacr-service-endpoint" {
  project_id = data.azuredevops_project.project.id
  service_endpoint_name = local.service_endpoint_azure_devops_docker_prod_name
}
