#
# 🐙 GITHUB
#

# Github service connection (RW)
resource "azuredevops_serviceendpoint_github" "idpay_bot_github_rw" {
  depends_on = [data.azuredevops_project.this]

  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "idpay-bot-github-rw"
  auth_personal {
    personal_access_token = module.domain_prod_secrets.values["idpay-bot-github-rw-TOKEN"].value
  }
  lifecycle {
    ignore_changes = [description, authorization]
  }
}

# Github service connection (read-only)
resource "azuredevops_serviceendpoint_github" "idpay_bot_github_ro" {
  depends_on = [data.azuredevops_project.this]

  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "idpay-bot-github-ro"
  auth_personal {
    personal_access_token = module.domain_prod_secrets.values["idpay-bot-github-ro-TOKEN"].value
  }
  lifecycle {
    ignore_changes = [description, authorization]
  }
}

# Github service connection (pull request)
resource "azuredevops_serviceendpoint_github" "idpay_bot_github_pr" {
  depends_on = [data.azuredevops_project.this]

  project_id            = data.azuredevops_project.this.id
  service_endpoint_name = "idpay-bot-github-pr"
  auth_personal {
    personal_access_token = module.domain_prod_secrets.values["idpay-bot-github-pr-TOKEN"].value
  }
  lifecycle {
    ignore_changes = [description, authorization]
  }
}
