#
# Subscriptions
#

data "azurerm_subscriptions" "dev" {
  display_name_prefix = local.dev_subscription_name
}

data "azurerm_subscriptions" "uat" {
  display_name_prefix = local.uat_subscription_name
}

data "azurerm_subscriptions" "prod" {
  display_name_prefix = local.prod_subscription_name
}

#
# Projects
#

data "azuredevops_project" "this" {
  for_each = {
    for i, project_name in local.projects : project_name => project_name
  }

  name = each.value
}

#
# GITHUB
#

data "azuredevops_serviceendpoint_github" "azure_devops_github_ro" {
  for_each = {
    for i, project_name in local.projects : project_name => project_name
  }

  project_id            = data.azuredevops_project.this[each.value].id
  service_endpoint_name = local.devops_settings[each.value].srv_endpoint_github_ro
}

data "azuredevops_serviceendpoint_github" "azure_devops_github_pr" {
  for_each = {
    for i, project_name in local.projects : project_name => project_name
  }

  project_id            = data.azuredevops_project.this[each.value].id
  service_endpoint_name = local.devops_settings[each.value].srv_endpoint_github_pr
}
