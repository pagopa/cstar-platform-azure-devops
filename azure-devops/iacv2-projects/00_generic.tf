data "azurerm_client_config" "current" {}

data "azurerm_subscriptions" "dev" {
  display_name_prefix = local.dev_subscription_name
}

data "azurerm_subscriptions" "uat" {
  display_name_prefix = local.uat_subscription_name
}

data "azurerm_subscriptions" "prod" {
  display_name_prefix = local.prod_subscription_name
}

data "azuredevops_project" "project" {
  name = "${local.prefix}-platform-iac-projects"
}

data "azuredevops_group" "admin" {
  project_id = data.azuredevops_project.project.id
  name       = "Project Administrators"
}

data "azuredevops_group" "iac_team" {
  project_id = data.azuredevops_project.project.id
  name       = "cstar-platform-iac-projects Team"
}
