variable "api-io-cstar-dev-pagopa-it" {
  default = {
    repository = {
      organization   = "pagopa"
      name           = "le-azure-acme-tiny"
      branch_name    = "refs/heads/master"
      pipelines_path = "."
    }
    pipeline = {
      enable_tls_cert = true
      path            = "TLS-Certificates\\DEV"
      dns_record_name = "api-io"
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
  api-io-cstar-dev-pagopa-it = {
    tenant_id                           = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
    subscription_name                   = local.dev_subscription_name
    subscription_id                     = module.secret_azdo.values["PAGOPAIT-DEV-CSTAR-SUBSCRIPTION-ID"].value
    dns_zone_resource_group             = local.rg_dev_dns_zone_name
    credential_subcription              = local.dev_subscription_name
    credential_key_vault_name           = local.dev_domain_key_vault_name
    credential_key_vault_resource_group = local.dev_domain_key_vault_resource_group
    service_connection_ids_authorization = [
      module.DEV-CSTAR-CORE-TLS-CERT-SERVICE-CONN.service_endpoint_id,
    ]
  }
  api-io-cstar-dev-pagopa-it-variables = {
    KEY_VAULT_SERVICE_CONNECTION = module.DEV-CSTAR-CORE-TLS-CERT-SERVICE-CONN.service_endpoint_name,
    KEY_VAULT_NAME               = local.dev_domain_key_vault_name
  }
  api-io-cstar-dev-pagopa-it-variables_secret = {
  }
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "api-io-cstar-dev-pagopa-it-cert_az" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_tls_cert?ref=v2.6.5"
  count  = var.api-io-cstar-dev-pagopa-it.pipeline.enable_tls_cert == true ? 1 : 0

  # change me
  providers = {
    azurerm = azurerm.dev
  }

  project_id = data.azuredevops_project.project.id
  repository = var.api-io-cstar-dev-pagopa-it.repository
  name       = "${var.api-io-cstar-dev-pagopa-it.pipeline.dns_record_name}.${var.api-io-cstar-dev-pagopa-it.pipeline.dns_zone_name}"
  #tfsec:ignore:general-secrets-no-plaintext-exposure
  #tfsec:ignore:GEN003
  renew_token                  = local.tlscert_renew_token
  path                         = "${local.domain}\\${var.api-io-cstar-dev-pagopa-it.pipeline.path}"
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  dns_record_name         = var.api-io-cstar-dev-pagopa-it.pipeline.dns_record_name
  dns_zone_name           = var.api-io-cstar-dev-pagopa-it.pipeline.dns_zone_name
  dns_zone_resource_group = local.api-io-cstar-dev-pagopa-it.dns_zone_resource_group
  tenant_id               = local.api-io-cstar-dev-pagopa-it.tenant_id
  subscription_name       = local.api-io-cstar-dev-pagopa-it.subscription_name
  subscription_id         = local.api-io-cstar-dev-pagopa-it.subscription_id

  credential_subcription              = local.api-io-cstar-dev-pagopa-it.credential_subcription
  credential_key_vault_name           = local.api-io-cstar-dev-pagopa-it.credential_key_vault_name
  credential_key_vault_resource_group = local.api-io-cstar-dev-pagopa-it.credential_key_vault_resource_group

  variables = merge(
    var.api-io-cstar-dev-pagopa-it.pipeline.variables,
    local.api-io-cstar-dev-pagopa-it-variables,
  )

  variables_secret = merge(
    var.api-io-cstar-dev-pagopa-it.pipeline.variables_secret,
    local.api-io-cstar-dev-pagopa-it-variables_secret,
  )

  service_connection_ids_authorization = local.api-io-cstar-dev-pagopa-it.service_connection_ids_authorization

  schedules = {
    days_to_build              = ["Thu"]
    schedule_only_with_changes = false
    start_hours                = 3
    start_minutes              = 0
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = [var.api-io-cstar-dev-pagopa-it.repository.branch_name]
      exclude = []
    }
  }

  depends_on = [
    module.letsencrypt_dev
  ]
}