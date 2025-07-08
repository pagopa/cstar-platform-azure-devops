locals {
  # Domains and environment configs
  bonus_elettrodomestici_domains   = ["it", "com", "info", "io", "net", "eu"]
  environments                     = ["dev", "uat", "prod"]
  key_vault_service_connection_key = "KEY_VAULT_SERVICE_CONNECTION"

  bonus_elettrodomestici_key_prefix = "bonuselettrodomestici"

  # Generate domain-environment combinations for bonus elettrodomestici
  bonus_elettrodomestici_combinations = flatten([
    for domain in local.bonus_elettrodomestici_domains : [
      for env in local.environments : {
        domain = domain
        env    = env
        key    = "${env}-${domain}" # Unique key combining env and domain
      }
    ]
  ])

  # Dynamic generation of bonus elettrodomestici certificates
  certificates_bonus = {
    for combo in local.bonus_elettrodomestici_combinations :
    combo.key => {
      env              = combo.env
      domain           = combo.domain
      dns_record_name  = ""
      variables        = {}
      variables_secret = {}
      # Optional fields with defaults
      schedules = {
        days_to_build = ["Fri"]
        start_hours   = combo.env == "dev" ? 4 : (combo.env == "uat" ? 9 : 10)
        start_minutes = combo.env == "dev" ? 30 : 0
      }
      cert_diff_variables = {
        enabled           = false
        alert_enabled     = false
        cert_diff_version = ""
        app_insights_name = ""
        app_insights_rg   = ""
        actions_group     = [""]
      }
    }
  }

  # Environment base configuration
  environment_base_config = {
    dev = {
      dns_zone_rg                         = local.rg_dev_itn_dns_zone_name
      subscription_name                   = local.dev_subscription_name
      subscription_id                     = local.dev_subscription_id
      credential_key_vault_name           = local.dev_kv_domain_name
      credential_key_vault_resource_group = local.dev_kv_domain_resource_group
      service_connection_module           = module.dev_tls_cert_service_connection
    }
    uat = {
      dns_zone_rg                         = local.rg_uat_itn_dns_zone_name
      subscription_name                   = local.uat_subscription_name
      subscription_id                     = local.uat_subscription_id
      credential_key_vault_name           = local.uat_kv_domain_name
      credential_key_vault_resource_group = local.uat_kv_domain_resource_group
      service_connection_module           = module.uat_tls_cert_service_connection
    }
    prod = {
      dns_zone_rg                         = local.rg_prod_itn_dns_zone_name
      subscription_name                   = local.prod_subscription_name
      subscription_id                     = local.prod_subscription_id
      credential_key_vault_name           = local.prod_kv_domain_name
      credential_key_vault_resource_group = local.prod_kv_domain_resource_group
      service_connection_module           = module.prod_tls_cert_service_connection
    }
  }

  # Generate environment configurations for each domain combination
  env_configurations_bonus = {
    for combo in local.bonus_elettrodomestici_combinations :
    combo.key => {
      dns_zone_name                       = combo.env != "prod" ? "${combo.env}.${local.bonus_elettrodomestici_key_prefix}.${combo.domain}" : "${local.bonus_elettrodomestici_key_prefix}.${combo.domain}"
      dns_zone_rg                         = local.environment_base_config[combo.env].dns_zone_rg
      subscription_name                   = local.environment_base_config[combo.env].subscription_name
      subscription_id                     = local.environment_base_config[combo.env].subscription_id
      credential_key_vault_name           = local.environment_base_config[combo.env].credential_key_vault_name
      credential_key_vault_resource_group = local.environment_base_config[combo.env].credential_key_vault_resource_group
      service_endpoint_id                 = local.environment_base_config[combo.env].service_connection_module.service_endpoint_id
      variables = {
        (local.key_vault_service_connection_key) = local.environment_base_config[combo.env].service_connection_module.service_endpoint_name
      }
      variables_secret = {}
    }
  }
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "federated_cert_pipeline_bonus_dev" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = { for k, v in local.certificates_bonus : k => v if v.env == "dev" }

  providers = {
    azurerm = azurerm.dev
  }

  location                             = local.location
  managed_identity_resource_group_name = local.dev_identity_rg_name

  project_id                   = data.azuredevops_project.this.id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = azuredevops_serviceendpoint_github.idpay_bot_github_rw.id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.env_configurations_bonus[each.key].dns_zone_name
  dns_zone_resource_group = local.env_configurations_bonus[each.key].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.env_configurations_bonus[each.key].subscription_name
  subscription_id         = local.env_configurations_bonus[each.key].subscription_id

  credential_key_vault_name           = local.env_configurations_bonus[each.key].credential_key_vault_name
  credential_key_vault_resource_group = local.env_configurations_bonus[each.key].credential_key_vault_resource_group

  variables = merge(
    local.env_configurations_bonus[each.key].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.env_configurations_bonus[each.key].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [local.env_configurations_bonus[each.key].service_endpoint_id]

  schedules = {
    days_to_build              = try(each.value.schedules.days_to_build, ["Fri"])
    schedule_only_with_changes = false
    start_hours                = try(each.value.schedules.start_hours, 4)
    start_minutes              = try(each.value.schedules.start_minutes, 30)
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = [local.tlscert_repository.branch_name]
      exclude = []
    }
  }

  cert_diff_variables = {
    enabled           = try(each.value.cert_diff_variables.enabled, false)
    alert_enabled     = try(each.value.cert_diff_variables.alert_enabled, false)
    cert_diff_version = try(each.value.cert_diff_variables.cert_diff_version, "")
    app_insights_name = try(each.value.cert_diff_variables.app_insights_name, "")
    app_insights_rg   = try(each.value.cert_diff_variables.app_insights_rg, "")
    actions_group     = try(each.value.cert_diff_variables.actions_group, [""])
  }

  depends_on = [
    module.dev_tls_cert_service_connection
  ]
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "federated_cert_pipeline_bonus_uat" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = { for k, v in local.certificates_bonus : k => v if v.env == "uat" }

  providers = {
    azurerm = azurerm.uat
  }

  location                             = local.location
  managed_identity_resource_group_name = local.uat_identity_rg_name

  project_id                   = data.azuredevops_project.this.id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = azuredevops_serviceendpoint_github.idpay_bot_github_rw.id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.env_configurations_bonus[each.key].dns_zone_name
  dns_zone_resource_group = local.env_configurations_bonus[each.key].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.env_configurations_bonus[each.key].subscription_name
  subscription_id         = local.env_configurations_bonus[each.key].subscription_id

  credential_key_vault_name           = local.env_configurations_bonus[each.key].credential_key_vault_name
  credential_key_vault_resource_group = local.env_configurations_bonus[each.key].credential_key_vault_resource_group

  variables = merge(
    local.env_configurations_bonus[each.key].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.env_configurations_bonus[each.key].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [local.env_configurations_bonus[each.key].service_endpoint_id]

  schedules = {
    days_to_build              = try(each.value.schedules.days_to_build, ["Fri"])
    schedule_only_with_changes = false
    start_hours                = try(each.value.schedules.start_hours, 4)
    start_minutes              = try(each.value.schedules.start_minutes, 30)
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = [local.tlscert_repository.branch_name]
      exclude = []
    }
  }

  cert_diff_variables = {
    enabled           = try(each.value.cert_diff_variables.enabled, false)
    alert_enabled     = try(each.value.cert_diff_variables.alert_enabled, false)
    cert_diff_version = try(each.value.cert_diff_variables.cert_diff_version, "")
    app_insights_name = try(each.value.cert_diff_variables.app_insights_name, "")
    app_insights_rg   = try(each.value.cert_diff_variables.app_insights_rg, "")
    actions_group     = try(each.value.cert_diff_variables.actions_group, [""])
  }

  depends_on = [
    module.uat_tls_cert_service_connection
  ]
}

