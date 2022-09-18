#
# ⛩ Service connections
#

# DEV service connection
resource "azuredevops_serviceendpoint_azurerm" "DEV-CORE-AZURE" {

  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "DEV-CORE-AZURE-SERVICE-CONN"
  description               = "DEV-CORE-AZURE Service connection"
  azurerm_subscription_name = "DEV-CORE-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value
}

# UAT service connection
resource "azuredevops_serviceendpoint_azurerm" "UAT-CORE-AZURE" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "UAT-CORE-AZURE-SERVICE-CONN"
  description               = "UAT-CORE-AZURE Service connection"
  azurerm_subscription_name = "UAT-CORE-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-UAT-CSTAR-SUBSCRIPTION-ID"].value
}

# PROD service connection
resource "azuredevops_serviceendpoint_azurerm" "PROD-CORE-AZURE" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "PROD-CORE-AZURE-SERVICE-CONN"
  description               = "PROD-CORE-AZURE Service connection"
  azurerm_subscription_name = "PROD-CORE-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-PROD-CSTAR-SUBSCRIPTION-ID"].value
}

#--------
# IDPAY
#--------

# DEV service connection
resource "azuredevops_serviceendpoint_azurerm" "DEV-IDPAY-AZURE" {

  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "DEV-IDPAY-AZURE-SERVICE-CONN"
  description               = "DEV-IDPAY-AZURE Service connection"
  azurerm_subscription_name = "DEV-IDPAY-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value
}

# UAT service connection
resource "azuredevops_serviceendpoint_azurerm" "UAT-IDPAY-AZURE" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "UAT-IDPAY-AZURE-SERVICE-CONN"
  description               = "UAT-IDPAY-AZURE Service connection"
  azurerm_subscription_name = "UAT-IDPAY-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-UAT-CSTAR-SUBSCRIPTION-ID"].value
}

# PROD service connection
resource "azuredevops_serviceendpoint_azurerm" "PROD-IDPAY-AZURE" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "PROD-IDPAY-AZURE-SERVICE-CONN"
  description               = "PROD-IDPAY-AZURE Service connection"
  azurerm_subscription_name = "PROD-IDPAY-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-PROD-CSTAR-SUBSCRIPTION-ID"].value
}

#--------
# RTD
#--------

# DEV service connection
resource "azuredevops_serviceendpoint_azurerm" "DEV-RTD-AZURE" {

  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "DEV-RTD-AZURE-SERVICE-CONN"
  description               = "DEV-RTD-AZURE Service connection"
  azurerm_subscription_name = "DEV-RTD-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value
}

# UAT service connection
resource "azuredevops_serviceendpoint_azurerm" "UAT-RTD-AZURE" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "UAT-RTD-AZURE-SERVICE-CONN"
  description               = "UAT-RTD-AZURE Service connection"
  azurerm_subscription_name = "UAT-RTD-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-UAT-CSTAR-SUBSCRIPTION-ID"].value
}

# PROD service connection
resource "azuredevops_serviceendpoint_azurerm" "PROD-RTD-AZURE" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "PROD-RTD-AZURE-SERVICE-CONN"
  description               = "PROD-RTD-AZURE Service connection"
  azurerm_subscription_name = "PROD-RTD-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-PROD-CSTAR-SUBSCRIPTION-ID"].value
}

#--------
# TAE
#--------

# DEV service connection
resource "azuredevops_serviceendpoint_azurerm" "DEV-TAE-AZURE" {

  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "DEV-TAE-AZURE-SERVICE-CONN"
  description               = "DEV-TAE-AZURE Service connection"
  azurerm_subscription_name = "DEV-TAE-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value
}

# UAT service connection
resource "azuredevops_serviceendpoint_azurerm" "UAT-TAE-AZURE" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "UAT-TAE-AZURE-SERVICE-CONN"
  description               = "UAT-TAE-AZURE Service connection"
  azurerm_subscription_name = "UAT-TAE-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-UAT-CSTAR-SUBSCRIPTION-ID"].value
}

# PROD service connection
resource "azuredevops_serviceendpoint_azurerm" "PROD-TAE-AZURE" {
  depends_on = [data.azuredevops_project.project]

  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = "PROD-TAE-AZURE-SERVICE-CONN"
  description               = "PROD-TAE-AZURE Service connection"
  azurerm_subscription_name = "PROD-TAE-AZURE"
  azurerm_spn_tenantid      = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
  azurerm_subscription_id   = module.secret_azdo.values["PAGOPAIT-PROD-CSTAR-SUBSCRIPTION-ID"].value
}
