variable "emd_functional_test" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "emd-functional-testing"
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
  emd_functional_test_variables = {
    secure_file_name = "emd_feature_secrets.yaml"
  }

  # global secrets
  emd_functional_test_variables_secret = {}

}

module "emd_functional_test" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.emd_functional_test.repository
  github_service_connection_id = data.azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id
  pipeline_name                = "${local.product}-feature.test"
  pipeline_yml_filename        = "testing-pipeline.yml"
  path                         = var.emd_functional_test.pipeline.path

  variables = merge(
    local.emd_functional_test_variables,
  )

  variables_secret = merge(
    local.emd_functional_test_variables_secret
  )

  service_connection_ids_authorization = [
    #dev
    local.service_endpoint_azure_dev_id,

    #uat
    local.service_endpoint_azure_uat_id,
  ]
}
