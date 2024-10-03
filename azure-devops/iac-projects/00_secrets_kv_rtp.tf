#
# PROD ECOMMERCE KEYVAULT
#

module "rtp_dev_secrets" {

  providers = {
    azurerm = azurerm.dev
  }

  source = "./.terraform/modules/__v3__/key_vault_secrets_query"


  resource_group = local.dev_rtp_key_vault_resource_group
  key_vault_name = local.dev_rtp_key_vault_name

  secrets = [
    "cstar-d-weu-dev01-aks-apiserver-url",
    "cstar-d-weu-dev01-aks-azure-devops-sa-token",
    "cstar-d-weu-dev01-aks-azure-devops-sa-cacrt",
  ]
}

# module "rtp_uat_secrets" {
#   source = "./.terraform/modules/__v3__/key_vault_secrets_query"


#   providers = {
#     azurerm = azurerm.uat
#   }

#   resource_group = local.uat_rtp_key_vault_resource_group
#   key_vault_name = local.uat_rtp_key_vault_name

#   secrets = [
#     "cstar-u-weu-uat01-aks-azure-devops-sa-token",
#     "cstar-u-weu-uat01-aks-azure-devops-sa-cacrt",
#     "cstar-u-weu-uat01-aks-apiserver-url"
#   ]
# }

# module "rtp_prod_secrets" {
#   source = "./.terraform/modules/__v3__/key_vault_secrets_query"


#   providers = {
#     azurerm = azurerm.prod
#   }

#   resource_group = local.prod_rtp_key_vault_resource_group
#   key_vault_name = local.prod_rtp_key_vault_name

#   secrets = [
#     "cstar-p-weu-prod01-aks-azure-devops-sa-token",
#     "cstar-p-weu-prod01-aks-azure-devops-sa-cacrt",
#     "cstar-p-weu-prod01-aks-apiserver-url"
#   ]
# }
