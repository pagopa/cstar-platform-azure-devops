variable "tlscert-rtp-internal-cstar-pagopa-it" {
  default = {
    repository = {
      organization   = "pagopa"
      name           = "le-azure-acme-tiny"
      branch_name    = "refs/heads/master"
      pipelines_path = "."
    }
    pipeline = {
      enable_tls_cert = true
      path            = "TLS-Certificates\\PROD"
      dns_record_name = "rtp.weu.internal"
      dns_zone_name   = "cstar.pagopa.it"
      # common variables to all pipelines
      variables = {
      }
      # common secret variables to all pipelines
      variables_secret = {
      }
    }
  }
}

locals {
  tlscert-rtp-internal-cstar-pagopa-it = {
    tenant_id                           = data.azurerm_client_config.current.tenant_id
    subscription_name                   = local.prod_cstar_subscription_name
    subscription_id                     = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id
    dns_zone_resource_group             = local.rg_prod_dns_zone_name
    credential_subcription              = local.prod_cstar_subscription_name
    credential_key_vault_name           = local.prod_domain_key_vault_name
    credential_key_vault_resource_group = local.prod_domain_key_vault_resource_group
    service_connection_ids_authorization = [
      module.PROD-CSTAR-RTP-TLS-CERT-SERVICE-CONN-FEDERATED.service_endpoint_id,
    ]
  }
  tlscert-rtp-internal-cstar-pagopa-it-variables = {
    KEY_VAULT_SERVICE_CONNECTION = module.PROD-CSTAR-RTP-TLS-CERT-SERVICE-CONN-FEDERATED.service_endpoint_name,
    KEY_VAULT_NAME               = local.prod_domain_key_vault_name
  }
  tlscert-rtp-internal-cstar-pagopa-it-variables_secret = {
  }
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "tlscert-rtp-internal-cstar-pagopa-it-cert_az" {
  source = "./.terraform/modules/__azdo__/azuredevops_build_definition_tls_cert_federated"

  count  = var.tlscert-rtp-internal-cstar-pagopa-it.pipeline.enable_tls_cert == true ? 1 : 0

  # change me
  providers = {
    azurerm = azurerm.prod
  }

  location                             = local.location
  managed_identity_resource_group_name = local.prod_identity_rg_name

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.tlscert-rtp-internal-cstar-pagopa-it.repository
  path                         = var.tlscert-rtp-internal-cstar-pagopa-it.pipeline.path
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_ro_id

  dns_record_name         = var.tlscert-rtp-internal-cstar-pagopa-it.pipeline.dns_record_name
  dns_zone_name           = var.tlscert-rtp-internal-cstar-pagopa-it.pipeline.dns_zone_name
  dns_zone_resource_group = local.tlscert-rtp-internal-cstar-pagopa-it.dns_zone_resource_group
  tenant_id               = local.tlscert-rtp-internal-cstar-pagopa-it.tenant_id
  subscription_name       = local.tlscert-rtp-internal-cstar-pagopa-it.subscription_name
  subscription_id         = local.tlscert-rtp-internal-cstar-pagopa-it.subscription_id

  credential_key_vault_name           = local.tlscert-rtp-internal-cstar-pagopa-it.credential_key_vault_name
  credential_key_vault_resource_group = local.tlscert-rtp-internal-cstar-pagopa-it.credential_key_vault_resource_group

  variables = merge(
    var.tlscert-rtp-internal-cstar-pagopa-it.pipeline.variables,
    local.tlscert-rtp-internal-cstar-pagopa-it-variables,
  )

  variables_secret = merge(
    var.tlscert-rtp-internal-cstar-pagopa-it.pipeline.variables_secret,
    local.tlscert-rtp-internal-cstar-pagopa-it-variables_secret,
  )

  service_connection_ids_authorization = local.tlscert-rtp-internal-cstar-pagopa-it.service_connection_ids_authorization

  schedules = {
    days_to_build              = ["Wed","Fri"]
    schedule_only_with_changes = false
    start_hours                = 13
    start_minutes              = 0
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = [var.tlscert-rtp-internal-cstar-pagopa-it.repository.branch_name]
      exclude = []
    }
  }

  depends_on = [
    module.letsencrypt_prod
  ]
}
