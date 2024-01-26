data "azuredevops_serviceendpoint_github" "io-azure-devops-github-ro" {
  project_id = data.azuredevops_project.project.id
  service_endpoint_name = local.service_endpoint_io_azure_devops_github_ro_name
}

data "azuredevops_serviceendpoint_github" "io-azure-devops-github-pr" {
  project_id = data.azuredevops_project.project.id
  service_endpoint_name = local.service_endpoint_io_azure_devops_github_pr_name
}
