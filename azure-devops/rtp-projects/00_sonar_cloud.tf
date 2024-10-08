data "azuredevops_serviceendpoint_sonarcloud" "sonar_cloud" {
  project_id            = data.azuredevops_project.project.id
  service_endpoint_name = "SONARCLOUD-SERVICE-CONN"
}
