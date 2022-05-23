#
# 🐙 GITHUB
#

# Github service connection (read-only)
resource "azuredevops_serviceendpoint_github" "azure-devops-github-ro" {
  depends_on = [azuredevops_project.project]

  project_id            = azuredevops_project.project.id
  service_endpoint_name = "azure-devops-github-ro"
  auth_personal {
    personal_access_token = module.secret_azdo.values["azure-devops-github-ro-TOKEN"].value
  }
  lifecycle {
    ignore_changes = [description, authorization]
  }
}

# Github service connection (read write)
resource "azuredevops_serviceendpoint_github" "azure-devops-github-rw" {
  depends_on = [azuredevops_project.project]

  project_id            = azuredevops_project.project.id
  service_endpoint_name = "azure-devops-github-rw"
  auth_personal {
    personal_access_token = module.secret_azdo.values["azure-devops-github-rw-TOKEN"].value
  }
  lifecycle {
    ignore_changes = [description, authorization]
  }
}

# Github service connection (pull request)
resource "azuredevops_serviceendpoint_github" "azure-devops-github-pr" {
  depends_on = [azuredevops_project.project]

  project_id            = azuredevops_project.project.id
  service_endpoint_name = "azure-devops-github-pr"
  auth_personal {
    personal_access_token = module.secret_azdo.values["azure-devops-github-pr-TOKEN"].value
  }
  lifecycle {
    ignore_changes = [description, authorization]
  }
}

# TODO azure devops terraform provider does not support SonarCloud service endpoint
locals {
  azuredevops_serviceendpoint_sonarcloud_id = "TODO: create sonar cloud id"
}
