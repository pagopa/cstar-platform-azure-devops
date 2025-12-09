# variable "mdc_aks_deploy" {
#   default = {
#     repository = {
#       organization   = "pagopa"
#       name           = "mdc-deploy-aks"
#       branch_name    = "refs/heads/main"
#       pipelines_path = ".devops"
#     }
#     pipeline = {
#       path = "argocd"
#       name = "mdc-deploy-aks"
#     }
#   }
# }

# locals {
#   # global vars
#   mdc_aks_deploy_variables = {}

#   # global secrets
#   mdc_aks_deploy_variables_secret = {}

#   # code_review vars
#   mdc_aks_deploy_variables_code_review = {
#   }
#   # code_review secrets
#   mdc_aks_deploy_variables_secret_code_review = {}

#   # deploy vars
#   mdc_aks_deploy_variables_deploy = {
#     DEV_AGENT_POOL                    = local.azdo_agent_pool_dev
#     DEV_ARGOCD_SERVER                 = module.domain_dev_secrets.values["argocd-server-url"].value
#     DEV_ARGOCD_USERNAME               = module.domain_dev_secrets.values["argocd-admin-username"].value
#     DEV_ARGOCD_PASSWORD               = module.domain_dev_secrets.values["argocd-admin-password"].value
#     DEV_AZURE_SERVICE_CONNECTION_NAME = local.dev_service_endpoint_azure_name
#     DEV_POSTMAN_KV_NAME               = local.dev_kv_domain_name
#     DEV_POSTMAN_ENV_SECRET_NAME       = "postman-environment"

#     UAT_AGENT_POOL                    = local.azdo_agent_pool_uat
#     UAT_ARGOCD_SERVER                 = module.domain_uat_secrets.values["argocd-server-url"].value
#     UAT_ARGOCD_USERNAME               = module.domain_uat_secrets.values["argocd-admin-username"].value
#     UAT_ARGOCD_PASSWORD               = module.domain_uat_secrets.values["argocd-admin-password"].value
#     UAT_AZURE_SERVICE_CONNECTION_NAME = local.uat_service_endpoint_azure_name
#     UAT_POSTMAN_KV_NAME               = local.uat_kv_domain_name
#     UAT_POSTMAN_ENV_SECRET_NAME       = "postman-environment"

#     PROD_AGENT_POOL                    = local.azdo_agent_pool_prod
#     PROD_ARGOCD_SERVER                 = module.domain_prod_secrets.values["argocd-server-url"].value
#     PROD_ARGOCD_USERNAME               = module.domain_prod_secrets.values["argocd-admin-username"].value
#     PROD_ARGOCD_PASSWORD               = module.domain_prod_secrets.values["argocd-admin-password"].value
#     PROD_AZURE_SERVICE_CONNECTION_NAME = local.prod_service_endpoint_azure_name
#     PROD_POSTMAN_KV_NAME               = local.prod_kv_domain_name
#     PROD_POSTMAN_ENV_SECRET_NAME       = "postman-environment"

#   }

#   # deploy secrets vars
#   mdc_aks_deploy_variables_secret_deploy = {}
# }

# module "mdc_aks_deploy" {
#   source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

#   project_id                   = local.devops_project_id
#   repository                   = var.mdc_aks_deploy.repository
#   github_service_connection_id = local.service_connection_github_pr_id

#   pipeline_name         = "${var.mdc_aks_deploy.pipeline.name}.deploy"
#   pipeline_yml_filename = "deploy-argocd-apps.yml"
#   path                  = var.mdc_aks_deploy.pipeline.path

#   pull_request_trigger_enabled     = true
#   pull_request_trigger_auto_cancel = true
#   pull_request_trigger_use_yaml    = true

#   variables = merge(
#     local.mdc_aks_deploy_variables,
#     local.mdc_aks_deploy_variables_deploy
#   )

#   variables_secret = merge(
#     local.mdc_aks_deploy_variables_secret,
#     local.mdc_aks_deploy_variables_secret_deploy
#   )

#   service_connection_ids_authorization = [
#     local.dev_service_endpoint_azure_id,
#     local.uat_service_endpoint_azure_id,
#     local.prod_service_endpoint_azure_id
#   ]
# }
