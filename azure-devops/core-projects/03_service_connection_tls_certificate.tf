#
# DEV
#

module "dev_cstar_core_tls_cert_service_conn_federated" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"

  providers = {
    azurerm = azurerm.dev
  }

  location            = local.location
  resource_group_name = local.dev_identity_rg_name

  project_id        = data.azuredevops_project.project.id
  name              = "${local.project_prefix_short}-d-${local.domain}-tls-azdo-cert"
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_name = local.dev_subscription_name
  subscription_id   = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
}

resource "azurerm_key_vault_access_policy" "DEV-CSTAR-CORE-TLS-CERT-SERVICE-CONN_kv_access_policy" {
  provider     = azurerm.dev
  key_vault_id = data.azurerm_key_vault.domain_kv_dev.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.dev_cstar_core_tls_cert_service_conn_federated.service_principal_object_id

  certificate_permissions = ["Get", "Import", "Update"]
  secret_permissions      = ["Get"]
}

# create let's encrypt credential used to create SSL certificates
module "letsencrypt_dev" {
  source = "./.terraform/modules/__v3__/letsencrypt_credential"

  providers = {
    azurerm = azurerm.dev
  }
  prefix            = local.project_prefix_short
  env               = "d"
  key_vault_name    = local.dev_key_vault_name
  subscription_name = local.dev_subscription_name
}

#
# UAT
#

module "uat_cstar_core_tls_cert_service_conn_federated" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"

  providers = {
    azurerm = azurerm.uat
  }

  location            = local.location
  resource_group_name = local.uat_identity_rg_name

  project_id        = data.azuredevops_project.project.id
  name              = "${local.project_prefix_short}-u-${local.domain}-tls-azdo-cert"
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_name = local.uat_subscription_name
  subscription_id   = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
}

resource "azurerm_key_vault_access_policy" "UAT-CSTAR-CORE-TLS-CERT-SERVICE-CONN_kv_access_policy" {
  provider     = azurerm.uat
  key_vault_id = data.azurerm_key_vault.domain_kv_uat.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.uat_cstar_core_tls_cert_service_conn_federated.service_principal_object_id

  certificate_permissions = ["Get", "Import", "Update"]
  secret_permissions      = ["Get"]
}

# create let's encrypt credential used to create SSL certificates
module "letsencrypt_uat" {
  source = "./.terraform/modules/__v3__/letsencrypt_credential"

  providers = {
    azurerm = azurerm.uat
  }
  prefix            = local.project_prefix_short
  env               = "u"
  key_vault_name    = local.uat_key_vault_name
  subscription_name = local.uat_subscription_name
}

#
# PROD
#
module "prod_cstar_core_tls_cert_service_conn_federated" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"

  providers = {
    azurerm = azurerm.prod
  }

  location            = local.location
  resource_group_name = local.prod_identity_rg_name

  project_id        = data.azuredevops_project.project.id
  name              = "${local.project_prefix_short}-p-${local.domain}-tls-azdo-cert"
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_name = local.prod_subscription_name
  subscription_id   = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id
}

resource "azurerm_key_vault_access_policy" "PROD-CSTAR-CORE-TLS-CERT-SERVICE-CONN_kv_access_policy" {
  provider     = azurerm.prod
  key_vault_id = data.azurerm_key_vault.domain_kv_prod.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.prod_cstar_core_tls_cert_service_conn_federated.service_principal_object_id

  certificate_permissions = ["Get", "Import", "Update"]
  secret_permissions      = ["Get"]
}

# create let's encrypt credential used to create SSL certificates
module "letsencrypt_prod" {
  source = "./.terraform/modules/__v3__/letsencrypt_credential"

  providers = {
    azurerm = azurerm.prod
  }
  prefix            = local.project_prefix_short
  env               = "p"
  key_vault_name    = local.prod_key_vault_name
  subscription_name = local.prod_subscription_name
}
