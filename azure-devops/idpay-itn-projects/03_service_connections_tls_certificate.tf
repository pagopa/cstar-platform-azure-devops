#
# 🟢 DEV - TLS CERTIFICATE
#
module "dev_tls_cert_service_conn" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"

  providers = {
    azurerm = azurerm.dev
  }

  project_id = local.devops_project_id
  #tfsec:ignore:general-secrets-no-plaintext-exposure
  name              = "${local.prefix}-${local.domain}-d-azdo-tls-cert-kv-policy"
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_id   = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
  subscription_name = data.azurerm_subscriptions.dev.subscriptions[0].display_name

  location            = local.location
  resource_group_name = local.dev_identity_rg_name

}

data "azurerm_key_vault" "kv_domain_dev" {
  provider = azurerm.dev

  name                = local.dev_domain_kv_name
  resource_group_name = local.dev_domain_kv_resource_group
}

resource "azurerm_key_vault_access_policy" "dev_tls_cert_service_conn" {
  provider = azurerm.dev

  key_vault_id = data.azurerm_key_vault.kv_domain_dev.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.dev_tls_cert_service_conn.service_principal_object_id

  certificate_permissions = ["Get", "Import"]
}

#
# 🟨 UAT - TLS CERTIFICATE
#

module "uat_tls_cert_service_conn" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"

  providers = {
    azurerm = azurerm.uat
  }

  project_id = local.devops_project_id
  #tfsec:ignore:general-secrets-no-plaintext-exposure
  name              = "${local.prefix}-${local.domain}-u-azdo-tls-cert-kv-policy"
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_id   = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
  subscription_name = data.azurerm_subscriptions.uat.subscriptions[0].display_name

  location            = local.location
  resource_group_name = local.uat_identity_rg_name

}

data "azurerm_key_vault" "kv_domain_uat" {
  provider = azurerm.uat

  name                = local.uat_domain_kv_name
  resource_group_name = local.uat_domain_kv_resource_group
}

resource "azurerm_key_vault_access_policy" "uat_tls_cert_service_conn" {
  provider = azurerm.uat

  key_vault_id = data.azurerm_key_vault.kv_domain_uat.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.uat_tls_cert_service_conn.service_principal_object_id

  certificate_permissions = ["Get", "Import"]
}


#
# 🛑 PROD - TLS CERTIFICATE
#
module "prod_tls_cert_service_conn" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"

  providers = {
    azurerm = azurerm.prod
  }

  project_id = local.devops_project_id
  #tfsec:ignore:general-secrets-no-plaintext-exposure
  name              = "${local.prefix}-${local.domain}-p-azdo-tls-cert-kv-policy"
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_id   = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id
  subscription_name = data.azurerm_subscriptions.prod.subscriptions[0].display_name

  location            = local.location
  resource_group_name = local.prod_identity_rg_name

  depends_on = [module.letsencrypt_prod]
}

data "azurerm_key_vault" "kv_domain_prod" {
  provider = azurerm.prod

  name                = local.prod_domain_kv_name
  resource_group_name = local.prod_domain_kv_resource_group
}

resource "azurerm_key_vault_access_policy" "prod_tls_cert_service_conn" {
  provider = azurerm.prod

  key_vault_id = data.azurerm_key_vault.kv_domain_prod.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.prod_tls_cert_service_conn.service_principal_object_id

  certificate_permissions = ["Get", "Import"]
}
