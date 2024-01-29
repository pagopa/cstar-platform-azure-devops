variable "portal-cstar-dev-pagopa-it" {
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
      dns_record_name = "portal"
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
  portal-cstar-dev-pagopa-it = {
    tenant_id                           = data.azurerm_client_config.current.tenant_id
    subscription_name                   = local.dev_subscription_name
    subscription_id                     = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
    dns_zone_resource_group             = local.rg_dev_dns_zone_name
    credential_subcription              = local.dev_subscription_name
    credential_key_vault_name           = local.dev_domain_key_vault_name
    credential_key_vault_resource_group = local.dev_domain_key_vault_resource_group
    service_connection_ids_authorization = [
      module.DEV-CSTAR-CORE-TLS-CERT-SERVICE-CONN-FEDERATED.service_endpoint_id,
    ]
  }
  portal-cstar-dev-pagopa-it-variables = {
    KEY_VAULT_SERVICE_CONNECTION = module.DEV-CSTAR-CORE-TLS-CERT-SERVICE-CONN-FEDERATED.service_endpoint_name,
    KEY_VAULT_NAME               = local.dev_domain_key_vault_name
  }
  portal-cstar-dev-pagopa-it-variables_secret = {
  }
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "portal-cstar-dev-pagopa-it-cert_az" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_tls_cert_federated?ref=v5.2.0"
  count  = var.portal-cstar-dev-pagopa-it.pipeline.enable_tls_cert == true ? 1 : 0

  # change me
  providers = {
    azurerm = azurerm.dev
  }

  location            = local.location
  managed_identity_resource_group_name = local.dev_identity_rg_name

  project_id = data.azuredevops_project.project.id
  repository = var.portal-cstar-dev-pagopa-it.repository
  path                         = "${local.domain}\\${var.portal-cstar-dev-pagopa-it.pipeline.path}"
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  dns_record_name         = var.portal-cstar-dev-pagopa-it.pipeline.dns_record_name
  dns_zone_name           = var.portal-cstar-dev-pagopa-it.pipeline.dns_zone_name
  dns_zone_resource_group = local.portal-cstar-dev-pagopa-it.dns_zone_resource_group
  tenant_id               = local.portal-cstar-dev-pagopa-it.tenant_id
  subscription_name       = local.portal-cstar-dev-pagopa-it.subscription_name
  subscription_id         = local.portal-cstar-dev-pagopa-it.subscription_id

  credential_key_vault_name           = local.portal-cstar-dev-pagopa-it.credential_key_vault_name
  credential_key_vault_resource_group = local.portal-cstar-dev-pagopa-it.credential_key_vault_resource_group

  variables = merge(
    var.portal-cstar-dev-pagopa-it.pipeline.variables,
    local.portal-cstar-dev-pagopa-it-variables,
  )

  variables_secret = merge(
    var.portal-cstar-dev-pagopa-it.pipeline.variables_secret,
    local.portal-cstar-dev-pagopa-it-variables_secret,
  )

  service_connection_ids_authorization = local.portal-cstar-dev-pagopa-it.service_connection_ids_authorization

  schedules = {
    days_to_build              = ["Fri"]
    schedule_only_with_changes = false
    start_hours                = 3
    start_minutes              = 0
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = [var.portal-cstar-dev-pagopa-it.repository.branch_name]
      exclude = []
    }
  }

  depends_on = [
    module.letsencrypt_dev
  ]
}
