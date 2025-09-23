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

# Certificate pipeline action group
data "azurerm_monitor_action_group" "certificate_pipeline_status_dev" {
  provider = azurerm.dev

  resource_group_name = local.dev_monitor_rg
  name                = local.dev_cert_diff_pipeline_status_name
}

data "azurerm_monitor_action_group" "certificate_pipeline_status_uat" {
  provider = azurerm.uat

  resource_group_name = local.uat_monitor_rg
  name                = local.uat_cert_diff_pipeline_status_name
}

data "azurerm_monitor_action_group" "certificate_pipeline_status_prod" {
  provider = azurerm.prod

  resource_group_name = local.prod_monitor_rg
  name                = local.prod_cert_diff_pipeline_status_name
}
