variable "api-cstar-uat-pagopa-it" {
  default = {
    repository = {
      organization   = "pagopa"
      name           = "le-azure-acme-tiny"
      branch_name    = "refs/heads/master"
      pipelines_path = "."
    }
    pipeline = {
      enable_tls_cert = true
      path            = "TLS-Certificates\\UAT"
      dns_record_name = "api"
      dns_zone_name   = "uat.cstar.pagopa.it"
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
  api-cstar-uat-pagopa-it = {
    tenant_id                           = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
    subscription_name                   = local.uat_subscription_name
    subscription_id                     = module.secret_azdo.values["PAGOPAIT-UAT-CSTAR-SUBSCRIPTION-ID"].value
    dns_zone_resource_group             = local.rg_uat_dns_zone_name
    credential_subcription              = local.uat_subscription_name
    credential_key_vault_name           = local.uat_domain_key_vault_name
    credential_key_vault_resource_group = local.uat_domain_key_vault_resource_group
    service_connection_ids_authorization = [
      module.DEV-CSTAR-CORE-TLS-CERT-SERVICE-CONN.service_endpoint_id,
    ]
  }
  api-cstar-uat-pagopa-it-variables = {
    KEY_VAULT_SERVICE_CONNECTION = module.DEV-CSTAR-CORE-TLS-CERT-SERVICE-CONN.service_endpoint_name,
    KEY_VAULT_NAME               = local.uat_domain_key_vault_name
  }
  api-cstar-uat-pagopa-it-variables_secret = {
  }
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "api-cstar-uat-pagopa-it-cert_az" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_tls_cert?ref=v2.6.5"
  count  = var.api-cstar-uat-pagopa-it.pipeline.enable_tls_cert == true ? 1 : 0

  # change me
  providers = {
    azurerm = azurerm.uat
  }

  project_id = data.azuredevops_project.project.id
  repository = var.api-cstar-uat-pagopa-it.repository
  name       = "${var.api-cstar-uat-pagopa-it.pipeline.dns_record_name}.${var.api-cstar-uat-pagopa-it.pipeline.dns_zone_name}"
  #tfsec:ignore:general-secrets-no-plaintext-exposure
  #tfsec:ignore:GEN003
  renew_token                  = local.tlscert_renew_token
  path                         = "${local.domain}\\${var.api-cstar-uat-pagopa-it.pipeline.path}"
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  dns_record_name         = var.api-cstar-uat-pagopa-it.pipeline.dns_record_name
  dns_zone_name           = var.api-cstar-uat-pagopa-it.pipeline.dns_zone_name
  dns_zone_resource_group = local.api-cstar-uat-pagopa-it.dns_zone_resource_group
  tenant_id               = local.api-cstar-uat-pagopa-it.tenant_id
  subscription_name       = local.api-cstar-uat-pagopa-it.subscription_name
  subscription_id         = local.api-cstar-uat-pagopa-it.subscription_id

  credential_subcription              = local.api-cstar-uat-pagopa-it.credential_subcription
  credential_key_vault_name           = local.api-cstar-uat-pagopa-it.credential_key_vault_name
  credential_key_vault_resource_group = local.api-cstar-uat-pagopa-it.credential_key_vault_resource_group

  variables = merge(
    var.api-cstar-uat-pagopa-it.pipeline.variables,
    local.api-cstar-uat-pagopa-it-variables,
  )

  variables_secret = merge(
    var.api-cstar-uat-pagopa-it.pipeline.variables_secret,
    local.api-cstar-uat-pagopa-it-variables_secret,
  )

  service_connection_ids_authorization = local.api-cstar-uat-pagopa-it.service_connection_ids_authorization

  schedules = {
    days_to_build              = ["Thu"]
    schedule_only_with_changes = false
    start_hours                = 3
    start_minutes              = 0
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = [var.api-cstar-uat-pagopa-it.repository.branch_name]
      exclude = []
    }
  }

  depends_on = [
    module.letsencrypt_uat
  ]
}
