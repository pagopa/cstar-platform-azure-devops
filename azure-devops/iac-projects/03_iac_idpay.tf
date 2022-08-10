variable "idpay_iac" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "cstar-infrastructure"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = "idpay"
    }
    pipeline = {
      enable_code_review   = true
      enable_deploy        = false
      path                 = "idpay-infrastructure"
      pipeline_name_prefix = "cstar-idpay-infra"
    }
  }
}

locals {
  # global vars
  idpay_iac_variables = {

  }
  # global secrets
  idpay_iac_variables_secret = {

  }

  # code_review vars
  idpay_iac_variables_code_review = {

  }
  # code_review secrets
  idpay_iac_variables_secret_code_review = {

  }

  # deploy vars
  idpay_iac_variables_deploy = {

  }
  # deploy secrets
  idpay_iac_variables_secret_deploy = {

  }
}

module "idpay_iac_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v2.6.1"
  count  = var.idpay_iac.pipeline.enable_code_review == true ? 1 : 0
  path   = var.idpay_iac.pipeline.path

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay_iac.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  pipeline_name_prefix = var.idpay_iac.pipeline.pipeline_name_prefix

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay_iac_variables,
    local.idpay_iac_variables_code_review,
  )

  variables_secret = merge(
    local.idpay_iac_variables_secret,
    local.idpay_iac_variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id,
    azuredevops_serviceendpoint_azurerm.DEV-CSTAR.id,
    azuredevops_serviceendpoint_azurerm.UAT-CSTAR.id,
    azuredevops_serviceendpoint_azurerm.PROD-CSTAR.id,
  ]
}

module "idpay_iac_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.6.1"
  count  = var.idpay_iac.pipeline.enable_deploy == true ? 1 : 0
  path   = var.idpay_iac.pipeline.path

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay_iac.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  ci_trigger_use_yaml = true

  variables = merge(
    local.idpay_iac_variables,
    local.idpay_iac_variables_deploy,
  )

  variables_secret = merge(
    local.idpay_iac_variables_secret,
    local.idpay_iac_variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id,
    azuredevops_serviceendpoint_azurerm.DEV-CSTAR.id,
    azuredevops_serviceendpoint_azurerm.UAT-CSTAR.id,
    azuredevops_serviceendpoint_azurerm.PROD-CSTAR.id,
  ]
}
