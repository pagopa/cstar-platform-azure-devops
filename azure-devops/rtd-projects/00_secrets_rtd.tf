#
# DEV
#
module "domain_dev_secrets" {

  providers = {
    azurerm = azurerm.dev
  }

  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query?ref=v7.47.2"

  resource_group = local.dev_domain_key_vault_resource_group
  key_vault_name = local.dev_domain_key_vault_name

  secrets = [
    "cstar-d-weu-dev01-aks-apiserver-url",
    "cstar-d-weu-dev01-aks-azure-devops-sa-token",
    "cstar-d-weu-dev01-aks-azure-devops-sa-cacrt",
    "rtd-workload-identity-client-id",
  ]
}

#
# UAT
#
module "domain_uat_secrets" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query?ref=v7.47.2"

  providers = {
    azurerm = azurerm.uat
  }

  resource_group = local.uat_domain_key_vault_resource_group
  key_vault_name = local.uat_domain_key_vault_name

  secrets = [
    "cstar-u-weu-uat01-aks-azure-devops-sa-token",
    "cstar-u-weu-uat01-aks-azure-devops-sa-cacrt",
    "cstar-u-weu-uat01-aks-apiserver-url",
    "rtd-workload-identity-client-id",
  ]
}

#
# PROD
#
module "domain_prod_secrets" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query?ref=v7.47.2"

  providers = {
    azurerm = azurerm.prod
  }

  resource_group = local.prod_domain_key_vault_resource_group
  key_vault_name = local.prod_domain_key_vault_name

  secrets = [
    "cstar-p-weu-prod01-aks-azure-devops-sa-token",
    "cstar-p-weu-prod01-aks-azure-devops-sa-cacrt",
    "cstar-p-weu-prod01-aks-apiserver-url",
    "rtd-workload-identity-client-id",
  ]
}
