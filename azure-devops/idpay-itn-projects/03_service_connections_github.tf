#
# 🐙 GITHUB
#

# Github service connection (RW)
resource "azuredevops_serviceendpoint_github" "io-azure-devops-github-rw" {
  depends_on = [data.azuredevops_project.this]

  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "io-azure-devops-github-rw"
  auth_personal {
    personal_access_token = module.domain_prod_secrets.values["cstar-azure-devops-github-rw-TOKEN"].value
  }
  lifecycle {
    ignore_changes = [description, authorization]
  }
}

# Github service connection (read-only)
resource "azuredevops_serviceendpoint_github" "io-azure-devops-github-ro" {
  depends_on = [data.azuredevops_project.this]

  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "io-azure-devops-github-ro"
  auth_personal {
    personal_access_token = module.domain_prod_secrets.values["cstar-azure-devops-github-ro-TOKEN"].value
  }
  lifecycle {
    ignore_changes = [description, authorization]
  }
}

# Github service connection (pull request)
resource "azuredevops_serviceendpoint_github" "io-azure-devops-github-pr" {
  depends_on = [data.azuredevops_project.this]

  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "io-azure-devops-github-pr"
  auth_personal {
    personal_access_token = module.domain_prod_secrets.values["cstar-azure-devops-github-pr-TOKEN"].value
  }
  lifecycle {
    ignore_changes = [description, authorization]
  }
}
