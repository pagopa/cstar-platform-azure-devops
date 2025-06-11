locals {
  prefix            = "cstar"
  domain            = "srtp"
  location_short    = "itn"
  location          = "italynorth"
  azdo_project_name = "cstar-platform-app-projects"
  product           = "${local.prefix}-${local.location_short}"

  devops_project_id = data.azuredevops_project.this.project_id

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

  dev_dns_zone_name  = "dev.cstar.pagopa.it"
  uat_dns_zone_name  = "uat.cstar.pagopa.it"
  prod_dns_zone_name = "cstar.pagopa.it"

  ### Idenity RG
  dev_identity_rg_name  = "cstar-d-itn-srtp-cicd-rg"
  uat_identity_rg_name  = "cstar-u-itn-srtp-cicd-rg"
  prod_identity_rg_name = "cstar-p-itn-srtp-cicd-rg"

  ### Agent Pool
  azdo_agent_pool_dev  = "cstar-dev-linux"
  azdo_agent_pool_uat  = "cstar-uat-linux"
  azdo_agent_pool_prod = "cstar-prod-linux"

  ### AKS
  dev_aks_name  = "${local.prefix}-d-${local.location_short}-aks"
  uat_aks_name  = "${local.prefix}-u-${local.location_short}-aks"
  prod_aks_name = "${local.prefix}-p-${local.location_short}-aks"

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
