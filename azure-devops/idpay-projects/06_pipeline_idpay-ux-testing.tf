variable "idpay-ux-testing" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-ux-testing"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = "idpay"
    }
    pipeline = {
      enable_scheduled_test = true
      enable_deploy         = true
      path                  = "idpay\\idpay-ux-testing"
    }
  }
}

locals {
  # global vars
  idpay-ux-testing-variables = {

  }
  # global secrets
  idpay-ux-testing-variables_secret = {

  }
  # scheduled test vars
  idpay-ux-testing-variables_scheduled_test = {

  }
  # scheduled test secrets
  idpay-ux-testing-secret_scheduled_test = {

  }
}

module "idpay-ux-testing_scheduled_test" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v5.0.0"
  count  = var.idpay-ux-testing.pipeline.enable_scheduled_test == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-ux-testing.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-ux-testing.pipeline.path

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay-ux-testing-variables,
    local.idpay-ux-testing-variables_scheduled_test,
  )

  variables_secret = merge(
    local.idpay-ux-testing-variables_secret,
    local.idpay-ux-testing-secret_scheduled_test,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
  ]
}
