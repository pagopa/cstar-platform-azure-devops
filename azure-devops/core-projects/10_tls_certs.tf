locals {

  env_mappings = {
    dev = {
      dns_zone_name = "dev.cstar.pagopa.it"
      dns_zone_rg = local.rg_dev_dns_zone_name
      subscription_name = local.dev_subscription_name
      subscription_id = local.dev_subscription_id
      credential_key_vault_name           = local.dev_domain_key_vault_name
      credential_key_vault_resource_group = local.dev_domain_key_vault_resource_group
      service_endpoint = module.dev_cstar_core_tls_cert_service_conn_federated.service_endpoint_id
      variables = {
        KEY_VAULT_SERVICE_CONNECTION = module.dev_cstar_core_tls_cert_service_conn_federated.service_endpoint_name
        KEY_VAULT_NAME               = local.dev_domain_key_vault_name
        CERT_NAME_EXPIRE_SECONDS = "2592000"
      }
      variables_secret = {}
    }
    uat = {
      dns_zone_name = "uat.cstar.pagopa.it"
      dns_zone_rg = local.rg_uat_dns_zone_name
      subscription_name = local.uat_subscription_name
      subscription_id = local.uat_subscription_id
      credential_key_vault_name           = local.uat_domain_key_vault_name
      credential_key_vault_resource_group = local.uat_domain_key_vault_resource_group
      service_endpoint = module.uat_cstar_core_tls_cert_service_conn_federated.service_endpoint_id
      variables = {
        KEY_VAULT_SERVICE_CONNECTION = module.uat_cstar_core_tls_cert_service_conn_federated.service_endpoint_name
        KEY_VAULT_NAME               = local.uat_domain_key_vault_name
        CERT_NAME_EXPIRE_SECONDS = "2592000"
      }
      variables_secret = {}
    }
    prod = {
      dns_zone_name = "cstar.pagopa.it"
      dns_zone_rg = local.rg_prod_dns_zone_name
      subscription_name = local.prod_subscription_name
      subscription_id = local.prod_subscription_id
      credential_key_vault_name           = local.prod_domain_key_vault_name
      credential_key_vault_resource_group = local.prod_domain_key_vault_resource_group
      service_endpoint = module.prod_cstar_core_tls_cert_service_conn_federated.service_endpoint_id
      variables = {
        KEY_VAULT_SERVICE_CONNECTION = module.prod_cstar_core_tls_cert_service_conn_federated.service_endpoint_name
        KEY_VAULT_NAME               = local.prod_domain_key_vault_name
        CERT_NAME_EXPIRE_SECONDS = "2592000"
      }
      variables_secret = {}
    }
  }


certificates = {
  "rtp-cb-cstar-dev-pagopa-it": {
    env = "dev"
    dns_record_name = "api-rtp-cb"
    variables = {}
    variables_secret = {}
  }
  "rtp-cb-cstar-pagopa-it": {
    env = "prod"
    dns_record_name = "api-rtp-cb"
    variables = {}
    variables_secret = {}
  }
  "rtp-cb-cstar-uat-pagopa-it": {
    env = "uat"
    dns_record_name = "api-rtp-cb"
    variables = {}
    variables_secret = {}
  }
}



}



# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "federated_cert_pipeline_dev" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = {for k,v in local.certificates: k => v if v.env == "dev"}

  providers = {
    azurerm = azurerm.dev
  }

  location                             = local.location
  managed_identity_resource_group_name = local.dev_identity_rg_name

  project_id                   = data.azuredevops_project.project.id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.env_mappings[each.value.env].dns_zone_name
  dns_zone_resource_group = local.env_mappings[each.value.env].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.env_mappings[each.value.env].subscription_name
  subscription_id         = local.env_mappings[each.value.env].subscription_id

  credential_key_vault_name           = local.env_mappings[each.value.env].credential_key_vault_name
  credential_key_vault_resource_group = local.env_mappings[each.value.env].credential_key_vault_resource_group

  variables = merge(
    local.env_mappings[each.value.env].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.env_mappings[each.value.env].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [ local.env_mappings[each.value.env].service_endpoint ]

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

  depends_on = [
    module.letsencrypt_dev
  ]
}



# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "federated_cert_pipeline_uat" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = {for k,v in local.certificates: k => v if v.env == "uat"}

  providers = {
    azurerm = azurerm.uat
  }

  location                             = local.location
  managed_identity_resource_group_name = local.dev_identity_rg_name

  project_id                   = data.azuredevops_project.project.id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.env_mappings[each.value.env].dns_zone_name
  dns_zone_resource_group = local.env_mappings[each.value.env].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.env_mappings[each.value.env].subscription_name
  subscription_id         = local.env_mappings[each.value.env].subscription_id

  credential_key_vault_name           = local.env_mappings[each.value.env].credential_key_vault_name
  credential_key_vault_resource_group = local.env_mappings[each.value.env].credential_key_vault_resource_group

  variables = merge(
    local.env_mappings[each.value.env].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.env_mappings[each.value.env].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [ local.env_mappings[each.value.env].service_endpoint ]

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

  depends_on = [
    module.letsencrypt_uat
  ]
}



# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "federated_cert_pipeline_prod" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = {for k,v in local.certificates: k => v if v.env == "prod"}

  providers = {
    azurerm = azurerm.prod
  }

  location                             = local.location
  managed_identity_resource_group_name = local.dev_identity_rg_name

  project_id                   = data.azuredevops_project.project.id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.env_mappings[each.value.env].dns_zone_name
  dns_zone_resource_group = local.env_mappings[each.value.env].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.env_mappings[each.value.env].subscription_name
  subscription_id         = local.env_mappings[each.value.env].subscription_id

  credential_key_vault_name           = local.env_mappings[each.value.env].credential_key_vault_name
  credential_key_vault_resource_group = local.env_mappings[each.value.env].credential_key_vault_resource_group

  variables = merge(
    local.env_mappings[each.value.env].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.env_mappings[each.value.env].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [ local.env_mappings[each.value.env].service_endpoint ]

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

  depends_on = [
    module.letsencrypt_prod
  ]
}
