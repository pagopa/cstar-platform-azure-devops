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
    "${local.tf_aks_dev_name[each.value.location_short]}-azure-devops-sa-token",
    "${local.tf_aks_dev_name[each.value.location_short]}-azure-devops-sa-cacrt",
    "${local.tf_aks_dev_name[each.value.location_short]}-apiserver-url"
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
    "${local.tf_aks_uat_name[each.value.location_short]}-azure-devops-sa-token",
    "${local.tf_aks_uat_name[each.value.location_short]}-azure-devops-sa-cacrt",
    "${local.tf_aks_uat_name[each.value.location_short]}-apiserver-url"
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
    "${local.tf_aks_prod_name[each.value.location_short]}-azure-devops-sa-token",
    "${local.tf_aks_prod_name[each.value.location_short]}-azure-devops-sa-cacrt",
    "${local.tf_aks_prod_name[each.value.location_short]}-apiserver-url"
  ]
}

#
# PROD KEYVAULT
#

module "secrets" {
  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  resource_group = local.prod_key_vault_azdo_resource_group
  key_vault_name = local.prod_key_vault_azdo_name

  secrets = [
    "cstar-azure-devops-github-ro-TOKEN",
    "cstar-azure-devops-github-rw-TOKEN",
    "cstar-azure-devops-github-pr-TOKEN",
  ]
}
