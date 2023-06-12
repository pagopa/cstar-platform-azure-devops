#
# ⛩ Service connections
#

# DEV service connection
resource "azuredevops_serviceendpoint_azurerm" "DEV-CSTAR" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "DEV-CSTAR-SERVICE-CONN"
  description               = "DEV-CSTAR Service connection"
  azurerm_subscription_name = "DEV-CSTAR"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value
}

# UAT service connection
resource "azuredevops_serviceendpoint_azurerm" "UAT-CSTAR" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "UAT-CSTAR-SERVICE-CONN"
  description               = "UAT-CSTAR Service connection"
  azurerm_subscription_name = "UAT-CSTAR"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-UAT-CSTAR-SUBSCRIPTION-ID"].value
}

# PROD service connection
resource "azuredevops_serviceendpoint_azurerm" "PROD-CSTAR" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "PROD-CSTAR-SERVICE-CONN"
  description               = "PROD-CSTAR Service connection"
  azurerm_subscription_name = "PROD-CSTAR"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-PROD-CSTAR-SUBSCRIPTION-ID"].value
}

#
# PLAN Azure service connections
#
module "DEV-CSTAR-CORE-PLAN-SERVICE-CONN" {

  providers = {
    azurerm = azurerm.dev
  }

  depends_on = [data.azuredevops_project.project]
  source     = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan?ref=add-service-endpoint-sp-personal"

  project_id        = data.azuredevops_project.project.id
  name              = "${local.project_prefix_short}-d-${local.domain}-plan-app"
  tenant_id         = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  subscription_name = local.dev_subscription_name
  subscription_id   = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value
  #tfsec:ignore:GEN003
  # renew_token = local.tlscert_renew_token

  credential_subcription              = local.dev_subscription_name
  credential_key_vault_name           = local.dev_domain_key_vault_name
  credential_key_vault_resource_group = local.dev_domain_key_vault_resource_group
}

