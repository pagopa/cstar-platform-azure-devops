locals {
  prefix           = "cstar"
  azure_devops_org = "pagopaspa"
  domain           = "rtp"
   
  # 🔐 KV AZDO
  dev_key_vault_resource_group  = "${local.prefix}-d-sec-rg"
  uat_key_vault_resource_group  = "${local.prefix}-u-sec-rg"
  prod_key_vault_resource_group = "${local.prefix}-p-sec-rg"

  dev_key_vault_azdo_name  = "${local.prefix}-d-azdo-${var.location_short}-kv"
  uat_key_vault_azdo_name  = "${local.prefix}-u-azdo-${var.location_short}-kv"
  prod_key_vault_azdo_name = "${local.prefix}-p-azdo-${var.location_short}-kv"

  # 🔐 KV Domain
  dev_domain_key_vault_resource_group  = "${local.prefix}-d-${var.location_short}-${local.domain}-sec-rg"
  uat_domain_key_vault_resource_group  = "${local.prefix}-u-${var.location_short}-${local.domain}-sec-rg"
  prod_domain_key_vault_resource_group = "${local.prefix}-p-${var.location_short}-${local.domain}-sec-rg"

  dev_domain_key_vault_name  = "${local.prefix}-d-${var.location_short}-${local.domain}-kv"
  uat_domain_key_vault_name  = "${local.prefix}-u-${var.location_short}-${local.domain}-kv"
  prod_domain_key_vault_name = "${local.prefix}-p-${var.location_short}-${local.domain}-kv"

  # ☁️ VNET
  dev_vnet_rg  = "${local.prefix}-d-vnet-rg"
  uat_vnet_rg  = "${local.prefix}-u-vnet-rg"
  prod_vnet_rg = "${local.prefix}-p-vnet-rg"

  location              = "westeurope"
  dev_identity_rg_name  = "${local.prefix}-d-identity-rg"
  uat_identity_rg_name  = "${local.prefix}-u-identity-rg"
  prod_identity_rg_name = "${local.prefix}-p-identity-rg"

  # DNS Zone

  rg_dev_dns_zone_name  = "${local.prefix}-d-vnet-rg"
  rg_uat_dns_zone_name  = "${local.prefix}-u-vnet-rg"
  rg_prod_dns_zone_name = "${local.prefix}-p-vnet-rg"

  dev_dns_zone_name  = "dev.${local.prefix}.pagopa.it"
  uat_dns_zone_name  = "uat.${local.prefix}.pagopa.it"
  prod_dns_zone_name = "${local.prefix}.pagopa.it"

  # 📦 DOCKER DEV FOR AKS
  srv_endpoint_name_aks_dev_docker_registry = "${local.prefix}-aks-cr-dev"
  aks_dev_docker_registry_rg_name           = "${local.prefix}-d-container-registry-rg"
  aks_dev_docker_registry_name              = "${local.prefix}dcommonacr"

  # 📦 DOCKER UAT FOR AKS
  srv_endpoint_name_aks_uat_docker_registry = "${local.prefix}-aks-cr-uat"
  aks_uat_docker_registry_rg_name           = "${local.prefix}-u-container-registry-rg"
  aks_uat_docker_registry_name              = "${local.prefix}ucommonacr"

  # 📦 DOCKER PROD FOR AKS
  srv_endpoint_name_aks_docker_prod = "${local.prefix}-aks-cr-prod"
  aks_docker_rg_name_prod           = "${local.prefix}-p-container-registry-rg"
  aks_prod_docker_registry_name     = "${local.prefix}pcommonacr"

  # AKS
  srv_endpoint_name_aks_dev  = "${local.prefix}-${local.domain}-aks-dev"
  srv_endpoint_name_aks_uat  = "${local.prefix}-${local.domain}-aks-uat"
  srv_endpoint_name_aks_prod = "${local.prefix}-${local.domain}-aks-prod"

  # Agent Pool
  azdo_agent_pool_dev  = "${local.prefix}-dev-linux"
  azdo_agent_pool_uat  = "${local.prefix}-uat-linux"
  azdo_agent_pool_prod = "${local.prefix}-prod-linux"

  # Subscription Name
  dev_cstar_subscription_name  = "dev-${local.prefix}"
  uat_cstar_subscription_name  = "uat-${local.prefix}"
  prod_cstar_subscription_name = "prod-${local.prefix}"

  # Front end
  dev_storage_account_rg      = "${local.prefix}-d-${var.location_short}-${local.domain}-fe-rg"
  dev_storage_account_name    = "${local.prefix}d${var.location_short}${local.domain}fesa"
  dev_cdn_endpoint            = "${local.prefix}-d-${var.location_short}-${local.domain}-fe-cdn-endpoint"
  dev_cdn_profile             = "${local.prefix}-d-${var.location_short}-${local.domain}-fe-cdn-profile"
  dev_apim_prefix_domain      = ""

  uat_storage_account_rg      = "${local.prefix}-u-${var.location_short}-${local.domain}-fe-rg"
  uat_storage_account_name    = "${local.prefix}u${var.location_short}${local.domain}fesa"
  uat_cdn_endpoint            = "${local.prefix}-u-${var.location_short}-${local.domain}-fe-cdn-endpoint"
  uat_cdn_profile             = "${local.prefix}-u-${var.location_short}-${local.domain}-fe-cdn-profile"
  uat_apim_prefix_domain      = ""

  prod_storage_account_rg      = "${local.prefix}-p-${var.location_short}-${local.domain}-fe-rg"
  prod_storage_account_name    = "${local.prefix}p${var.location_short}${local.domain}fesa"
  prod_cdn_endpoint            = "${local.prefix}-p-${var.location_short}-${local.domain}-fe-cdn-endpoint"
  prod_cdn_profile             = "${local.prefix}-p-${var.location_short}-${local.domain}-fe-cdn-profile"
  prod_apim_prefix_domain      = ""

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

  # UAT
  service_endpoint_azure_devops_docker_uat_name = data.azuredevops_serviceendpoint_azurecr.uat_weu_workload_identity.service_endpoint_name
  service_endpoint_azure_devops_docker_uat_id   = data.azuredevops_serviceendpoint_azurecr.uat_weu_workload_identity.id
  service_endpoint_azure_uat_id                 = data.azuredevops_serviceendpoint_azurerm.azure_uat.id

  # PROD
  service_endpoint_azure_devops_docker_prod_name = data.azuredevops_serviceendpoint_azurecr.prod_weu_workload_identity.service_endpoint_name
  service_endpoint_azure_devops_docker_prod_id   = data.azuredevops_serviceendpoint_azurecr.prod_weu_workload_identity.id
  service_endpoint_azure_prod_id                 = data.azuredevops_serviceendpoint_azurerm.azure_prod.id

}
