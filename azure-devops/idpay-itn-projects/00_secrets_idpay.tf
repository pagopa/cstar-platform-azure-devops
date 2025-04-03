#
# PROD KEYVAULT
#

module "domain_dev_secrets" {

  providers = {
    azurerm = azurerm.dev
  }

  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query?ref=v7.47.2"

  resource_group = local.dev_domain_key_vault_resource_group
  key_vault_name = local.dev_domain_key_vault_name

  secrets = [
    "${local.dev_aks_name}-azure-devops-sa-token",
    "${local.dev_aks_name}-azure-devops-sa-cacrt",
    "${local.dev_aks_name}-apiserver-url",
    "argocd-admin-password",
    "argocd-admin-username",
    "argocd-server-url",
  ]
}

module "domain_uat_secrets" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query?ref=v7.47.2"

  providers = {
    azurerm = azurerm.uat
  }

  resource_group = local.uat_domain_key_vault_resource_group
  key_vault_name = local.uat_domain_key_vault_name

  secrets = [
    "${local.uat_aks_name}-azure-devops-sa-token",
    "${local.uat_aks_name}-azure-devops-sa-cacrt",
    "${local.uat_aks_name}-apiserver-url",
    "argocd-admin-password",
    "argocd-admin-username",
    "argocd-server-url",
  ]
}

module "domain_prod_secrets" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query?ref=v7.47.2"

  providers = {
    azurerm = azurerm.prod
  }

  resource_group = local.prod_domain_key_vault_resource_group
  key_vault_name = local.prod_domain_key_vault_name

  secrets = [
    "${local.prod_aks_name}-azure-devops-sa-token",
    "${local.prod_aks_name}-azure-devops-sa-cacrt",
    "${local.prod_aks_name}-apiserver-url",
    "argocd-admin-password",
    "argocd-admin-username",
    "argocd-server-url",
  ]
}
