variable "idpay-fe-welfare" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-portal-welfare-frontend"
      branch_name     = "main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
    }
  }
}

locals {
  # global vars
  idpay-fe-welfare-variables = {
    default_branch = var.idpay-fe-welfare.repository.branch_name
  }
  # global secrets
  idpay-fe-welfare-variables_secret = {

  }
  # code_review vars
  idpay-fe-welfare-variables_code_review = {
    danger_github_api_token = "skip"
  }
  # code_review secrets
  idpay-fe-welfare-variables_secret_code_review = {

  }
  # deploy vars
  idpay-fe-welfare-variables_deploy = {

  }
  # deploy secrets
  idpay-fe-welfare-variables_secret_deploy = {

  }
}

module "idpay-fe-welfare_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v2.0.4"
  count  = var.idpay-fe-welfare.pipeline.enable_code_review == true ? 1 : 0

  project_id                   = azuredevops_project.project.id
  repository                   = var.idpay-fe-welfare.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-pr.id

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay-fe-welfare-variables,
    local.idpay-fe-welfare-variables_code_review,
  )

  variables_secret = merge(
    local.idpay-fe-welfare-variables_secret,
    local.idpay-fe-welfare-variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id
  ]
}

module "idpay-fe-welfare_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.0.4"
  count  = var.idpay-fe-welfare.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = azuredevops_project.project.id
  repository                   = var.idpay-fe-welfare.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  ci_trigger_use_yaml = true

  variables = merge(
    local.selc-fe-common-variables_deploy,
    local.idpay-fe-welfare-variables,
    local.idpay-fe-welfare-variables_deploy,
  )

  variables_secret = merge(
    local.idpay-fe-welfare-variables_secret,
    local.idpay-fe-welfare-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id,
    azuredevops_serviceendpoint_azurerm.DEV-CSTAR.id,
    azuredevops_serviceendpoint_azurerm.UAT-CSTAR.id,
    azuredevops_serviceendpoint_azurerm.PROD-CSTAR.id
  ]
  
}