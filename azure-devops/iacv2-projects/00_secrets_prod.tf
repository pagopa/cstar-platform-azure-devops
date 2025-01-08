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
    "TENANT-ID",
    "DEV-SUBSCRIPTION-ID",
    "UAT-SUBSCRIPTION-ID",
    "PROD-SUBSCRIPTION-ID",
  ]
}
