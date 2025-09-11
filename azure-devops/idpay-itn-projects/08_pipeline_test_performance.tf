variable "eie_performance_test" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "eie-performance-test"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      path = "idpay\\eie-performance-test"
    }
  }
}

locals {
  # global vars
  eie_performance_test_variables = {}

  # global secrets
  eie_performance_test_variables_secret = {}

}

module "eie_performance_test" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.eie_performance_test.repository
  github_service_connection_id = local.service_connection_github_ro_id

  pipeline_name         = "${local.product}-performance-test.test"
  pipeline_yml_filename = "testing-pipelines.yml"
  path                  = var.eie_performance_test.pipeline.path

  variables = merge(
    local.eie_performance_test_variables,
  )

  variables_secret = merge(
    local.eie_performance_test_variables_secret
  )

  service_connection_ids_authorization = [
    local.service_connection_github_ro_id,
    local.dev_service_endpoint_azure_id,
    local.uat_service_endpoint_azure_id,
    local.prod_service_endpoint_azure_id
  ]
}
