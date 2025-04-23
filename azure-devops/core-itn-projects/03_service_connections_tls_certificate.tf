#
# 🟢 DEV - TLS CERTIFICATE
#
module "dev_tls_cert_service_connection" {
  source = "./.terraform/modules/__devops_v0__/workflow_tls_cert_service_connection"

  providers = {
    azurerm = azurerm.dev
  }

  env_short       = "d"
  prefix          = local.prefix
  location        = local.location
  azdo_project_id = data.azuredevops_project.this.id

  identity_name                = "${local.product}-dev-${local.domain_core}-azdo-tls-cert"
  identity_resource_group_name = local.dev_identity_core_itn_rg_name
  key_vault_id                 = data.azurerm_key_vault.dev_kv_core.id
  key_vault_name               = local.dev_kv_core_name

  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_name = local.dev_subscription_name
  subscription_id   = local.dev_subscription_id
}

#
# 🟨 UAT - TLS CERTIFICATE
#
module "uat_tls_cert_service_connection" {
  source = "./.terraform/modules/__devops_v0__/workflow_tls_cert_service_connection"

  providers = {
    azurerm = azurerm.uat
  }

  env_short       = "u"
  prefix          = local.prefix
  location        = local.location
  azdo_project_id = data.azuredevops_project.this.id

  identity_name                = "${local.product}-uat-${local.domain_core}-azdo-tls-cert"
  identity_resource_group_name = local.uat_identity_core_itn_rg_name
  key_vault_id                 = data.azurerm_key_vault.uat_kv_core.id
  key_vault_name               = local.uat_kv_core_name

  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_name = local.uat_subscription_name
  subscription_id   = local.uat_subscription_id
}

#
# 🛑 PROD - TLS CERTIFICATE
#
module "prod_tls_cert_service_connection" {
  source = "./.terraform/modules/__devops_v0__/workflow_tls_cert_service_connection"

  providers = {
    azurerm = azurerm.prod
  }

  env_short       = "p"
  prefix          = local.prefix
  location        = local.location
  azdo_project_id = data.azuredevops_project.this.id

  identity_name                = "${local.product}-prod-${local.domain_core}-azdo-tls-cert"
  identity_resource_group_name = local.prod_identity_core_itn_rg_name
  key_vault_id                 = data.azurerm_key_vault.prod_kv_core.id
  key_vault_name               = local.prod_kv_core_name

  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_name = local.prod_subscription_name
  subscription_id   = local.prod_subscription_id
}
