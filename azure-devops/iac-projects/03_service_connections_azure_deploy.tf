#
# ⛩ Service connections
#

module "dev_tf_azure_service_connection_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"

  for_each = local.projects

  providers = {
    azurerm = azurerm.dev
  }

  project_id = data.azuredevops_project.this[each.key].project_id

  name              = "azdo-dev-${local.prefix}-${each.key}-deploy-v2"
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_id   = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
  subscription_name = local.dev_subscription_name

  location            = var.location
  resource_group_name = local.dev_identity_rg_name
}

resource "azurerm_role_assignment" "dev_apply_permissions" {
  for_each = local.projects

  scope                = data.azurerm_subscriptions.dev.subscriptions[0].id
  role_definition_name = "Contributor"
  principal_id         = module.dev_tf_azure_service_connection_deploy[each.key].identity_principal_id
}

#
# UAT
#

module "uat_tf_azure_service_connection_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"

  for_each = local.projects

  providers = {
    azurerm = azurerm.uat
  }

  project_id = data.azuredevops_project.this[each.key].project_id

  name              = "azdo-uat-${local.prefix}-${each.key}-deploy-v2"
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_id   = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
  subscription_name = local.uat_subscription_name

  location            = var.location
  resource_group_name = local.uat_identity_rg_name
}

resource "azurerm_role_assignment" "uat_apply_permissions" {
  for_each = local.projects

  scope                = data.azurerm_subscriptions.uat.subscriptions[0].id
  role_definition_name = "Contributor"
  principal_id         = module.uat_tf_azure_service_connection_deploy[each.key].identity_principal_id
}

#
# PROD
#

module "prod_tf_azure_service_connection_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"

  providers = {
    azurerm = azurerm.prod
  }

  for_each = local.projects

  project_id = data.azuredevops_project.this[each.key].project_id

  name              = "azdo-prod-${local.prefix}-${each.key}-deploy-v2"
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_id   = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id
  subscription_name = local.prod_subscription_name

  location            = var.location
  resource_group_name = local.prod_identity_rg_name

  check_approval_enabled = true
  approver_ids = [
    for k, g in data.azuredevops_group.groups :
    g.origin_id if g.project_id == data.azuredevops_project.this[each.key].id &&
    contains(local.devops_settings[each.key].groups, g.name)
  ]
}

resource "azurerm_role_assignment" "prod_apply_permissions" {
  for_each = local.projects

  scope                = data.azurerm_subscriptions.prod.subscriptions[0].id
  role_definition_name = "Contributor"
  principal_id         = module.prod_tf_azure_service_connection_deploy[each.key].identity_principal_id
}
