
locals {
  project_prefix_short = "cstar"
  domain               = "core"

  location              = "westeurope"
  dev_identity_rg_name  = "cstar-d-identity-rg"
  uat_identity_rg_name  = "cstar-u-identity-rg"
  prod_identity_rg_name = "cstar-p-identity-rg"

  # Subscription
  dev_subscription_name  = "dev-cstar"
  dev_subscription_id    = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
  uat_subscription_name  = "uat-cstar"
  uat_subscription_id    = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
  prod_subscription_name = "prod-cstar"
  prod_subscription_id   = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id


  # ⚙️ DevOps
  devops_project_id = data.azuredevops_project.project.project_id

  # 🔐 KV Legacy WEU
  dev_key_vault_resource_group  = "${local.project_prefix_short}-d-sec-rg"
  uat_key_vault_resource_group  = "${local.project_prefix_short}-u-sec-rg"
  prod_key_vault_resource_group = "${local.project_prefix_short}-p-sec-rg"

  dev_key_vault_name  = "${local.project_prefix_short}-d-kv"
  uat_key_vault_name  = "${local.project_prefix_short}-u-kv"
  prod_key_vault_name = "${local.project_prefix_short}-p-kv"

  prod_key_vault_azdo_name = "${local.project_prefix_short}-p-azdo-weu-kv"

  # DNS Zone
  rg_dev_dns_zone_name  = "cstar-d-vnet-rg"
  rg_uat_dns_zone_name  = "cstar-u-vnet-rg"
  rg_prod_dns_zone_name = "cstar-p-vnet-rg"

  dev_dns_zone_name  = "dev.cstar.pagopa.it"
  uat_dns_zone_name  = "uat.cstar.pagopa.it"
  prod_dns_zone_name = "cstar.pagopa.it"

  #
  # APP insights
  #
  appinsights_renew_token = "v1"

  dev_appinsights_name           = "${local.project_prefix_short}-d-appinsights"
  dev_appinsights_resource_group = "${local.project_prefix_short}-d-monitor-rg"

  uat_appinsights_name           = "${local.project_prefix_short}-u-appinsights"
  uat_appinsights_resource_group = "${local.project_prefix_short}-u-monitor-rg"

  prod_appinsights_name           = "${local.project_prefix_short}-p-appinsights"
  prod_appinsights_resource_group = "${local.project_prefix_short}-p-monitor-rg"

  # LOCAL TLS CERT
  tlscert_repository = {
    organization   = "pagopa"
    name           = "le-azure-acme-tiny"
    branch_name    = "refs/heads/master"
    pipelines_path = "."
  }

  cert_diff_env_variables_dev = {
    RECEIVER_EMAIL = module.dev_secrets.values["tls-cert-diff-receiver-emails"].value
    SENDER_EMAIL   = module.dev_secrets.values["tls-cert-diff-sender-email"].value
    APP_PASS       = module.dev_secrets.values["tls-cert-diff-sender-email-app-pass"].value
  }

  cert_diff_env_variables_uat = {
    RECEIVER_EMAIL = module.uat_secrets.values["tls-cert-diff-receiver-emails"].value
    SENDER_EMAIL   = module.uat_secrets.values["tls-cert-diff-sender-email"].value
    APP_PASS       = module.uat_secrets.values["tls-cert-diff-sender-email-app-pass"].value
  }

  cert_diff_env_variables_prod = {
    RECEIVER_EMAIL = module.prod_secrets.values["tls-cert-diff-receiver-emails"].value
    SENDER_EMAIL   = module.prod_secrets.values["tls-cert-diff-sender-email"].value
    APP_PASS       = module.prod_secrets.values["tls-cert-diff-sender-email-app-pass"].value
  }

  dev_cert_diff_variables = {
    enabled           = true
    alert_enabled     = true
    cert_diff_version = "0.2.5"
    app_insights_name = local.dev_app_insight_monitoring_name
    app_insights_rg   = local.dev_app_insight_monitoring_rg
    actions_group = [
      data.azurerm_monitor_action_group.certificate_pipeline_status_dev.id
    ]
  }

  uat_cert_diff_variables = {
    enabled           = true
    alert_enabled     = true
    cert_diff_version = "0.2.5"
    app_insights_name = local.uat_app_insight_monitoring_name
    app_insights_rg   = local.uat_app_insight_monitoring_rg
    actions_group = [
      data.azurerm_monitor_action_group.certificate_pipeline_status_uat.id
    ]
  }

  prod_cert_diff_variables = {
    enabled           = false
    alert_enabled     = false
    cert_diff_version = "0.2.5"
    app_insights_name = local.prod_app_insight_monitoring_name
    app_insights_rg   = local.prod_app_insight_monitoring_rg
    actions_group = [
      data.azurerm_monitor_action_group.certificate_pipeline_status_prod.id
    ]
  }

  # APPINSIGHTS
  dev_app_insight_monitoring_name    = "${local.project_prefix_short}-d-itn-platform-synthetic-appinsights"
  dev_app_insight_monitoring_rg      = "${local.project_prefix_short}-d-itn-platform-synthetic-rg"
  dev_cert_diff_pipeline_status_name = "${local.project_prefix_short}d-cert-pipeline-status"
  dev_monitor_rg                     = "${local.project_prefix_short}-d-monitor-rg"

  uat_app_insight_monitoring_name    = "${local.project_prefix_short}-u-itn-platform-synthetic-appinsights"
  uat_app_insight_monitoring_rg      = "${local.project_prefix_short}-u-itn-platform-synthetic-rg"
  uat_cert_diff_pipeline_status_name = "${local.project_prefix_short}u-cert-pipeline-status"
  uat_monitor_rg                     = "${local.project_prefix_short}-u-monitor-rg"

  prod_app_insight_monitoring_name    = "${local.project_prefix_short}-p-itn-platform-synthetic-appinsights"
  prod_app_insight_monitoring_rg      = "${local.project_prefix_short}-p-itn-platform-synthetic-rg"
  prod_cert_diff_pipeline_status_name = "${local.project_prefix_short}p-cert-pipeline-status"
  prod_monitor_rg                     = "${local.project_prefix_short}-p-monitor-rg"
}
