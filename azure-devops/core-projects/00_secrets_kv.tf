module "dev_secrets" {
  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  providers = {
    azurerm = azurerm.dev
  }

  resource_group = local.dev_key_vault_resource_group
  key_vault_name = local.dev_key_vault_name

  secrets = [
    "tls-cert-diff-receiver-emails",
    "tls-cert-diff-sender-email",
    "tls-cert-diff-sender-email-app-pass",
  ]
}

module "uat_secrets" {
  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  providers = {
    azurerm = azurerm.uat
  }

  resource_group = local.uat_key_vault_resource_group
  key_vault_name = local.uat_key_vault_name

  secrets = [
    "tls-cert-diff-receiver-emails",
    "tls-cert-diff-sender-email",
    "tls-cert-diff-sender-email-app-pass",
  ]
}

module "prod_secrets" {
  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  resource_group = local.prod_key_vault_resource_group
  key_vault_name = local.prod_key_vault_name

  secrets = [
    "tls-cert-diff-receiver-emails",
    "tls-cert-diff-sender-email",
    "tls-cert-diff-sender-email-app-pass",
  ]
}

module "azdo_prod_secrets" {
  source = "./.terraform/modules/__v3__/key_vault_secrets_query"

  resource_group = local.prod_key_vault_resource_group
  key_vault_name = local.prod_key_vault_azdo_name

  secrets = [
    "cstar-azure-devops-github-ro-TOKEN",
    "cstar-azure-devops-github-pr-TOKEN",
    "cstar-azure-devops-github-rw-TOKEN",
  ]
}
