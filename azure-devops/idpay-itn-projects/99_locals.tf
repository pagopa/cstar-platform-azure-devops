locals {
  prefix            = "cstar"
  domain            = "idpay"
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


  # 🔑 Key Vault
  dev_kv_domain_name            = "${local.prefix}-d-${local.location_short}-${local.domain}-kv"
  dev_kv_domain_resource_group  = "${local.prefix}-d-${local.location_short}-${local.domain}-security-rg"
  uat_kv_domain_name            = "${local.prefix}-u-${local.location_short}-${local.domain}-kv"
  uat_kv_domain_resource_group  = "${local.prefix}-u-${local.location_short}-${local.domain}-security-rg"
  prod_kv_domain_name           = "${local.prefix}-p-${local.location_short}-${local.domain}-kv"
  prod_kv_domain_resource_group = "${local.prefix}-p-${local.location_short}-${local.domain}-security-rg"

  # 🌐 Network
  rg_dev_dns_zone_name  = "cstar-d-vnet-rg"
  rg_uat_dns_zone_name  = "cstar-u-vnet-rg"
  rg_prod_dns_zone_name = "cstar-p-vnet-rg"

  dev_dns_zone_name  = "dev.cstar.pagopa.it"
  uat_dns_zone_name  = "uat.cstar.pagopa.it"
  prod_dns_zone_name = "cstar.pagopa.it"

  # Idenity RG
  dev_identity_rg_name  = "cstar-d-itn-idpay-cicd-rg"
  uat_identity_rg_name  = "cstar-u-itn-idpay-cicd-rg"
  prod_identity_rg_name = "cstar-p-itn-idpay-cicd-rg"

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
