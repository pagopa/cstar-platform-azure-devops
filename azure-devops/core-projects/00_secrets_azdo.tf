module "secret_azdo" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query?ref=v7.47.2"

  resource_group = local.prod_domain_key_vault_resource_group
  key_vault_name = local.prod_key_vault_azdo_name

  secrets = [
    "cstar-azure-devops-github-ro-TOKEN",
    "cstar-azure-devops-github-pr-TOKEN",
    "cstar-azure-devops-github-rw-TOKEN",
  ]
}
