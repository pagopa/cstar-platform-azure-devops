variable "mil-deploy" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "mil-aks-deploy"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
      path               = "mil"
    }
  }
}

locals {
  # global vars
  mil-deploy-variables = {
    dockerfile = "Dockerfile"
  }
  # global secrets
  mil-deploy-variables_secret = {

  }
  # deploy vars
  mil-deploy-variables_deploy = {
    K8S_IMAGE_REPOSITORY_NAME        = replace(var.mil-deploy.repository.name, "-", "")
    DEPLOY_NAMESPACE                 = local.domain
    SETTINGS_XML_RW_SECURE_FILE_NAME = "settings-rw.xml"
    SETTINGS_XML_RO_SECURE_FILE_NAME = "settings-ro.xml"
    HELM_RELEASE_NAME                = var.mil-deploy.repository.name

    DEV_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_dev_name
    DEV_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_dev
    DEV_CONTAINER_REGISTRY_NAME         = local.aks_dev_docker_registry_name
    DEV_AGENT_POOL                      = local.azdo_agent_pool_dev
    UAT_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_uat
    UAT_CONTAINER_REGISTRY_NAME         = local.aks_uat_docker_registry_name
    UAT_AGENT_POOL                      = local.azdo_agent_pool_uat
    PROD_KUBERNETES_SERVICE_CONN        = local.srv_endpoint_name_aks_prod
    PROD_CONTAINER_REGISTRY_NAME        = local.aks_prod_docker_registry_name
    PROD_AGENT_POOL                     = local.azdo_agent_pool_prod
  }
  # deploy secrets
  mil-deploy-variables_secret_deploy = {

  }
}



module "mil-deploy_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_deploy"
  count  = var.mil-deploy.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.mil-deploy.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.mil-deploy.pipeline.path
  ci_trigger_use_yaml          = true

  variables = merge(
    local.mil-deploy-variables,
    local.mil-deploy-variables_deploy,
  )

  variables_secret = merge(
    local.mil-deploy-variables_secret,
    local.mil-deploy-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_pr_id,

    #dev
    local.service_endpoint_azure_dev_id,
    local.service_endpoint_azure_devops_docker_dev_id,
    azuredevops_serviceendpoint_kubernetes.aks_dev.id,
    #uat
    local.service_endpoint_azure_uat_id,
    local.service_endpoint_azure_devops_docker_uat_id,
    azuredevops_serviceendpoint_kubernetes.aks_uat.id,
    #prod
    local.service_endpoint_azure_prod_id,
    local.service_endpoint_azure_devops_docker_prod_id,
    azuredevops_serviceendpoint_kubernetes.aks_prod.id,
  ]

}
