#
# CSTAR KEYVAULT
#

module "dev_secrets" {
  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  for_each = { for d in local.domains : d.name => d if contains(d.envs, "d") && try(d.kv_name, "") != "" }

  providers = {
    azurerm = azurerm.dev
  }

  resource_group = format(each.value.rg_name, "d")
  key_vault_name = format(each.value.kv_name, "d")

  secrets = [
    "${var.aks_dev_platform_name}-azure-devops-sa-token",
    "${var.aks_dev_platform_name}-azure-devops-sa-cacrt",
    "${var.aks_dev_platform_name}-apiserver-url"
  ]
}

module "uat_secrets" {
  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  for_each = { for d in local.domains : d.name => d if contains(d.envs, "u") && try(d.kv_name, "") != "" }

  providers = {
    azurerm = azurerm.uat
  }

  resource_group = format(each.value.rg_name, "u")
  key_vault_name = format(each.value.kv_name, "u")


  secrets = [
    "${var.aks_uat_platform_name}-azure-devops-sa-token",
    "${var.aks_uat_platform_name}-azure-devops-sa-cacrt",
    "${var.aks_uat_platform_name}-apiserver-url"
  ]
}

module "prod_secrets" {
  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  for_each = { for d in local.domains : d.name => d if contains(d.envs, "p") && try(d.kv_name, "") != "" }

  providers = {
    azurerm = azurerm.prod
  }

  resource_group = format(each.value.rg_name, "p")
  key_vault_name = format(each.value.kv_name, "p")


  secrets = [
    "${var.aks_prod_platform_name}-azure-devops-sa-token",
    "${var.aks_prod_platform_name}-azure-devops-sa-cacrt",
    "${var.aks_prod_platform_name}-apiserver-url"
  ]
}
