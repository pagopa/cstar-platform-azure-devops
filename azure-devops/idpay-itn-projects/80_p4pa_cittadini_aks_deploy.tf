variable "p4pa_arc_cittadini_aks_deploy" {
  default = {
    repository = {
      organization   = "pagopa"
      name           = "arc-cittadini-deploy-aks"
      branch_name    = "refs/heads/main"
      pipelines_path = ".devops"
    }
    pipeline = {
      path = "argocd\\arc-cittadini-deploy-aks"
      name = "arc-cittadini-deploy-aks"
    }
  }
}

locals {
  # global vars
  p4pa_arc_cittadini_aks_deploy_variables = {}

  # global secrets
  p4pa_arc_cittadini_aks_deploy_variables_secret = {}

  # code_review vars
  p4pa_arc_cittadini_aks_deploy_variables_code_review = {
  }
  # code_review secrets
  p4pa_arc_cittadini_aks_deploy_variables_secret_code_review = {}

  # deploy vars
  p4pa_arc_cittadini_aks_deploy_variables_deploy = {
    DEV_AGENT_POOL                    = local.dev_azdo_agent_pool
    DEV_ARGOCD_SERVER                 = module.cittadini_dev_secrets.values["argocd-server-url"].value
    DEV_ARGOCD_USERNAME               = module.cittadini_dev_secrets.values["argocd-admin-username"].value
    DEV_ARGOCD_PASSWORD               = module.cittadini_dev_secrets.values["argocd-admin-password"].value
    DEV_AZURE_SERVICE_CONNECTION_NAME = local.dev_srv_endpoint_azure_name
    DEV_POSTMAN_KV_NAME               = local.dev_domain_kv_name
    DEV_POSTMAN_ENV_SECRET_NAME       = "postman-environment"

    UAT_AGENT_POOL = local.uat_azdo_agent_pool
    #     UAT_ARGOCD_SERVER                 = module.cittadini_uat_secrets.values["argocd-server-url"].value
    #     UAT_ARGOCD_USERNAME               = module.cittadini_uat_secrets.values["argocd-admin-username"].value
    #     UAT_ARGOCD_PASSWORD               = module.cittadini_uat_secrets.values["argocd-admin-password"].value
    UAT_AZURE_SERVICE_CONNECTION_NAME = local.uat_srv_endpoint_azure_name
    UAT_POSTMAN_KV_NAME               = local.uat_domain_kv_name
    UAT_POSTMAN_ENV_SECRET_NAME       = "postman-environment"

    PROD_AGENT_POOL = local.prod_azdo_agent_pool
    #     PROD_ARGOCD_SERVER                 = module.cittadini_prod_secrets.values["argocd-server-url"].value
    #     PROD_ARGOCD_USERNAME               = module.cittadini_prod_secrets.values["argocd-admin-username"].value
    #     PROD_ARGOCD_PASSWORD               = module.cittadini_prod_secrets.values["argocd-admin-password"].value
    PROD_AZURE_SERVICE_CONNECTION_NAME = local.prod_srv_endpoint_azure_name
    PROD_POSTMAN_KV_NAME               = local.prod_domain_kv_name
    PROD_POSTMAN_ENV_SECRET_NAME       = "postman-environment"

  }

  # deploy secrets vars
  p4pa_arc_cittadini_aks_deploy_variables_secret_deploy = {}
}

module "p4pa_arc_cittadini_aks_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  project_id                   = data.azuredevops_project.this.project_id
  repository                   = var.p4pa_arc_cittadini_aks_deploy.repository
  github_service_connection_id = data.azuredevops_serviceendpoint_github.arc_azure_devops_github_rw.id

  pipeline_name         = "${var.p4pa_arc_cittadini_aks_deploy.pipeline.name}.deploy"
  pipeline_yml_filename = "p4pa-deploy-argocd-apps.yml"
  path                  = var.p4pa_arc_cittadini_aks_deploy.pipeline.path

  pull_request_trigger_enabled     = true
  pull_request_trigger_auto_cancel = true
  pull_request_trigger_use_yaml    = true

  variables = merge(
    local.p4pa_arc_cittadini_aks_deploy_variables,
    local.p4pa_arc_cittadini_aks_deploy_variables_deploy
  )

  variables_secret = merge(
    local.p4pa_arc_cittadini_aks_deploy_variables_secret,
    local.p4pa_arc_cittadini_aks_deploy_variables_secret_deploy
  )

  service_connection_ids_authorization = [
    local.dev_srv_endpoint_azure_id,
    local.uat_srv_endpoint_azure_id,
    local.prod_srv_endpoint_azure_id
  ]

}
