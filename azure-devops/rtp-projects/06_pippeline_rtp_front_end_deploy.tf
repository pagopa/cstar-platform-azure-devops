variable "rtp_front_end_deploy" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "rtp-start-app"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
      path               = "rtp"
    }
  }
}

locals {

  # deploy vars
  rtp_front_end_variables_deploy = {
    AZURE_DEVOPS_GITHUB_RO = data.azuredevops_serviceendpoint_github.io-azure-devops-github-ro.service_endpoint_name
    DEPLOY_PATH            = ""

  }
}

module "rtp-front-end-deploy_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  providers = {
    azurerm = azurerm.prod
  }

  project_id                   = local.devops_project_id
  repository                   = var.rtp_front_end_deploy.repository
  github_service_connection_id = data.azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  pipeline_name         = "${local.product}-fe.deploy"
  pipeline_yml_filename = "deploy-pipelines.yml"
  path                  = var.rtp_front_end_deploy.pipeline.path

  ci_trigger_enabled  = true
  ci_trigger_use_yaml = true

  variables = merge(
    local.rtp_front_end_variables_deploy,
  )

  variables_secret = {}

  service_connection_ids_authorization = [
    data.azuredevops_serviceendpoint_azurerm.azure_dev.id,
    data.azuredevops_serviceendpoint_azurerm.azure_uat.id,
    data.azuredevops_serviceendpoint_azurerm.azure_prod.id,
    data.azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id
  ]
}