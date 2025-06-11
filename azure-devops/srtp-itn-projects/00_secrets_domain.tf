#
# 🟢 DEV - SECRET
#

module "domain_dev_secrets" {
  providers = {
    azurerm = azurerm.dev
  }

  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  key_vault_name = local.dev_kv_domain_name
  resource_group = local.dev_kv_domain_resource_group

  secrets = [
  ]
}


#
# 🟨 UAT - SECRETS
#

module "domain_uat_secrets" {
  providers = {
    azurerm = azurerm.uat
  }

  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  key_vault_name = local.uat_kv_domain_name
  resource_group = local.uat_kv_domain_resource_group

  secrets = [
  ]
}

#
# 🛑 PROD - SECRETS
#

module "domain_prod_secrets" {
  providers = {
    azurerm = azurerm.prod
  }

  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  key_vault_name = local.prod_kv_domain_name
  resource_group = local.prod_kv_domain_resource_group

  secrets = [
    "srtp-bot-github-rw-TOKEN",
    "srtp-bot-github-ro-TOKEN",
    "srtp-bot-github-pr-TOKEN",
  ]
}