# change only providers
#tfsec:ignore:general-secrets-no-plaintext-exposure
module "federated_cert_pipeline_bonus_prod" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated"

  for_each = { for k, v in local.certificates_bonus : k => v if v.env == "prod" }

  providers = {
    azurerm = azurerm.prod
  }

  location                             = local.location
  managed_identity_resource_group_name = local.prod_identity_rg_name

  project_id                   = data.azuredevops_project.this.id
  repository                   = local.tlscert_repository
  path                         = "TLS-Certificates\\${upper(each.value.env)}"
  github_service_connection_id = azuredevops_serviceendpoint_github.idpay_bot_github_rw.id

  dns_record_name         = each.value.dns_record_name
  dns_zone_name           = local.env_configurations_bonus[each.key].dns_zone_name
  dns_zone_resource_group = local.env_configurations_bonus[each.key].dns_zone_rg
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_name       = local.env_configurations_bonus[each.key].subscription_name
  subscription_id         = local.env_configurations_bonus[each.key].subscription_id

  credential_key_vault_name           = local.env_configurations_bonus[each.key].credential_key_vault_name
  credential_key_vault_resource_group = local.env_configurations_bonus[each.key].credential_key_vault_resource_group

  variables = merge(
    local.env_configurations_bonus[each.key].variables,
    each.value.variables
  )

  variables_secret = merge(
    local.env_configurations_bonus[each.key].variables_secret,
    each.value.variables_secret
  )

  service_connection_ids_authorization = [local.env_configurations_bonus[each.key].service_endpoint_id]

  schedules = {
    days_to_build              = try(each.value.schedules.days_to_build, ["Fri"])
    schedule_only_with_changes = false
    start_hours                = try(each.value.schedules.start_hours, 4)
    start_minutes              = try(each.value.schedules.start_minutes, 30)
    time_zone                  = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = [local.tlscert_repository.branch_name]
      exclude = []
    }
  }

  cert_diff_variables = {
    enabled           = try(each.value.cert_diff_variables.enabled, false)
    alert_enabled     = try(each.value.cert_diff_variables.alert_enabled, false)
    cert_diff_version = try(each.value.cert_diff_variables.cert_diff_version, "")
    app_insights_name = try(each.value.cert_diff_variables.app_insights_name, "")
    app_insights_rg   = try(each.value.cert_diff_variables.app_insights_rg, "")
    actions_group     = try(each.value.cert_diff_variables.actions_group, [""])
  }

  depends_on = [
    module.prod_tls_cert_service_connection
  ]
}
