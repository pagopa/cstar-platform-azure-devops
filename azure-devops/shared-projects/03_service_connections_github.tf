#
# GITHUB
#
data "azuredevops_serviceendpoint_github" "azure_devops_github_rw" {
  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "io-azure-devops-github-rw"
}

data "azuredevops_serviceendpoint_github" "azure_devops_github_ro" {
  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "io-azure-devops-github-ro"
}
