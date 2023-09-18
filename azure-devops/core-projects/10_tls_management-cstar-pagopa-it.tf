variable "management-cstar-pagopa-it" {
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
      dns_record_name = "management"
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
  management-cstar-pagopa-it = {
    tenant_id                           = module.secret_azdo.values["PAGOPAIT-TENANTID"].value
    subscription_name                   = local.prod_subscription_name
    subscription_id                     = module.secret_azdo.values["PAGOPAIT-PROD-CSTAR-SUBSCRIPTION-ID"].value
    dns_zone_resource_group             = local.rg_prod_dns_zone_name
    credential_subcription              = local.prod_subscription_name
    credential_key_vault_name           = local.prod_domain_key_vault_name
    credential_key_vault_resource_group = local.prod_domain_key_vault_resource_group
    service_connection_ids_authorization = [
      module.PROD-CSTAR-CORE-TLS-CERT-SERVICE-CONN.service_endpoint_id,
    ]
  }
  management-cstar-pagopa-it-variables = {
    KEY_VAULT_SERVICE_CONNECTION = module.PROD-CSTAR-CORE-TLS-CERT-SERVICE-CONN.service_endpoint_name,
    KEY_VAULT_NAME               = local.prod_domain_key_vault_name
  }
  management-cstar-pagopa-it-variables_secret = {
  }
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "management-cstar-pagopa-it-cert_az" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_tls_cert?ref=v2.6.5"
  count  = var.management-cstar-pagopa-it.pipeline.enable_tls_cert == true ? 1 : 0

  # change me
  providers = {
    azurerm = azurerm.prod
  }

  project_id = data.azuredevops_project.project.id
  repository = var.management-cstar-pagopa-it.repository
  name       = "${var.management-cstar-pagopa-it.pipeline.dns_record_name}.${var.management-cstar-pagopa-it.pipeline.dns_zone_name}"
  #tfsec:ignore:general-secrets-no-plaintext-exposure
  #tfsec:ignore:GEN003
  renew_token                  = local.tlscert_renew_token
  path                         = "${local.domain}\\${var.management-cstar-pagopa-it.pipeline.path}"
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id

  dns_record_name         = var.management-cstar-pagopa-it.pipeline.dns_record_name
  dns_zone_name           = var.management-cstar-pagopa-it.pipeline.dns_zone_name
  dns_zone_resource_group = local.management-cstar-pagopa-it.dns_zone_resource_group
  tenant_id               = local.management-cstar-pagopa-it.tenant_id
  subscription_name       = local.management-cstar-pagopa-it.subscription_name
  subscription_id         = local.management-cstar-pagopa-it.subscription_id

  credential_subcription              = local.management-cstar-pagopa-it.credential_subcription
  credential_key_vault_name           = local.management-cstar-pagopa-it.credential_key_vault_name
  credential_key_vault_resource_group = local.management-cstar-pagopa-it.credential_key_vault_resource_group

  variables = merge(
    var.management-cstar-pagopa-it.pipeline.variables,
    local.management-cstar-pagopa-it-variables,
  )

  variables_secret = merge(
    var.management-cstar-pagopa-it.pipeline.variables_secret,
    local.management-cstar-pagopa-it-variables_secret,
  )

  service_connection_ids_authorization = local.management-cstar-pagopa-it.service_connection_ids_authorization

  schedules = {
    days_to_build              = ["Thu"]
    schedule_only_with_changes = false
    start_hours                = 3
    start_minutes              = 0
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = [var.management-cstar-pagopa-it.repository.branch_name]
      exclude = []
    }
  }

  depends_on = [
    module.letsencrypt_prod
  ]
}
