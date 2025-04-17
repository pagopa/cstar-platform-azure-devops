#
# 🟢 DEV - SECRET
#

module "cittadini_dev_secrets" {
  providers = {
    azurerm = azurerm.dev
  }

  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  resource_group = local.dev_domain_kv_resource_group
  key_vault_name = local.dev_domain_kv_name

  secrets = [
    # "${local.dev_aks_name}-azure-devops-sa-token",
    # "${local.dev_aks_name}-azure-devops-sa-cacrt",
    # "${local.dev_aks_name}-apiserver-url",
    "argocd-admin-password",
    "argocd-admin-username",
    "argocd-server-url",
    # "cittadini-workload-identity-client-id",
  ]
}


#
# 🟨 UAT - SECRETS
#

module "cittadini_uat_secrets" {
  providers = {
    azurerm = azurerm.uat
  }

  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  resource_group = local.uat_domain_kv_resource_group
  key_vault_name = local.uat_domain_kv_name

  secrets = [
    # "${local.uat_aks_name}-azure-devops-sa-token",
    # "${local.uat_aks_name}-azure-devops-sa-cacrt",
    # "${local.uat_aks_name}-apiserver-url",
    # "argocd-admin-password",
    # "argocd-admin-username",
    # "argocd-server-url",
    # "cittadini-workload-identity-client-id",
  ]
}

#
# 🛑 PROD - SECRETS
#

module "cittadini_prod_secrets" {
  providers = {
    azurerm = azurerm.prod
  }

  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  resource_group = local.prod_domain_kv_resource_group
  key_vault_name = local.prod_domain_kv_name

  secrets = [
    "azure-devops-github-ro-TOKEN",
    "azure-devops-github-rw-TOKEN",
    "azure-devops-github-pr-TOKEN",
  ]
}
