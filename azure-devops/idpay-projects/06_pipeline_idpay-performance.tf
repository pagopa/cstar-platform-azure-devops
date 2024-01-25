variable "idpay-performance" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "cstar-integration-test"
      branch_name     = "refs/heads/main"
      pipelines_path  = "pipelines"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = false
      enable_deploy      = true
      path               = "idpay\\idpay-performance"
    }
  }
}

locals {
  # global vars
  idpay-performance-variables = {
  }
  # global secrets
  idpay-performance-variables_secret = {

  }
  # code_review vars
  idpay-performance-variables_code_review = {
  }
  # code_review secrets
  idpay-performance-variables_secret_code_review = {

  }
  # deploy vars
  idpay-performance-variables_deploy = {

  }
  # deploy secrets
  idpay-performance-variables_secret_deploy = {

  }
}

module "idpay-performance_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v5.0.0"
  count  = var.idpay-performance.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-performance.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-performance.pipeline.path
  ci_trigger_use_yaml          = true

  variables = merge(
    local.idpay-performance-variables,
    local.idpay-performance-variables_deploy,
  )

  variables_secret = merge(
    local.idpay-performance-variables_secret,
    local.idpay-performance-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_pr_id,

    local.service_endpoint_azure_dev_id,
  ]

}
