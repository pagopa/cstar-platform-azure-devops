# 🚨 WARNING: migrate to 10_tls_certs.tf
#
# This usage is deprecated, please use the 10_tls_certs.tf file, configuring the required certs in the local variable "certificates"
#
# It will create the cert pipeline in the TLS-Certificates/<env> folder.
# Remember to manually edit the scheduling from portal to avoid a scheduling bug on terraform provider.
# Destroy the old pipeline before creating the new one
variable "api-io-cstar-pagopa-it" {
  default = {
    pipeline = {
      enable_tls_cert = true
      path            = "TLS-Certificates\\PROD"
      dns_record_name = "api-io"
      dns_zone_name   = "cstar.pagopa.it"
      # common variables to all pipelines
      variables = {
        CERT_NAME_EXPIRE_SECONDS = "2592000" #30 days
      }
      # common secret variables to all pipelines
      variables_secret = {
      }
    }
  }
}

locals {
  api-io-cstar-pagopa-it = {
    tenant_id                           = data.azurerm_client_config.current.tenant_id
    subscription_name                   = local.prod_subscription_name
    subscription_id                     = local.prod_subscription_id
    dns_zone_resource_group             = local.rg_prod_dns_zone_name
    credential_subcription              = local.prod_subscription_name
    credential_key_vault_name           = local.prod_domain_key_vault_name
    credential_key_vault_resource_group = local.prod_domain_key_vault_resource_group
    service_connection_ids_authorization = [
      module.prod_cstar_core_tls_cert_service_conn_federated.service_endpoint_id,
    ]
  }
  api-io-cstar-pagopa-it-variables = {
    KEY_VAULT_SERVICE_CONNECTION = module.prod_cstar_core_tls_cert_service_conn_federated.service_endpoint_name,
    KEY_VAULT_NAME               = local.prod_domain_key_vault_name
  }
  api-io-cstar-pagopa-it-variables_secret = {
  }
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "api-io-cstar-pagopa-it-cert_az" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"
  count  = var.api-io-cstar-pagopa-it.pipeline.enable_tls_cert == true ? 1 : 0

  # change me
  providers = {
    azurerm = azurerm.prod
  }

  location                             = local.location
  managed_identity_resource_group_name = local.prod_identity_rg_name

  project_id                   = data.azuredevops_project.project.id
  repository                   = local.tlscert_repository
  path                         = "${local.domain}\\${var.api-io-cstar-pagopa-it.pipeline.path}"
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  dns_record_name         = var.api-io-cstar-pagopa-it.pipeline.dns_record_name
  dns_zone_name           = var.api-io-cstar-pagopa-it.pipeline.dns_zone_name
  dns_zone_resource_group = local.api-io-cstar-pagopa-it.dns_zone_resource_group
  tenant_id               = local.api-io-cstar-pagopa-it.tenant_id
  subscription_name       = local.api-io-cstar-pagopa-it.subscription_name
  subscription_id         = local.api-io-cstar-pagopa-it.subscription_id

  credential_key_vault_name           = local.api-io-cstar-pagopa-it.credential_key_vault_name
  credential_key_vault_resource_group = local.api-io-cstar-pagopa-it.credential_key_vault_resource_group

  variables = merge(
    var.api-io-cstar-pagopa-it.pipeline.variables,
    local.api-io-cstar-pagopa-it-variables,
  )

  variables_secret = merge(
    var.api-io-cstar-pagopa-it.pipeline.variables_secret,
    local.api-io-cstar-pagopa-it-variables_secret,
  )

  service_connection_ids_authorization = local.api-io-cstar-pagopa-it.service_connection_ids_authorization

  schedules = {
    days_to_build              = ["Fri"]
    schedule_only_with_changes = false
    start_hours                = 3
    start_minutes              = 0
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = ["refs/heads/master"]
      exclude = []
    }
  }

  depends_on = [
    module.letsencrypt_prod
  ]
}
