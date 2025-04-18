#
# 🟢 DEV - TLS CERTIFICATE
#
module "letsencrypt_dev" {
  source = "./.terraform/modules/__v3__/letsencrypt_credential"

  providers = {
    azurerm = azurerm.dev
  }

  prefix            = local.prefix
  env               = "d"
  key_vault_name    = local.dev_kv_domain_name
  subscription_name = data.azurerm_subscriptions.dev.subscriptions[0].display_name
}

module "dev_tls_cert_service_conn" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"

  providers = {
    azurerm = azurerm.dev
  }

  project_id = data.azuredevops_project.this.id
  #tfsec:ignore:general-secrets-no-plaintext-exposure
  name              = "${local.project}-dev-azdo-tls-cert"
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_id   = local.dev_subscription_id
  subscription_name = local.dev_subscription_name

  location            = local.location
  resource_group_name = local.dev_identity_rg_name

}

resource "azurerm_key_vault_access_policy" "dev_tls_cert_service_conn" {
  provider = azurerm.dev

  key_vault_id = data.azurerm_key_vault.dev_kv_domain.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.dev_tls_cert_service_conn.service_principal_object_id

  certificate_permissions = ["Get", "Import"]
}

# #
# # 🟨 UAT - TLS CERTIFICATE
# #
# module "letsencrypt_uat" {
#   source = "./.terraform/modules/__v3__/letsencrypt_credential"
#
#   providers = {
#     azurerm = azurerm.uat
#   }
#
#   prefix            = local.prefix
#   env               = "u"
#   key_vault_name    = local.uat_kv_domain_name
#   subscription_name = data.azurerm_subscriptions.uat.subscriptions[0].display_name
# }
#
# module "uat_tls_cert_service_conn" {
#   source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"
#
#   providers = {
#     azurerm = azurerm.uat
#   }
#
#   project_id = data.azuredevops_project.this.id
#   #tfsec:ignore:general-secrets-no-plaintext-exposure
#   name              = "${local.project}-uat-azdo-tls-cert"
#   tenant_id         = data.azurerm_client_config.current.tenant_id
#   subscription_id   = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
#   subscription_name = data.azurerm_subscriptions.uat.subscriptions[0].display_name
#
#   location            = local.location
#   resource_group_name = local.uat_identity_rg_name
#
# }
#
#
# resource "azurerm_key_vault_access_policy" "uat_tls_cert_service_conn" {
#   provider = azurerm.uat
#
#   key_vault_id = data.azurerm_key_vault.uat_kv_domain.id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = module.uat_tls_cert_service_conn.service_principal_object_id
#
#   certificate_permissions = ["Get", "Import"]
# }
#
#
# #
# # 🛑 PROD - TLS CERTIFICATE
# #
# module "letsencrypt_prod" {
#   source = "./.terraform/modules/__v3__/letsencrypt_credential"
#
#   providers = {
#     azurerm = azurerm.prod
#   }
#
#   prefix            = local.prefix
#   env               = "p"
#   key_vault_name    = local.prod_kv_domain_name
#   subscription_name = data.azurerm_subscriptions.prod.subscriptions[0].display_name
# }
#
# module "prod_tls_cert_service_conn" {
#   source = "./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated"
#
#   providers = {
#     azurerm = azurerm.prod
#   }
#
#   project_id = data.azuredevops_project.this.id
#   #tfsec:ignore:general-secrets-no-plaintext-exposure
#   name              = "${local.project}-prod-azdo-tls-cert"
#   tenant_id         = data.azurerm_client_config.current.tenant_id
#   subscription_id   = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id
#   subscription_name = data.azurerm_subscriptions.prod.subscriptions[0].display_name
#
#   location            = local.location
#   resource_group_name = local.prod_identity_rg_name
#
#   depends_on = [module.letsencrypt_prod]
# }
#
#
# resource "azurerm_key_vault_access_policy" "prod_tls_cert_service_conn" {
#   provider = azurerm.prod
#
#   key_vault_id = data.azurerm_key_vault.prod_kv_domain.id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = module.prod_tls_cert_service_conn.service_principal_object_id
#
#   certificate_permissions = ["Get", "Import"]
# }
