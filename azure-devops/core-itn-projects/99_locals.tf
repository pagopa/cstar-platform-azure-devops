locals {
  prefix            = "cstar"
  domain_core            = "core"
  location_short    = "itn"
  location          = "italynorth"
  azdo_project_name = "cstar-platform-app-projects"
  product           = "${local.prefix}-${local.location_short}"

  # Subscriptions
  dev_subscription_name  = data.azurerm_subscriptions.dev.subscriptions[0].display_name
  uat_subscription_name  = data.azurerm_subscriptions.uat.subscriptions[0].display_name
  prod_subscription_name = data.azurerm_subscriptions.prod.subscriptions[0].display_name

  dev_subscription_id  = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
  uat_subscription_id  = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
  prod_subscription_id = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id

  # Identity RG
  dev_identity_core_itn_rg_name  = "${local.prefix}-d-${local.location_short}-${local.domain_core}-identity-rg"
  uat_identity_core_itn_rg_name  = "${local.prefix}-u-${local.location_short}-${local.domain_core}-identity-rg"
  prod_identity_core_itn_rg_name  = "${local.prefix}-p-${local.location_short}-${local.domain_core}-identity-rg"

  # 🔑 Key Vault
  dev_kv_core_name            = "${local.prefix}-d-${local.location_short}-${local.domain_core}-kv"
  dev_kv_core_resource_group  = "${local.prefix}-d-${local.location_short}-${local.domain_core}-sec-rg"
  uat_kv_core_name            = "${local.prefix}-u-${local.location_short}-${local.domain_core}-kv"
  uat_kv_core_resource_group  = "${local.prefix}-u-${local.location_short}-${local.domain_core}-sec-rg"
  prod_kv_core_name           = "${local.prefix}-p-${local.location_short}-${local.domain_core}-kv"
  prod_kv_core_resource_group = "${local.prefix}-p-${local.location_short}-${local.domain_core}-sec-rg"

  # 🌐 Network
  rg_dev_dns_zone_name  = "cstar-d-vnet-rg"
  rg_uat_dns_zone_name  = "cstar-u-vnet-rg"
  rg_prod_dns_zone_name = "cstar-p-vnet-rg"

  dev_dns_zone_name  = "dev.cstar.pagopa.it"
  uat_dns_zone_name  = "uat.cstar.pagopa.it"
  prod_dns_zone_name = "cstar.pagopa.it"
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
