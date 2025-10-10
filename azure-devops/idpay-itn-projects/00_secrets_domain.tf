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
    # "${local.dev_aks_name}-azure-devops-sa-token",
    # "${local.dev_aks_name}-azure-devops-sa-cacrt",
    # "${local.dev_aks_name}-apiserver-url",
    "argocd-admin-password",
    "argocd-admin-username",
    "argocd-server-url",
    # "idpay-workload-identity-client-id",
    "keycloak-test-user-username",
    "keycloak-test-user-password"
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
    # "${local.uat_aks_name}-azure-devops-sa-token",
    # "${local.uat_aks_name}-azure-devops-sa-cacrt",
    # "${local.uat_aks_name}-apiserver-url",
    "argocd-admin-password",
    "argocd-admin-username",
    "argocd-server-url",
    # "idpay-workload-identity-client-id",
    "keycloak-test-user-username",
    "keycloak-test-user-password"
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
    "idpay-bot-github-rw-TOKEN",
    "idpay-bot-github-ro-TOKEN",
    "idpay-bot-github-pr-TOKEN",
    "argocd-admin-password",
    "argocd-admin-username",
    "argocd-server-url"
  ]
}
