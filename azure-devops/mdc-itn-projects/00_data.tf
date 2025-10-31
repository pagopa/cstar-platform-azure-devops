data "azurerm_client_config" "current" {}

data "azuredevops_project" "this" {
  name = local.azdo_project_name
}

#
# AZURE
#
data "azurerm_subscriptions" "dev" {
  display_name_prefix = var.dev_subscription_name
}

data "azurerm_subscriptions" "uat" {
  display_name_prefix = var.uat_subscription_name
}
data "azurerm_subscriptions" "prod" {
  display_name_prefix = var.prod_subscription_name
}

data "azuredevops_group" "admin" {
  project_id = data.azuredevops_project.this.id
  name       = "admins"
}

#
# KV
#
data "azurerm_key_vault" "dev_kv_domain" {
  provider = azurerm.dev

  name                = local.dev_kv_domain_name
  resource_group_name = local.dev_kv_domain_resource_group
}

data "azurerm_key_vault" "uat_kv_domain" {
  provider = azurerm.uat

  name                = local.uat_kv_domain_name
  resource_group_name = local.uat_kv_domain_resource_group
}

data "azurerm_key_vault" "prod_kv_domain" {
  provider = azurerm.prod

  name                = local.prod_kv_domain_name
  resource_group_name = local.prod_kv_domain_resource_group
}
