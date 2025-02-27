variable "rtp-cstar-dev-pagopa-it" {
  default = {
    pipeline = {
      enable_tls_cert = true
      path            = "TLS-Certificates\\DEV"
      dns_record_name = "api-rtp"
      dns_zone_name   = "dev.cstar.pagopa.it"
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
  rtp-cstar-dev-pagopa-it = {
    tenant_id                           = data.azurerm_client_config.current.tenant_id
    subscription_name                   = local.dev_subscription_name
    subscription_id                     = local.dev_subscription_id
    dns_zone_resource_group             = local.rg_dev_dns_zone_name
    credential_subcription              = local.dev_subscription_name
    credential_key_vault_name           = local.dev_domain_key_vault_name
    credential_key_vault_resource_group = local.dev_domain_key_vault_resource_group
    service_connection_ids_authorization = [
      module.DEV-CSTAR-CORE-TLS-CERT-SERVICE-CONN-FEDERATED.service_endpoint_id,
    ]
  }
  rtp-cstar-dev-pagopa-it-variables = {
    KEY_VAULT_SERVICE_CONNECTION = module.DEV-CSTAR-CORE-TLS-CERT-SERVICE-CONN-FEDERATED.service_endpoint_name,
    KEY_VAULT_NAME               = local.dev_domain_key_vault_name
  }
  rtp-cstar-dev-pagopa-it-variables_secret = {
  }
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "rtp-cstar-dev-pagopa-it-cert_az" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"
  count  = var.rtp-cstar-dev-pagopa-it.pipeline.enable_tls_cert == true ? 1 : 0

  # change me
  providers = {
    azurerm = azurerm.dev
  }

  location                             = local.location
  managed_identity_resource_group_name = local.dev_identity_rg_name

  project_id                   = data.azuredevops_project.project.id
  repository                   = local.tlscert_repository
  path                         = "${local.domain}\\${var.rtp-cstar-dev-pagopa-it.pipeline.path}"
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  dns_record_name         = var.rtp-cstar-dev-pagopa-it.pipeline.dns_record_name
  dns_zone_name           = var.rtp-cstar-dev-pagopa-it.pipeline.dns_zone_name
  dns_zone_resource_group = local.rtp-cstar-dev-pagopa-it.dns_zone_resource_group
  tenant_id               = local.rtp-cstar-dev-pagopa-it.tenant_id
  subscription_name       = local.rtp-cstar-dev-pagopa-it.subscription_name
  subscription_id         = local.rtp-cstar-dev-pagopa-it.subscription_id

  credential_key_vault_name           = local.rtp-cstar-dev-pagopa-it.credential_key_vault_name
  credential_key_vault_resource_group = local.rtp-cstar-dev-pagopa-it.credential_key_vault_resource_group

  variables = merge(
    var.rtp-cstar-dev-pagopa-it.pipeline.variables,
    local.rtp-cstar-dev-pagopa-it-variables,
  )

  variables_secret = merge(
    var.rtp-cstar-dev-pagopa-it.pipeline.variables_secret,
    local.rtp-cstar-dev-pagopa-it-variables_secret,
  )

  service_connection_ids_authorization = local.rtp-cstar-dev-pagopa-it.service_connection_ids_authorization

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
}
