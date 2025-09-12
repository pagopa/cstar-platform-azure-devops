locals {
  prefix = "cstar"

  dev_subscription_name  = "dev-${local.prefix}"
  uat_subscription_name  = "uat-${local.prefix}"
  prod_subscription_name = "prod-${local.prefix}"

  dev_identity_rg_name  = "${local.prefix}-d-identity-rg"
  uat_identity_rg_name  = "${local.prefix}-u-identity-rg"
  prod_identity_rg_name = "${local.prefix}-p-identity-rg"

  aks_dev_platform_name  = "${local.prefix}-d-weu-dev01-aks"
  aks_uat_platform_name  = "${local.prefix}-u-weu-uat01-aks"
  aks_prod_platform_name = "${local.prefix}-p-weu-prod01-aks"
}
