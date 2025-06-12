locals {

  certificates_itn_core = {
    ### ARGOCD TLS CERTIFICATES
    "argo-itn-internal-dev-cstar-pagopa-it" : {
      env              = "dev"
      dns_record_name  = "argocd.itn.internal"
      variables        = {}
      variables_secret = {}
    }
    "argo-itn-internal-uat-cstar-pagopa-it" : {
      env              = "uat"
      dns_record_name  = "argocd.itn.internal"
      variables        = {}
      variables_secret = {}
    }
    "argo-itn-internal-cstar-pagopa-it" : {
      env              = "prod"
      dns_record_name  = "argocd.itn.internal"
      variables        = {}
      variables_secret = {}
    }
    ### KeyCloak TLS CERTIFICATES
    "keycloak-itn-internal-dev-cstar-pagopa-it" : {
      env              = "dev"
      dns_record_name  = "keycloak.itn.internal"
      variables        = {}
      variables_secret = {}
    }
    "keycloak-itn-internal-uat-cstar-pagopa-it" : {
      env              = "uat"
      dns_record_name  = "keycloak.itn.internal"
      variables        = {}
      variables_secret = {}
    }
    "keycloak-itn-internal-cstar-pagopa-it" : {
      env              = "prod"
      dns_record_name  = "keycloak.itn.internal"
      variables        = {}
      variables_secret = {}
    }
  }

  # TLS CERTS
  certificate_itn_core_env_mappings = {
    dev = {
      dns_zone_name                       = "dev.cstar.pagopa.it"
      dns_zone_rg                         = local.rg_dev_dns_zone_name
      subscription_name                   = local.dev_subscription_name
      subscription_id                     = local.dev_subscription_id
      credential_key_vault_name           = local.dev_kv_core_name
      credential_key_vault_resource_group = local.dev_kv_core_resource_group
      service_endpoint                    = module.dev_tls_cert_service_connection.service_endpoint_id
      variables = {
        KEY_VAULT_SERVICE_CONNECTION = module.dev_tls_cert_service_connection.service_endpoint_name
      }
      variables_secret = {}
    }
    uat = {
      dns_zone_name                       = "uat.cstar.pagopa.it"
      dns_zone_rg                         = local.rg_uat_dns_zone_name
      subscription_name                   = local.uat_subscription_name
      subscription_id                     = local.uat_subscription_id
      credential_key_vault_name           = local.uat_kv_core_name
      credential_key_vault_resource_group = local.uat_kv_core_resource_group
      service_endpoint                    = module.uat_tls_cert_service_connection.service_endpoint_id
      variables = {
        KEY_VAULT_SERVICE_CONNECTION = module.uat_tls_cert_service_connection.service_endpoint_name
      }
      variables_secret = {}
    }
    prod = {
      dns_zone_name                       = "cstar.pagopa.it"
      dns_zone_rg                         = local.rg_prod_dns_zone_name
      subscription_name                   = local.prod_subscription_name
      subscription_id                     = local.prod_subscription_id
      credential_key_vault_name           = local.prod_kv_core_name
      credential_key_vault_resource_group = local.prod_kv_core_resource_group
      service_endpoint                    = module.prod_tls_cert_service_connection.service_endpoint_id
      variables = {
        KEY_VAULT_SERVICE_CONNECTION = module.prod_tls_cert_service_connection.service_endpoint_name
      }
      variables_secret = {}
    }
  }
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "itn_core_pipeline_dev" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = { for k, v in local.certificates_itn_core : k => v if v.env == "dev" }

  providers = {
    azurerm = azurerm.dev
  }

  location                             = local.location
  managed_identity_resource_group_name = local.dev_identity_core_itn_rg_name

  project_id                   = data.azuredevops_project.this.id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = data.azuredevops_serviceendpoint_github.azure_devops_github_rw.id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.certificate_itn_core_env_mappings[each.value.env].dns_zone_name
  dns_zone_resource_group = local.certificate_itn_core_env_mappings[each.value.env].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.certificate_itn_core_env_mappings[each.value.env].subscription_name
  subscription_id         = local.certificate_itn_core_env_mappings[each.value.env].subscription_id

  credential_key_vault_name           = local.certificate_itn_core_env_mappings[each.value.env].credential_key_vault_name
  credential_key_vault_resource_group = local.certificate_itn_core_env_mappings[each.value.env].credential_key_vault_resource_group

  variables = merge(
    local.certificate_itn_core_env_mappings[each.value.env].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.certificate_itn_core_env_mappings[each.value.env].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [local.certificate_itn_core_env_mappings[each.value.env].service_endpoint]

  schedules = {
    days_to_build              = ["Wed", "Fri"]
    schedule_only_with_changes = false
    start_hours                = 7
    start_minutes              = 0
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = ["refs/heads/master"]
      exclude = []
    }
  }

  depends_on = [
    module.dev_tls_cert_service_connection
  ]
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "itn_core_pipeline_uat" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = { for k, v in local.certificates_itn_core : k => v if v.env == "uat" }

  providers = {
    azurerm = azurerm.uat
  }

  location                             = local.location
  managed_identity_resource_group_name = local.uat_identity_core_itn_rg_name

  project_id                   = data.azuredevops_project.this.id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = data.azuredevops_serviceendpoint_github.azure_devops_github_rw.id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.certificate_itn_core_env_mappings[each.value.env].dns_zone_name
  dns_zone_resource_group = local.certificate_itn_core_env_mappings[each.value.env].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.certificate_itn_core_env_mappings[each.value.env].subscription_name
  subscription_id         = local.certificate_itn_core_env_mappings[each.value.env].subscription_id

  credential_key_vault_name           = local.certificate_itn_core_env_mappings[each.value.env].credential_key_vault_name
  credential_key_vault_resource_group = local.certificate_itn_core_env_mappings[each.value.env].credential_key_vault_resource_group

  variables = merge(
    local.certificate_itn_core_env_mappings[each.value.env].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.certificate_itn_core_env_mappings[each.value.env].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [local.certificate_itn_core_env_mappings[each.value.env].service_endpoint]

  schedules = {
    days_to_build              = ["Wed", "Fri"]
    schedule_only_with_changes = false
    start_hours                = 8
    start_minutes              = 0
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = ["refs/heads/master"]
      exclude = []
    }
  }

  depends_on = [
    module.uat_tls_cert_service_connection
  ]
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "itn_core_pipeline_prod" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = { for k, v in local.certificates_itn_core : k => v if v.env == "prod" }

  providers = {
    azurerm = azurerm.prod
  }

  location                             = local.location
  managed_identity_resource_group_name = local.prod_identity_core_itn_rg_name

  project_id                   = data.azuredevops_project.this.id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = data.azuredevops_serviceendpoint_github.azure_devops_github_rw.id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.certificate_itn_core_env_mappings[each.value.env].dns_zone_name
  dns_zone_resource_group = local.certificate_itn_core_env_mappings[each.value.env].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.certificate_itn_core_env_mappings[each.value.env].subscription_name
  subscription_id         = local.certificate_itn_core_env_mappings[each.value.env].subscription_id

  credential_key_vault_name           = local.certificate_itn_core_env_mappings[each.value.env].credential_key_vault_name
  credential_key_vault_resource_group = local.certificate_itn_core_env_mappings[each.value.env].credential_key_vault_resource_group

  variables = merge(
    local.certificate_itn_core_env_mappings[each.value.env].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.certificate_itn_core_env_mappings[each.value.env].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [local.certificate_itn_core_env_mappings[each.value.env].service_endpoint]

  schedules = {
    days_to_build              = ["Wed", "Fri"]
    schedule_only_with_changes = false
    start_hours                = 9
    start_minutes              = 0
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = ["refs/heads/master"]
      exclude = []
    }
  }

  depends_on = [
    module.prod_tls_cert_service_connection
  ]
}
