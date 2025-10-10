keycloak-test-user-passwordvariable "pari_generic_performance_test" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "pari-performance-test"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      path = "idpay\\pari-performance-test"
    }
  }
}

locals {
  # global vars
  pari_generic_performance_test_variables = {}

  # global secrets
  pari_generic_performance_test_variables_secret = {
    DEV_KEYCLOAK_USERNAME                = module.domain_dev_secrets.values["keycloak-test-user-username"].value
    DEV_KEYCLOAK_PASSWORD                = module.domain_dev_secrets.values["keycloak-test-user-password"].value

    UAT_KEYCLOAK_USERNAME                = module.domain_uat_secrets.values["keycloak-test-user-username"].value
    UAT_KEYCLOAK_PASSWORD                = module.domain_uat_secrets.values["keycloak-test-user-password"].value
  }

}

module "pari_generic_performance_test" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.pari_generic_performance_test.repository
  github_service_connection_id = local.service_connection_github_ro_id

  pipeline_name         = "k6-performance-generic.test"
  pipeline_yml_filename = "k6-performance-generic.yml"
  path                  = var.pari_generic_performance_test.pipeline.path

  variables = merge(
    local.pari_generic_performance_test_variables,
  )

  variables_secret = merge(
    local.pari_generic_performance_test_variables_secret
  )

  service_connection_ids_authorization = [
    local.service_connection_github_ro_id,
    local.dev_service_endpoint_azure_id,
    local.uat_service_endpoint_azure_id,
    local.prod_service_endpoint_azure_id
  ]
}
