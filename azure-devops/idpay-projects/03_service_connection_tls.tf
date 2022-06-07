module "DEV-CSTAR-IDPAY-TLS-CERT-SERVICE-CONN" {

  providers = {
    azurerm = azurerm.dev
  }

  depends_on = [data.azuredevops_project.project]
  source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_limited?ref=v2.1.0"

  project_id        = data.azuredevops_project.project.id
  name              = "${local.prefix}-d-${local.domain}-tls-cert"
  tenant_id         = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  subscription_name = local.dev_cstar_subscription_name
  subscription_id   = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value
  #tfsec:ignore:GEN003
  renew_token = local.tlscert_renew_token

  credential_subcription              = local.dev_cstar_subscription_name
  credential_key_vault_name           = local.dev_idpay_key_vault_name
  credential_key_vault_resource_group = local.dev_idpay_key_vault_resource_group
}

# module "UAT-SELFCARE-TLS-CERT-SERVICE-CONN" {
#   depends_on = [azuredevops_project.project]
#   source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_limited?ref=v2.0.4"

#   project_id        = azuredevops_project.project.id
#   name              = "selc-u-tls-cert"
#   tenant_id         = module.secrets.values["PAGOPAIT-TENANTID"].value
#   subscription_id   = module.secrets.values["PAGOPAIT-UAT-SELFCARE-SUBSCRIPTION-ID"].value
#   subscription_name = "UAT-SelfCare"
#   #tfsec:ignore:GEN003
#   renew_token = local.tlscert_renew_token

#   credential_subcription              = local.key_vault_subscription
#   credential_key_vault_name           = local.key_vault_name
#   credential_key_vault_resource_group = local.key_vault_resource_group
# }

# module "PROD-SELFCARE-TLS-CERT-SERVICE-CONN" {
#   depends_on = [azuredevops_project.project]
#   source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_limited?ref=v2.0.4"

#   project_id        = azuredevops_project.project.id
#   name              = "selc-p-tls-cert"
#   tenant_id         = module.secrets.values["PAGOPAIT-TENANTID"].value
#   subscription_id   = module.secrets.values["PAGOPAIT-PROD-SELFCARE-SUBSCRIPTION-ID"].value
#   subscription_name = "PROD-SelfCare"
#   #tfsec:ignore:GEN003
#   renew_token = local.tlscert_renew_token

#   credential_subcription              = local.key_vault_subscription
#   credential_key_vault_name           = local.key_vault_name
#   credential_key_vault_resource_group = local.key_vault_resource_group
# }
