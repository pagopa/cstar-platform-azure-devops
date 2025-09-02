#
# 🐙 GITHUB
#


data "azuredevops_serviceendpoint_github" "azure_devops_github_ro" {
  project_id            = data.azuredevops_project.project.id
  service_endpoint_name = local.srv_endpoint_github_ro
}

data "azuredevops_serviceendpoint_github" "azure_devops_github_pr" {
  project_id            = data.azuredevops_project.project.id
  service_endpoint_name = local.srv_endpoint_github_pr
}
