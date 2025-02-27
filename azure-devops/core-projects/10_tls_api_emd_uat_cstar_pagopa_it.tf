variable "api_emd_uat_cstar_pagopa_it" {
  default = {
    pipeline = {
      enable_tls_cert = true
      path            = "TLS-Certificates\\UAT"
      dns_record_name = "api-emd"
      dns_zone_name   = "uat.cstar.pagopa.it"
      # common variables to all pipelines
      variables = {}
      # common secret variables to all pipelines
      variables_secret = {}
    }
  }
}

locals {
  api_emd_uat_cstar_pagopa_it = {
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
  api_emd_uat_cstar_pagopa_it_variables = {
    KEY_VAULT_SERVICE_CONNECTION = module.uat_cstar_core_tls_cert_service_conn_federated.service_endpoint_name
  }
  api_emd_uat_cstar_pagopa_it_variables_secret = {
  }
}

#tfsec:ignore:general-secrets-no-plaintext-exposure
module "api_emd_uat_cstar_pagopa_it_cert_az" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"
  count  = var.api_emd_uat_cstar_pagopa_it.pipeline.enable_tls_cert == true ? 1 : 0

  # change me
  providers = {
    azurerm = azurerm.uat
  }

  location                             = local.location
  managed_identity_resource_group_name = local.uat_identity_rg_name

  project_id                   = local.devops_project_id
  repository                   = local.tlscert_repository
  path                         = var.api_emd_uat_cstar_pagopa_it.pipeline.path
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  dns_record_name         = var.api_emd_uat_cstar_pagopa_it.pipeline.dns_record_name
  dns_zone_name           = local.uat_dns_zone_name
  dns_zone_resource_group = local.api_emd_uat_cstar_pagopa_it.dns_zone_resource_group
  tenant_id               = local.api_emd_uat_cstar_pagopa_it.tenant_id
  subscription_name       = local.api_emd_uat_cstar_pagopa_it.subscription_name
  subscription_id         = local.api_emd_uat_cstar_pagopa_it.subscription_id

  credential_key_vault_name           = local.api_emd_uat_cstar_pagopa_it.credential_key_vault_name
  credential_key_vault_resource_group = local.api_emd_uat_cstar_pagopa_it.credential_key_vault_resource_group

  variables = merge(
    var.api_emd_uat_cstar_pagopa_it.pipeline.variables,
    local.api_emd_uat_cstar_pagopa_it_variables,
  )

  variables_secret = merge(
    var.api_emd_uat_cstar_pagopa_it.pipeline.variables_secret,
    local.api_emd_uat_cstar_pagopa_it_variables_secret,
  )

  service_connection_ids_authorization = local.api_emd_uat_cstar_pagopa_it.service_connection_ids_authorization

  schedules = {
    days_to_build              = ["Fri"]
    schedule_only_with_changes = false
    start_hours                = 3
    start_minutes              = 0
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = ["master"]
      exclude = []
    }
  }
}
