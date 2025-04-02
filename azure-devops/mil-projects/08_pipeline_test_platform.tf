variable "emd_test_platform" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "emd-test-platform"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      path = "mil"
    }
  }
}

locals {
  # global vars
  emd_test_platform_variables = {}

  # global secrets
  emd_test_platform_variables_secret = {}

}

module "emd_test_platform" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.emd_test_platform.repository
  github_service_connection_id = data.azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id
  pipeline_name                = "${local.product}-test-platform.test"
  pipeline_yml_filename        = "testing-pipelines.yml"
  path                         = var.emd_test_platform.pipeline.path

  variables = merge(
    local.emd_test_platform_variables,
  )

  variables_secret = merge(
    local.emd_test_platform_variables_secret
  )

  service_connection_ids_authorization = [
    #dev
    local.service_endpoint_azure_dev_id,

    #uat
    local.service_endpoint_azure_uat_id,
  ]
}
