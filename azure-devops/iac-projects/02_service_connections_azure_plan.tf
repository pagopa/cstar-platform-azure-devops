#
# DEV
#
module "DEV-CSTAR-PLAN-SERVICE-CONN" {

  providers = {
    azurerm = azurerm.dev
  }

  depends_on = [data.azuredevops_project.project]
  source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan?ref=add-service-endpoint-sp-personal"

  project_id        = data.azuredevops_project.project.id
  name              = "${local.project_prefix_short}-d-${local.domain}"
  tenant_id         = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  subscription_name = local.dev_subscription_name
  subscription_id   = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value

  credential_subcription              = local.dev_subscription_name
  credential_key_vault_name           = local.dev_domain_key_vault_name
  credential_key_vault_resource_group = local.dev_domain_key_vault_resource_group
}

#
# UAT
#
module "UAT-CSTAR-PLAN-SERVICE-CONN" {

  providers = {
    azurerm = azurerm.uat
  }

  depends_on = [data.azuredevops_project.project]
  source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan?ref=add-service-endpoint-sp-personal"

  project_id        = data.azuredevops_project.project.id
  name              = "${local.project_prefix_short}-u-${local.domain}"
  tenant_id         = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  subscription_name = local.uat_subscription_name
  subscription_id   = module.secret_azdo.values["PAGOPAIT-UAT-CSTAR-SUBSCRIPTION-ID"].value
  #tfsec:ignore:GEN003
  renew_token = local.tlscert_renew_token

  credential_subcription              = local.uat_subscription_name
  credential_key_vault_name           = local.uat_domain_key_vault_name
  credential_key_vault_resource_group = local.uat_domain_key_vault_resource_group
}

#
# PROD
#
module "PROD-CSTAR-PLAN-SERVICE-CONN" {

  providers = {
    azurerm = azurerm.prod
  }

  depends_on = [data.azuredevops_project.project]
  source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan?ref=add-service-endpoint-sp-personal"

  project_id        = data.azuredevops_project.project.id
  name              = "${local.project_prefix_short}-p-${local.domain}"
  tenant_id         = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  subscription_name = local.prod_subscription_name
  subscription_id   = module.secret_azdo.values["PAGOPAIT-PROD-CSTAR-SUBSCRIPTION-ID"].value
  #tfsec:ignore:GEN003
  renew_token = local.tlscert_renew_token

  credential_subcription              = local.prod_subscription_name
  credential_key_vault_name           = local.prod_domain_key_vault_name
  credential_key_vault_resource_group = local.prod_domain_key_vault_resource_group
}
