locals {
  prefix            = "cstar"
  domain            = "mdc"
  location_short    = "itn"
  location          = "italynorth"
  azdo_project_name = "cstar-platform-app-projects"
  product           = "${local.prefix}-${local.location_short}"

  devops_project_id = data.azuredevops_project.this.project_id

  ### Agent Pool
  azdo_agent_pool_dev  = "cstar-dev-linux"
  azdo_agent_pool_uat  = "cstar-uat-linux"
  azdo_agent_pool_prod = "cstar-prod-linux"

  # Default Domain Resource Group
  dev_data_rg_name  = "${local.prefix}-d-${local.location_short}-${local.domain}-data-rg"
  uat_data_rg_name  = "${local.prefix}-u-${local.location_short}-${local.domain}-data-rg"
  prod_data_rg_name = "${local.prefix}-p-${local.location_short}-${local.domain}-data-rg"

  # Storage Accounts
  dev_storage_account_name  = "${local.prefix}d${local.location_short}${local.domain}fesa"
  uat_storage_account_name  = "${local.prefix}u${local.location_short}${local.domain}fesa"
  prod_storage_account_name = "${local.prefix}p${local.location_short}${local.domain}fesa"

  # CDN
  dev_cdn_endpoint  = "${local.prefix}-d-${local.location_short}-${local.domain}-fe-cdn-endpoint"
  dev_cdn_profile   = "${local.prefix}-d-${local.location_short}-${local.domain}-fe-cdn-profile"
  uat_cdn_endpoint  = "${local.prefix}-u-${local.location_short}-${local.domain}-fe-cdn-endpoint"
  uat_cdn_profile   = "${local.prefix}-u-${local.location_short}-${local.domain}-fe-cdn-profile"
  prod_cdn_endpoint = "${local.prefix}-p-${local.location_short}-${local.domain}-fe-cdn-endpoint"
  prod_cdn_profile  = "${local.prefix}-p-${local.location_short}-${local.domain}-fe-cdn-profile"

  #
  # Subscriptions
  dev_subscription_name  = data.azurerm_subscriptions.dev.subscriptions[0].display_name
  uat_subscription_name  = data.azurerm_subscriptions.uat.subscriptions[0].display_name
  prod_subscription_name = data.azurerm_subscriptions.prod.subscriptions[0].display_name

  dev_subscription_id  = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
  uat_subscription_id  = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
  prod_subscription_id = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id


  ### 🔑 Key Vault
  dev_kv_domain_name            = "${local.prefix}-d-${local.location_short}-${local.domain}-kv"
  dev_kv_domain_resource_group  = "${local.prefix}-d-${local.location_short}-${local.domain}-security-rg"
  uat_kv_domain_name            = "${local.prefix}-u-${local.location_short}-${local.domain}-kv"
  uat_kv_domain_resource_group  = "${local.prefix}-u-${local.location_short}-${local.domain}-security-rg"
  prod_kv_domain_name           = "${local.prefix}-p-${local.location_short}-${local.domain}-kv"
  prod_kv_domain_resource_group = "${local.prefix}-p-${local.location_short}-${local.domain}-security-rg"

  ### 🌐 Network
  rg_dev_dns_zone_name  = "cstar-d-vnet-rg"
  rg_uat_dns_zone_name  = "cstar-u-vnet-rg"
  rg_prod_dns_zone_name = "cstar-p-vnet-rg"

  ### Idenity RG
  dev_identity_rg_name  = "cstar-d-itn-mdc-cicd-rg"
  uat_identity_rg_name  = "cstar-u-itn-mdc-cicd-rg"
  prod_identity_rg_name = "cstar-p-itn-mdc-cicd-rg"

  ### Service connections/endpoints Azure
  dev_service_endpoint_azure_id    = data.azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn.service_endpoint_id
  dev_service_endpoint_azure_name  = data.azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn.service_endpoint_name
  uat_service_endpoint_azure_id    = data.azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn.service_endpoint_id
  uat_service_endpoint_azure_name  = data.azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn.service_endpoint_name
  prod_service_endpoint_azure_id   = data.azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn.service_endpoint_id
  prod_service_endpoint_azure_name = data.azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn.service_endpoint_name

  ### Service connections/endpoints GitHub
  service_connection_github_rw_id   = azuredevops_serviceendpoint_github.bot_github_rw.id
  service_connection_github_rw_name = azuredevops_serviceendpoint_github.bot_github_rw.service_endpoint_name
  service_connection_github_ro_id   = azuredevops_serviceendpoint_github.bot_github_ro.id
  service_connection_github_ro_name = azuredevops_serviceendpoint_github.bot_github_ro.service_endpoint_name
  service_connection_github_pr_id   = azuredevops_serviceendpoint_github.bot_github_pr.id
  service_connection_github_pr_name = azuredevops_serviceendpoint_github.bot_github_pr.service_endpoint_name

}

# LOCAL TLS CERT
locals {
  tlscert_repository = {
    organization   = "pagopa"
    name           = "le-azure-acme-tiny"
    branch_name    = "refs/heads/master"
    pipelines_path = "."
  }
}
