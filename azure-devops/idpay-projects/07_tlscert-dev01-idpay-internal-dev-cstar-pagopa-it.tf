variable "tlscert-dev01-idpay-internal-dev-cstar-pagopa-it" {
  default = {
    repository = {
      organization   = "pagopa"
      name           = "le-azure-acme-tiny"
      branch_name    = "master"
      pipelines_path = "."
    }
    pipeline = {
      enable_tls_cert         = true
      path                    = "TLS-Certificates\\DEV"
      dns_record_name         = "dev01.idpay"
      dns_zone_name           = "internal.dev.cstar.pagopa.it"
      dns_zone_resource_group = "cstar-d-idpay-sec-rg"
      # common variables to all pipelines
      variables = {
        CERT_NAME_EXPIRE_SECONDS = "2592000" #30 days
        KEY_VAULT_NAME           = "cstar-d-idpay-kv"
      }
      # common secret variables to all pipelines
      variables_secret = {
      }
    }
  }
}

locals {
  tlscert-dev01-idpay-internal-dev-cstar-pagopa-it = {
    tenant_id         = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
    subscription_name = "DEV-cstar"
    subscription_id   = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value
  }
  tlscert-dev01-idpay-internal-dev-cstar-pagopa-it-variables = {
    KEY_VAULT_CERT_NAME          = "${replace(var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.pipeline.dns_record_name, ".", "-")}-${replace(var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.pipeline.dns_zone_name, ".", "-")}"
    KEY_VAULT_SERVICE_CONNECTION = module.DEV-CSTAR-IDPAY-TLS-CERT-SERVICE-CONN.service_endpoint_name
  }
  tlscert-dev01-idpay-internal-dev-cstar-pagopa-it-variables_secret = {
  }
}

module "tlscert-dev01-idpay-internal-dev-cstar-pagopa-it-cert_az" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_tls_cert?ref=v2.0.4"
  count  = var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.pipeline.enable_tls_cert == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.repository
  name                         = "${var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.pipeline.dns_record_name}.${var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.pipeline.dns_zone_name}"
  path                         = var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.pipeline.path
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_ro_id
  #tfsec:ignore:GEN003
  renew_token = local.tlscert_renew_token

  dns_record_name         = var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.pipeline.dns_record_name
  dns_zone_name           = var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.pipeline.dns_zone_name
  dns_zone_resource_group = var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.pipeline.dns_zone_resource_group
  tenant_id               = local.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.tenant_id
  subscription_name       = local.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.subscription_name
  subscription_id         = local.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.subscription_id


  credential_subcription              = local.dev_cstar_subscription_name
  credential_key_vault_name           = local.dev_idpay_key_vault_name
  credential_key_vault_resource_group = local.dev_idpay_key_vault_resource_group

  variables = merge(
    var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.pipeline.variables,
    local.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it-variables,
  )

  variables_secret = merge(
    var.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it.pipeline.variables_secret,
    local.tlscert-dev01-idpay-internal-dev-cstar-pagopa-it-variables_secret,
  )

  service_connection_ids_authorization = [
    module.DEV-CSTAR-IDPAY-TLS-CERT-SERVICE-CONN.service_endpoint_id,
  ]

  schedules = {
    days_to_build              = ["Mon"]
    schedule_only_with_changes = false
    start_hours                = 7
    start_minutes              = 0
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = ["master"]
      exclude = []
    }
  }
}
