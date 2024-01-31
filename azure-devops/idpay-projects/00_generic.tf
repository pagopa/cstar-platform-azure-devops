data "azurerm_client_config" "current" {}

data "azurerm_subscriptions" "prod" {
  display_name_prefix = var.prod_subscription_name
}

data "azurerm_subscriptions" "uat" {
  display_name_prefix = var.uat_subscription_name
}

data "azurerm_subscriptions" "dev" {
  display_name_prefix = var.dev_subscription_name
}

#
# ENV
#
data "azuredevops_environment" "dev_env" {
  project_id= data.azuredevops_project.project.id
  name = "DEV"
}

data "azuredevops_environment" "uat_env" {
  project_id= data.azuredevops_project.project.id
  name = "UAT"
}

data "azuredevops_environment" "prod_env" {
  project_id= data.azuredevops_project.project.id
  name = "PROD"
}

#
# Agent pool
#
data "azuredevops_agent_pool" "cstar_dev_linux" {
  name = "cstar-dev-linux"
}

data "azuredevops_agent_pool" "cstar_uat_linux" {
  name = "cstar-uat-linux"
}

data "azuredevops_agent_pool" "cstar_prod_linux" {
  name = "cstar-prod-linux"
}

