resource "azuredevops_team" "external_team" {
  project_id = data.azuredevops_project.project.id
  name       = "${local.project_prefix_short}-projects-externals-team"
}

data "azuredevops_group" "technical_project_managers" {
  project_id = data.azuredevops_project.project.id
  name       = "technical-project-managers"
}

data "azuredevops_team" "developers" {
  project_id = data.azuredevops_project.project.id
  name       = "developers"
}
