variable "idpay-self-expense-webview" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-self-expense-webview"
      path            = "idpay\\frontend"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = false
      enable_deploy      = true
      path               = "idpay\\idpay-self-expense-webview"
    }
  }
}

locals {
  # global vars
  idpay-self-expense-webview-variables = {
    default_branch = var.idpay-self-expense-webview.repository.branch_name
  }
  # global secrets
  idpay-self-expense-webview-variables_secret = {

  }
  # code_review vars
  idpay-self-expense-webview-variables_code_review = {
    danger_github_api_token = "skip"
    sonarcloud_service_conn = "SONARCLOUD-SERVICE-CONN"
    sonarcloud_org          = var.idpay-self-expense-webview.repository.organization
    sonarcloud_project_key  = "${var.idpay-self-expense-webview.repository.organization}_${var.idpay-self-expense-webview.repository.name}"
    sonarcloud_project_name = var.idpay-self-expense-webview.repository.name
  }
  # code_review secrets
  idpay-self-expense-webview-variables_secret_code_review = {

  }
  # deploy vars
  idpay-self-expense-webview-variables_deploy = {

  }
  # deploy secrets
  idpay-self-expense-webview-variables_secret_deploy = {

  }
}

module "idpay_self_expenses_webview_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v5.4.0"
  count  = var.idpay-self-expense-webview.pipeline.enable_code_review == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-self-expense-webview.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-self-expense-webview.pipeline.path

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay-self-expense-webview-variables,
    local.idpay-self-expense-webview-variables_code_review,
  )

  variables_secret = merge(
    local.idpay-self-expense-webview-variables_secret,
    local.idpay-self-expense-webview-variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
  ]
}

module "idpay_self_expenses_webview_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v5.4.0"
  count  = var.idpay-self-expense-webview.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-self-expense-webview.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_ro_id
  path                         = var.idpay-self-expense-webview.pipeline.path

  ci_trigger_use_yaml = true

  variables = merge(
    local.idpay-fe-common-variables_deploy,
    local.idpay-self-expense-webview-variables,
    local.idpay-self-expense-webview-variables_deploy,
  )

  variables_secret = merge(
    local.idpay-self-expense-webview-variables_secret,
    local.idpay-self-expense-webview-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
    local.service_endpoint_azure_dev_id,
  ]

}
