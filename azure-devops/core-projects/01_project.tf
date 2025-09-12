data "azuredevops_project" "project" {
  name = var.project_name
}

data "azuredevops_project" "iac" {
  name = var.project_iac_name
}
