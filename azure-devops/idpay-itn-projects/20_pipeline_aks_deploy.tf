variable "idpay_aks_deploy" {
  default = {
    repository = {
      organization   = "pagopa"
      name           = "idpay-deploy-aks"
      branch_name    = "refs/heads/main"
      pipelines_path = ".devops"
    }
    pipeline = {
      path = "argocd\\idpay-deploy-aks"
      name = "idpay-deploy-aks"
    }
  }
}

locals {
  # global vars
  idpay_aks_deploy_variables = {}

  # global secrets
  idpay_aks_deploy_variables_secret = {}

  # code_review vars
  idpay_aks_deploy_variables_code_review = {
  }
  # code_review secrets
  idpay_aks_deploy_variables_secret_code_review = {}

  # deploy vars
  idpay_aks_deploy_variables_deploy = {
    DEV_AGENT_POOL                    = local.azdo_agent_pool_dev
    DEV_ARGOCD_SERVER                 = module.domain_dev_secrets.values["argocd-server-url"].value
    DEV_ARGOCD_USERNAME               = module.domain_dev_secrets.values["argocd-admin-username"].value
    DEV_ARGOCD_PASSWORD               = module.domain_dev_secrets.values["argocd-admin-password"].value
    DEV_AZURE_SERVICE_CONNECTION_NAME = local.service_endpoint_azure_dev_name
    DEV_POSTMAN_KV_NAME               = local.dev_domain_key_vault_name
    DEV_POSTMAN_ENV_SECRET_NAME       = "postman-environment"

    UAT_AGENT_POOL                    = local.azdo_agent_pool_uat
    UAT_ARGOCD_SERVER                 = module.domain_uat_secrets.values["argocd-server-url"].value
    UAT_ARGOCD_USERNAME               = module.domain_uat_secrets.values["argocd-admin-username"].value
    UAT_ARGOCD_PASSWORD               = module.domain_uat_secrets.values["argocd-admin-password"].value
    UAT_AZURE_SERVICE_CONNECTION_NAME = local.service_endpoint_azure_uat_name
    UAT_POSTMAN_KV_NAME               = local.uat_domain_key_vault_name
    UAT_POSTMAN_ENV_SECRET_NAME       = "postman-environment"

    PROD_AGENT_POOL                    = local.azdo_agent_pool_prod
    PROD_ARGOCD_SERVER                 = module.domain_prod_secrets.values["argocd-server-url"].value
    PROD_ARGOCD_USERNAME               = module.domain_prod_secrets.values["argocd-admin-username"].value
    PROD_ARGOCD_PASSWORD               = module.domain_prod_secrets.values["argocd-admin-password"].value
    PROD_AZURE_SERVICE_CONNECTION_NAME = local.service_endpoint_azure_prod_name
    PROD_POSTMAN_KV_NAME               = local.prod_domain_key_vault_name
    PROD_POSTMAN_ENV_SECRET_NAME       = "postman-environment"

  }

  # deploy secrets vars
  idpay_aks_deploy_variables_secret_deploy = {}
}

module "idpay_aks_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  project_id                   = data.azuredevops_project.project.project_id
  repository                   = var.idpay_aks_deploy.repository
  github_service_connection_id = data.azuredevops_serviceendpoint_github.io-azure-devops-github-rw.id

  pipeline_name         = "${var.idpay_aks_deploy.pipeline.name}.deploy"
  pipeline_yml_filename = "deploy-argocd-apps.yml"
  path                  = var.idpay_aks_deploy.pipeline.path

  pull_request_trigger_enabled     = true
  pull_request_trigger_auto_cancel = true
  pull_request_trigger_use_yaml    = true

  variables = merge(
    local.idpay_aks_deploy_variables,
    local.idpay_aks_deploy_variables_deploy
  )

  variables_secret = merge(
    local.idpay_aks_deploy_variables_secret,
    local.idpay_aks_deploy_variables_secret_deploy
  )

  service_connection_ids_authorization = [
    local.service_endpoint_azure_dev_name,
    local.service_endpoint_azure_uat_name,
    local.service_endpoint_azure_prod_name
  ]

}
