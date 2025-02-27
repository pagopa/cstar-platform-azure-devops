variable "mcshared-cstar-uat-pagopa-it" {
  default = {
    pipeline = {
      enable_tls_cert = true
      path            = "TLS-Certificates\\UAT"
      dns_record_name = "api-mcshared"
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
  mcshared-cstar-uat-pagopa-it = {
    tenant_id                           = data.azurerm_client_config.current.tenant_id
    subscription_name                   = local.uat_subscription_name
    subscription_id                     = local.uat_subscription_id
    dns_zone_resource_group             = local.rg_uat_dns_zone_name
    credential_subcription              = local.uat_subscription_name
    credential_key_vault_name           = local.uat_domain_key_vault_name
    credential_key_vault_resource_group = local.uat_domain_key_vault_resource_group
    service_connection_ids_authorization = [
      module.uat_cstar_core_tls_cert_service_conn_federated.service_endpoint_id,
    ]
  }
  mcshared-cstar-uat-pagopa-it-variables = {
    KEY_VAULT_SERVICE_CONNECTION = module.uat_cstar_core_tls_cert_service_conn_federated.service_endpoint_name,
    KEY_VAULT_NAME               = local.uat_domain_key_vault_name
  }
  mcshared-cstar-uat-pagopa-it-variables_secret = {
  }
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "mcshared-cstar-uat-pagopa-it-cert_az" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"
  count  = var.mcshared-cstar-uat-pagopa-it.pipeline.enable_tls_cert == true ? 1 : 0

  # change me
  providers = {
    azurerm = azurerm.uat
  }

  location                             = local.location
  managed_identity_resource_group_name = local.uat_identity_rg_name

  project_id                   = data.azuredevops_project.project.id
  repository                   = local.tlscert_repository
  path                         = "${local.domain}\\${var.mcshared-cstar-uat-pagopa-it.pipeline.path}"
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  dns_record_name         = var.mcshared-cstar-uat-pagopa-it.pipeline.dns_record_name
  dns_zone_name           = var.mcshared-cstar-uat-pagopa-it.pipeline.dns_zone_name
  dns_zone_resource_group = local.mcshared-cstar-uat-pagopa-it.dns_zone_resource_group
  tenant_id               = local.mcshared-cstar-uat-pagopa-it.tenant_id
  subscription_name       = local.mcshared-cstar-uat-pagopa-it.subscription_name
  subscription_id         = local.mcshared-cstar-uat-pagopa-it.subscription_id

  credential_key_vault_name           = local.mcshared-cstar-uat-pagopa-it.credential_key_vault_name
  credential_key_vault_resource_group = local.mcshared-cstar-uat-pagopa-it.credential_key_vault_resource_group

  variables = merge(
    var.mcshared-cstar-uat-pagopa-it.pipeline.variables,
    local.mcshared-cstar-uat-pagopa-it-variables,
  )

  variables_secret = merge(
    var.mcshared-cstar-uat-pagopa-it.pipeline.variables_secret,
    local.mcshared-cstar-uat-pagopa-it-variables_secret,
  )

  service_connection_ids_authorization = local.mcshared-cstar-uat-pagopa-it.service_connection_ids_authorization

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
