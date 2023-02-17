variable "idpay-functional-testing" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-functional-testing"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = "idpay"
    }
    pipeline = {
      enable_scheduled_test = true
      enable_deploy         = true
      path                  = "idpay\\rtd-ms-sender-auth"
    }
  }
}

locals {
  # global vars
  idpay-functional-testing-variables = {
    dockerfile = "Dockerfile"
  }
  # global secrets
  idpay-functional-testing-variables_secret = {

  }
  # scheduled test vars
  idpay-functional-testing-variables_scheduled_test = {

  }
  # scheduled test secrets
  idpay-functional-testing-secret_scheduled_test = {

  }
}

module "idpay-functional-testing_scheduled_test" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v2.2.0"
  count  = var.idpay-functional-testing.pipeline.enable_scheduled_test == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-functional-testing.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-functional-testing.pipeline.path

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay-functional-testing-variables,
    local.idpay-functional-testing-variables_scheduled_test,
  )

  variables_secret = merge(
    local.idpay-functional-testing-variables_secret,
    local.idpay-functional-testing-secret_scheduled_test,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
  ]
}
