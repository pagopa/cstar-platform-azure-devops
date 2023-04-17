variable "idpay-merchant-mock-frontend" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-merchant-mock-frontend"
      path            = "idpay\\frontend"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = false
      enable_deploy      = true
      path               = "idpay\\idpay-merchant-mock-frontend"
    }
  }
}

locals {
  # global vars
  idpay-merchant-mock-frontend-variables = {
    default_branch = var.idpay-merchant-mock-frontend.repository.branch_name
  }
  # global secrets
  idpay-merchant-mock-frontend-variables_secret = {

  }
  # code_review vars
  idpay-merchant-mock-frontend-variables_code_review = {
    danger_github_api_token = "skip"
    sonarcloud_service_conn = "SONARCLOUD-SERVICE-CONN"
    sonarcloud_org          = var.idpay-merchant-mock-frontend.repository.organization
    sonarcloud_project_key  = "${var.idpay-merchant-mock-frontend.repository.organization}_${var.idpay-merchant-mock-frontend.repository.name}"
    sonarcloud_project_name = var.idpay-merchant-mock-frontend.repository.name
  }
  # code_review secrets
  idpay-merchant-mock-frontend-variables_secret_code_review = {

  }
  # deploy vars
  idpay-merchant-mock-frontend-variables_deploy = {

  }
  # deploy secrets
  idpay-merchant-mock-frontend-variables_secret_deploy = {

  }
}

module "idpay-fe-merchant-mock_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v2.2.0"
  count  = var.idpay-merchant-mock-frontend.pipeline.enable_code_review == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-merchant-mock-frontend.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-merchant-mock-frontend.pipeline.path

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay-merchant-mock-frontend-variables,
    local.idpay-merchant-mock-frontend-variables_code_review,
  )

  variables_secret = merge(
    local.idpay-merchant-mock-frontend-variables_secret,
    local.idpay-merchant-mock-frontend-variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
  ]
}

module "idpay-fe-merchant-mock_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.2.0"
  count  = var.idpay-merchant-mock-frontend.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-merchant-mock-frontend.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_ro_id
  path                         = var.idpay-merchant-mock-frontend.pipeline.path

  ci_trigger_use_yaml = true

  variables = merge(
    local.idpay-fe-common-variables_deploy,
    local.idpay-merchant-mock-frontend-variables,
    local.idpay-merchant-mock-frontend-variables_deploy,
  )

  variables_secret = merge(
    local.idpay-merchant-mock-frontend-variables_secret,
    local.idpay-merchant-mock-frontend-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
    local.service_endpoint_azure_dev_id,
  ]

}
