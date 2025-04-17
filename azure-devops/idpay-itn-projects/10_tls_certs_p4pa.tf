locals {
  env_mappings_p4pa = {
    dev = {
      dns_zone_name                       = "dev.p4pa.pagopa.it"
      dns_zone_rg                         = "p4pa-d-itn-core-vnet-rg"
      subscription_name                   = data.azurerm_subscriptions.dev.subscriptions[0].display_name
      subscription_id                     = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
      credential_key_vault_name           = local.dev_domain_kv_name
      credential_key_vault_resource_group = local.dev_domain_kv_resource_group
      service_endpoint                    = local.dev_srv_endpoint_tls_id
      variables = {
        KEY_VAULT_SERVICE_CONNECTION = module.dev_tls_cert_service_conn.service_endpoint_name
      }
      variables_secret = {}
    }
    uat = {
      dns_zone_name                       = "uat.p4pa.pagopa.it"
      dns_zone_rg                         = "p4pa-u-itn-core-vnet-rg"
      subscription_name                   = data.azurerm_subscriptions.uat.subscriptions[0].display_name
      subscription_id                     = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
      credential_key_vault_name           = local.uat_domain_kv_name
      credential_key_vault_resource_group = local.uat_domain_kv_resource_group
      service_endpoint                    = local.uat_srv_endpoint_tls_id
      variables = {
        KEY_VAULT_SERVICE_CONNECTION = module.uat_tls_cert_service_conn.service_endpoint_name
      }
      variables_secret = {}
    }
    prod = {
      dns_zone_name                       = "p4pa.pagopa.it"
      dns_zone_rg                         = "p4pa-p-itn-core-vnet-rg"
      subscription_name                   = data.azurerm_subscriptions.prod.subscriptions[0].display_name
      subscription_id                     = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id
      credential_key_vault_name           = local.prod_domain_kv_name
      credential_key_vault_resource_group = local.prod_domain_kv_resource_group
      service_endpoint                    = local.prod_srv_endpoint_tls_id
      variables = {
        KEY_VAULT_SERVICE_CONNECTION = module.prod_tls_cert_service_conn.service_endpoint_name
      }
      variables_secret = {}
    }
  }

  certificates_p4pa = {
    "cittadini-internal-dev-p4pa-pagopa-it" : {
      env              = "dev"
      dns_record_name  = "cittadini.internal"
      variables        = {}
      variables_secret = {}
    }
    "cittadini-internal-uat-p4pa-pagopa-it" : {
      env              = "uat"
      dns_record_name  = "cittadini.internal"
      variables        = {}
      variables_secret = {}
    }
    "cittadini-internal-p4pa-pagopa-it" : {
      env              = "prod"
      dns_record_name  = "cittadini.internal"
      variables        = {}
      variables_secret = {}
    }
  }
}

module "federated_cert_pipeline_p4pa_dev" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = { for k, v in local.certificates_p4pa : k => v if v.env == "dev" }

  providers = {
    azurerm = azurerm.dev
  }

  location                             = local.location
  managed_identity_resource_group_name = local.dev_identity_rg_name

  project_id                   = local.devops_project_id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = local.srv_endpoint_github_id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.env_mappings_p4pa[each.value.env].dns_zone_name
  dns_zone_resource_group = local.env_mappings_p4pa[each.value.env].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.env_mappings_p4pa[each.value.env].subscription_name
  subscription_id         = local.env_mappings_p4pa[each.value.env].subscription_id

  credential_key_vault_name           = local.env_mappings_p4pa[each.value.env].credential_key_vault_name
  credential_key_vault_resource_group = local.env_mappings_p4pa[each.value.env].credential_key_vault_resource_group

  variables = merge(
    local.env_mappings_p4pa[each.value.env].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.env_mappings_p4pa[each.value.env].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [local.env_mappings_p4pa[each.value.env].service_endpoint]

  schedules = {
    days_to_build              = ["Wed", "Fri"]
    schedule_only_with_changes = false
    start_hours                = 16
    start_minutes              = 10
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = ["master"]
      exclude = []
    }
  }

  depends_on = [
    module.letsencrypt_dev
  ]
}

module "federated_cert_pipeline_p4pa_uat" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = { for k, v in local.certificates_p4pa : k => v if v.env == "uat" }

  providers = {
    azurerm = azurerm.uat
  }

  location                             = local.location
  managed_identity_resource_group_name = local.uat_identity_rg_name

  project_id                   = local.devops_project_id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = local.srv_endpoint_github_id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.env_mappings_p4pa[each.value.env].dns_zone_name
  dns_zone_resource_group = local.env_mappings_p4pa[each.value.env].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.env_mappings_p4pa[each.value.env].subscription_name
  subscription_id         = local.env_mappings_p4pa[each.value.env].subscription_id

  credential_key_vault_name           = local.env_mappings_p4pa[each.value.env].credential_key_vault_name
  credential_key_vault_resource_group = local.env_mappings_p4pa[each.value.env].credential_key_vault_resource_group

  variables = merge(
    local.env_mappings_p4pa[each.value.env].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.env_mappings_p4pa[each.value.env].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [local.env_mappings_p4pa[each.value.env].service_endpoint]

  schedules = {
    days_to_build              = ["Wed", "Fri"]
    schedule_only_with_changes = false
    start_hours                = 16
    start_minutes              = 20
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = ["master"]
      exclude = []
    }
  }

  depends_on = [
    module.letsencrypt_uat
  ]
}

module "federated_cert_pipeline_p4pa_prod" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = { for k, v in local.certificates_p4pa : k => v if v.env == "prod" }

  providers = {
    azurerm = azurerm.prod
  }

  location                             = local.location
  managed_identity_resource_group_name = local.prod_identity_rg_name

  project_id                   = local.devops_project_id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = local.srv_endpoint_github_id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.env_mappings_p4pa[each.value.env].dns_zone_name
  dns_zone_resource_group = local.env_mappings_p4pa[each.value.env].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.env_mappings_p4pa[each.value.env].subscription_name
  subscription_id         = local.env_mappings_p4pa[each.value.env].subscription_id

  credential_key_vault_name           = local.env_mappings_p4pa[each.value.env].credential_key_vault_name
  credential_key_vault_resource_group = local.env_mappings_p4pa[each.value.env].credential_key_vault_resource_group

  variables = merge(
    local.env_mappings_p4pa[each.value.env].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.env_mappings_p4pa[each.value.env].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [local.env_mappings_p4pa[each.value.env].service_endpoint]

  schedules = {
    days_to_build              = ["Wed", "Fri"]
    schedule_only_with_changes = false
    start_hours                = 16
    start_minutes              = 30
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = ["master"]
      exclude = []
    }
  }

  depends_on = [
    module.letsencrypt_prod
  ]
}
