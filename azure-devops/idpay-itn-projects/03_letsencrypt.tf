# #
# # 🟢 DEV - LETSENCRYPT
# #
# module "letsencrypt_dev" {
#   source = "./.terraform/modules/__v3__/letsencrypt_credential"

#   providers = {
#     azurerm = azurerm.dev
#   }

#   prefix            = local.prefix
#   env               = "d"
#   key_vault_name    = local.dev_domain_kv_name
#   subscription_name = data.azurerm_subscriptions.dev.subscriptions[0].display_name
# }

# #
# # 🟨 UAT - LETSENCRYPT
# #

# module "letsencrypt_uat" {
#   source = "./.terraform/modules/__v3__/letsencrypt_credential"

#   providers = {
#     azurerm = azurerm.uat
#   }

#   prefix            = local.prefix
#   env               = "u"
#   key_vault_name    = local.uat_domain_kv_name
#   subscription_name = data.azurerm_subscriptions.uat.subscriptions[0].display_name
# }

# #
# # 🛑 PROD - LETSENCRYPT
# #
# module "letsencrypt_prod" {
#   source = "./.terraform/modules/__v3__/letsencrypt_credential"

#   providers = {
#     azurerm = azurerm.prod
#   }

#   prefix            = local.prefix
#   env               = "p"
#   key_vault_name    = local.prod_domain_kv_name
#   subscription_name = data.azurerm_subscriptions.prod.subscriptions[0].display_name
# }
