locals {
  prefix           = "cstar"
  azure_devops_org = "pagopaspa"
  domain           = "idpay"

  # 🔐 KV AZDO
  dev_key_vault_resource_group  = "${local.prefix}-d-sec-rg"
  uat_key_vault_resource_group  = "${local.prefix}-u-sec-rg"
  prod_key_vault_resource_group = "${local.prefix}-p-sec-rg"

  dev_key_vault_azdo_name  = "${local.prefix}-d-azdo-weu-kv"
  uat_key_vault_azdo_name  = "${local.prefix}-u-azdo-weu-kv"
  prod_key_vault_azdo_name = "${local.prefix}-p-azdo-weu-kv"

  # 🔐 KV Domain
  dev_domain_key_vault_resource_group  = "${local.prefix}-d-${local.domain}-sec-rg"
  uat_domain_key_vault_resource_group  = "${local.prefix}-u-${local.domain}-sec-rg"
  prod_domain_key_vault_resource_group = "${local.prefix}-p-${local.domain}-sec-rg"

  dev_domain_key_vault_name  = "${local.prefix}-d-${local.domain}-kv"
  uat_domain_key_vault_name  = "${local.prefix}-u-${local.domain}-kv"
  prod_domain_key_vault_name = "${local.prefix}-p-${local.domain}-kv"

  # ☁️ VNET
  dev_vnet_rg  = "${local.prefix}-d-vnet-rg"
  uat_vnet_rg  = "${local.prefix}-u-vnet-rg"
  prod_vnet_rg = "${local.prefix}-p-vnet-rg"

  # DNS Zone

  rg_dev_dns_zone_name  = "cstar-d-vnet-rg"
  rg_uat_dns_zone_name  = "cstar-u-vnet-rg"
  rg_prod_dns_zone_name = "cstar-p-vnet-rg"

  dev_dns_zone_name  = "dev.cstar.pagopa.it"
  uat_dns_zone_name  = "uat.cstar.pagopa.it"
  prod_dns_zone_name = "cstar.pagopa.it"

  # 📦 ACR DEV FOR AKS
  aks_dev_docker_registry_rg_name = "${local.prefix}-d-container-registry-rg"
  aks_dev_docker_registry_name    = "${local.prefix}dcommonacr"

  # 📦 ACR UAT FOR AKS
  aks_uat_docker_registry_rg_name = "${local.prefix}-u-container-registry-rg"
  aks_uat_docker_registry_name    = "${local.prefix}ucommonacr"

  # 📦 ACR PROD FOR AKS
  aks_docker_rg_name_prod       = "${local.prefix}-p-container-registry-rg"
  aks_prod_docker_registry_name = "${local.prefix}pcommonacr"

  # AKS
  srv_endpoint_name_aks_dev  = "${local.prefix}-${local.domain}-aks-dev"
  srv_endpoint_name_aks_uat  = "${local.prefix}-${local.domain}-aks-uat"
  srv_endpoint_name_aks_prod = "${local.prefix}-${local.domain}-aks-prod"

  # Agent Pool
  azdo_agent_pool_dev  = "cstar-dev-linux"
  azdo_agent_pool_uat  = "cstar-uat-linux"
  azdo_agent_pool_prod = "cstar-prod-linux"

  # Subscription Name
  dev_cstar_subscription_name  = "dev-cstar"
  uat_cstar_subscription_name  = "uat-cstar"
  prod_cstar_subscription_name = "prod-cstar"

  #
  # Outputs from CORE
  #
  service_endpoint_io_azure_devops_github_ro_name = "io-azure-devops-github-ro"
  service_endpoint_io_azure_devops_github_pr_name = "io-azure-devops-github-pr"
  service_endpoint_io_azure_devops_github_pr_id   = data.azuredevops_serviceendpoint_github.io-azure-devops-github-pr.id
  service_endpoint_io_azure_devops_github_ro_id   = data.azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id

  # DEV
  service_endpoint_azure_devops_docker_dev_name = data.azuredevops_serviceendpoint_azurecr.dev_weu_workload_identity.service_endpoint_name
  service_endpoint_azure_devops_docker_dev_id   = data.azuredevops_serviceendpoint_azurecr.dev_weu_workload_identity.id
  service_endpoint_azure_dev_id                 = data.azuredevops_serviceendpoint_azurerm.azure_dev.id
  service_endpoint_azure_dev_name               = data.azuredevops_serviceendpoint_azurerm.azure_dev.service_endpoint_name

  # UAT
  service_endpoint_azure_devops_docker_uat_name = data.azuredevops_serviceendpoint_azurecr.uat_weu_workload_identity.service_endpoint_name
  service_endpoint_azure_devops_docker_uat_id   = data.azuredevops_serviceendpoint_azurecr.uat_weu_workload_identity.id
  service_endpoint_azure_uat_id                 = data.azuredevops_serviceendpoint_azurerm.azure_uat.id
  service_endpoint_azure_uat_name               = data.azuredevops_serviceendpoint_azurerm.azure_uat.service_endpoint_name

  # PROD
  service_endpoint_azure_devops_docker_prod_name = data.azuredevops_serviceendpoint_azurecr.prod_weu_workload_identity.service_endpoint_name
  service_endpoint_azure_devops_docker_prod_id   = data.azuredevops_serviceendpoint_azurecr.prod_weu_workload_identity.id
  service_endpoint_azure_prod_id                 = data.azuredevops_serviceendpoint_azurerm.azure_prod.id
  service_endpoint_azure_prod_name               = data.azuredevops_serviceendpoint_azurerm.azure_prod.service_endpoint_name


  #tfsec:ignore:GEN002
  tlscert_renew_token = "v2"
}

#
# Subscription
#

variable "dev_subscription_name" {
  type        = string
  description = "DEV Subscription name"
}

variable "uat_subscription_name" {
  type        = string
  description = "UAT Subscription name"
}

variable "prod_subscription_name" {
  type        = string
  description = "PROD Subscription name"
}

variable "project_name" {
  type        = string
  description = "Project name (e.g. pagoPA platform)"
}

variable "service_endpoint_azure_dev_name" {
  type        = string
  description = "azure service endpoint name for dev"
}

variable "service_endpoint_azure_uat_name" {
  type        = string
  description = "azure service endpoint name for uat"

}

variable "service_endpoint_azure_prod_name" {
  type        = string
  description = "azure service endpoint name for prod"

}

#
# ACR Workload
#
variable "acr_weu_service_connection_workload_identity_dev" {
  type        = string
  description = "The service connection ID for the ITA DEV workload identity in Azure Container Registry"
  default     = ""
}

variable "acr_weu_service_connection_workload_identity_uat" {
  type        = string
  description = "The service connection ID for the ITA UAT workload identity in Azure Container Registry"
  default     = ""
}

variable "acr_weu_service_connection_workload_identity_prod" {
  type        = string
  description = "The service connection ID for the ITA PROD workload identity in Azure Container Registry"
  default     = ""
}
