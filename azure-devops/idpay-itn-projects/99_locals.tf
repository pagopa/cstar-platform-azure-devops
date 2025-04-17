locals {
  prefix         = "p4pa"
  domain         = "idpay"
  location_short = "itn"
  location       = "italynorth"

  product         = "${local.prefix}-${local.domain}"
  external_domain = "pagopa.it"
  dns_zone_third  = "idpay.pagopa.it"

  # # ⚙️ DevOps
  # devops_project_id      = data.azuredevops_project.this.project_id
  # domain_namespace       = local.domain
  # srv_endpoint_sonar     = data.azuredevops_serviceendpoint_sonarcloud.azure_devops_sonar.id
  # srv_endpoint_github_id = data.azuredevops_serviceendpoint_github.arc_azure_devops_github_rw.id

  # # 🟢 DEV
  # dev_subscription_name        = "dev-${local.prefix}"
  # dev_domain_kv_name           = "${local.prefix}-d-${local.location_short}-${local.domain}-kv"
  # dev_domain_kv_resource_group = "${local.prefix}-d-${local.location_short}-idpay-sec-rg"
  # # dev_aks_name                 = "${local.prefix}-d-${local.location_short}-dev-aks"
  # # dev_azurecr_name             = "${local.prefix}d${local.location_short}corecommonacr"
  # dev_azdo_agent_pool = "${local.prefix}-dev-linux-app"

  # dev_apim_prefix_domain     = "https://api.dev.idpay.pagopa.it"
  # dev_storage_account_rg     = "${local.prefix}-d-${local.location_short}-${local.domain}-cdn-rg"
  # dev_storage_account_name   = replace("${local.prefix}-d-${local.domain}-sa", "-", "")
  # dev_cdn_profile            = "${local.prefix}-d-${local.domain}-cdn-profile"
  # dev_cdn_endpoint           = "${local.prefix}-d-${local.domain}-cdn-endpoint"
  # dev_checkout_prefix_domain = "https://dev.checkout.pagopa.it"
  # dev_checkout_platform_url  = "https://api.dev.platform.pagopa.it/checkout/ec/v1"
  # dev_payment_return_url     = "https://dev.idpay.pagopa.it/pagamenti"

  # # dev_srv_endpoint_aks_name                 = "${local.prefix}-${local.domain}-aks-dev"
  # # dev_srv_endpoint_azure_devops_docker_name = data.azuredevops_serviceendpoint_azurecr.dev_ita_workload_identity.service_endpoint_name
  # # dev_srv_endpoint_azure_devops_docker_id   = data.azuredevops_serviceendpoint_azurecr.dev_ita_workload_identity.id
  # # dev_srv_endpoint_aks_id                   = azuredevops_serviceendpoint_kubernetes.aks_dev.id
  # dev_srv_endpoint_azure_id   = data.azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn.id
  # dev_srv_endpoint_azure_name = data.azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn.service_endpoint_name
  # dev_srv_endpoint_tls_id     = module.dev_tls_cert_service_conn.service_endpoint_id

  # dev_identity_rg_name = "${local.prefix}-d-${local.location_short}-core-identity-rg"

  # # 🟨 UAT
  # uat_subscription_name        = "uat-${local.prefix}"
  # uat_domain_kv_name           = "${local.prefix}-u-${local.location_short}-${local.domain}-kv"
  # uat_domain_kv_resource_group = "${local.prefix}-u-${local.location_short}-idpay-sec-rg"
  # # uat_aks_name                 = "${local.prefix}-u-${local.location_short}-uat-aks"
  # # uat_azurecr_name             = "${local.prefix}u${local.location_short}corecommonacr"
  # uat_azdo_agent_pool = "${local.prefix}-uat-linux-app"

  # uat_apim_prefix_domain     = "https://api.uat.idpay.pagopa.it"
  # uat_storage_account_rg     = "${local.prefix}-u-${local.location_short}-${local.domain}-cdn-rg"
  # uat_storage_account_name   = replace("${local.prefix}-u-${local.domain}-sa", "-", "")
  # uat_cdn_profile            = "${local.prefix}-u-${local.domain}-cdn-profile"
  # uat_cdn_endpoint           = "${local.prefix}-u-${local.domain}-cdn-endpoint"
  # uat_checkout_prefix_domain = "https://uat.checkout.pagopa.it"
  # uat_checkout_platform_url  = "https://api.uat.platform.pagopa.it/checkout/ec/v1"
  # uat_payment_return_url     = "https://uat.idpay.pagopa.it/pagamenti"

  # # uat_srv_endpoint_aks_name                 = "${local.prefix}-${local.domain}-aks-uat"
  # # uat_srv_endpoint_azure_devops_docker_name = data.azuredevops_serviceendpoint_azurecr.uat_ita_workload_identity.service_endpoint_name
  # # uat_srv_endpoint_azure_devops_docker_id   = data.azuredevops_serviceendpoint_azurecr.uat_ita_workload_identity.id
  # # uat_srv_endpoint_aks_id                   = azuredevops_serviceendpoint_kubernetes.aks_uat.id
  # uat_srv_endpoint_azure_id   = data.azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn.id
  # uat_srv_endpoint_azure_name = data.azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn.service_endpoint_name
  # uat_srv_endpoint_tls_id     = module.uat_tls_cert_service_conn.service_endpoint_id

  # uat_identity_rg_name = "${local.prefix}-u-${local.location_short}-core-identity-rg"

  # # 🛑 PROD
  # prod_subscription_name        = "prod-${local.prefix}"
  # prod_domain_kv_name           = "${local.prefix}-p-${local.location_short}-${local.domain}-kv"
  # prod_domain_kv_resource_group = "${local.prefix}-p-${local.location_short}-idpay-sec-rg"
  # # prod_aks_name                 = "${local.prefix}-p-${local.location_short}-prod-aks"
  # # prod_azurecr_name             = "${local.prefix}p${local.location_short}corecommonacr"
  # prod_azdo_agent_pool = "${local.prefix}-prod-linux-app"

  # prod_apim_prefix_domain     = "https://api.idpay.pagopa.it"
  # prod_storage_account_rg     = "${local.prefix}-p-${local.location_short}-${local.domain}-cdn-rg"
  # prod_storage_account_name   = replace("${local.prefix}-p-${local.domain}-sa", "-", "")
  # prod_cdn_profile            = "${local.prefix}-p-${local.domain}-cdn-profile"
  # prod_cdn_endpoint           = "${local.prefix}-p-${local.domain}-cdn-endpoint"
  # prod_checkout_prefix_domain = "https://checkout.pagopa.it"
  # prod_checkout_platform_url  = "https://api.platform.pagopa.it/checkout/ec/v1"
  # prod_payment_return_url     = "https://idpay.pagopa.it/pagamenti"

  # # prod_srv_endpoint_aks_name                 = "${local.prefix}-${local.domain}-aks-prod"
  # # prod_srv_endpoint_azure_devops_docker_name = data.azuredevops_serviceendpoint_azurecr.prod_ita_workload_identity.service_endpoint_name
  # # prod_srv_endpoint_azure_devops_docker_id   = data.azuredevops_serviceendpoint_azurecr.prod_ita_workload_identity.id
  # # prod_srv_endpoint_aks_id                   = azuredevops_serviceendpoint_kubernetes.aks_prod.id
  # prod_srv_endpoint_azure_id   = data.azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn.id
  # prod_srv_endpoint_azure_name = data.azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn.service_endpoint_name
  # prod_srv_endpoint_tls_id     = module.prod_tls_cert_service_conn.service_endpoint_id

  # prod_identity_rg_name = "${local.prefix}-p-${local.location_short}-core-identity-rg"

  # prod_core_kv_name           = "${local.prefix}-p-${local.location_short}-core-kv"
  # prod_core_kv_resource_group = "${local.prefix}-p-${local.location_short}-core-sec-rg"
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
