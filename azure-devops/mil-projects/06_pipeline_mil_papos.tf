variable "mil-papos" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "mil-papos"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = "mil"
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
      path               = "mil\\mil-papos"
    }
  }
}

locals {
  # global vars
  mil-papos-variables = {
    dockerfile = "Dockerfile"
  }
  # global secrets
  mil-papos-variables_secret = {

  }
  # code_review vars
  mil-papos-variables_code_review = {
    sonarcloud_service_conn = "SONARCLOUD-SERVICE-CONN"
    sonarcloud_org          = var.mil-papos.repository.organization
    sonarcloud_project_key  = "${var.mil-papos.repository.organization}_${var.mil-papos.repository.name}"
    sonarcloud_project_name = var.mil-papos.repository.name
  }
  # code_review secrets
  mil-papos-variables_secret_code_review = {

  }
  # deploy vars
  mil-papos-variables_deploy = {
    K8S_IMAGE_REPOSITORY_NAME        = replace(var.mil-papos.repository.name, "-", "")
    DEPLOY_NAMESPACE                 = local.domain
    SETTINGS_XML_RW_SECURE_FILE_NAME = "settings-rw.xml"
    SETTINGS_XML_RO_SECURE_FILE_NAME = "settings-ro.xml"
    HELM_RELEASE_NAME                = var.mil-papos.repository.name

    DEV_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_dev_name
    DEV_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_dev
    DEV_CONTAINER_REGISTRY_NAME         = local.aks_dev_docker_registry_name
    DEV_AGENT_POOL                      = local.azdo_agent_pool_dev

    UAT_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_uat_name
    UAT_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_uat
    UAT_CONTAINER_REGISTRY_NAME         = local.aks_uat_docker_registry_name
    UAT_AGENT_POOL                      = local.azdo_agent_pool_uat

    //PROD_CONTAINER_REGISTRY_SERVICE_CONN = local.service_endpoint_azure_devops_docker_prod_name
    PROD_KUBERNETES_SERVICE_CONN         = local.srv_endpoint_name_aks_prod
    PROD_CONTAINER_REGISTRY_NAME         = local.aks_prod_docker_registry_name
    PROD_AGENT_POOL                      = local.azdo_agent_pool_prod

  }
  # deploy secrets
  mil-papos-variables_secret_deploy = {

  }
}


module "mil-papos_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v9.1.0"
  count  = var.mil-papos.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.mil-papos.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.mil-papos.pipeline.path

  ci_trigger_use_yaml = true

  variables = merge(
    local.mil-papos-variables,
    local.mil-papos-variables_deploy,
  )

  variables_secret = merge(
    local.mil-papos-variables_secret,
    local.mil-papos-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_pr_id,

    local.service_endpoint_azure_dev_id,
    local.service_endpoint_azure_devops_docker_dev_id,
    azuredevops_serviceendpoint_kubernetes.aks_dev.id,


    local.service_endpoint_azure_uat_id,
    local.service_endpoint_azure_devops_docker_uat_id,
    azuredevops_serviceendpoint_kubernetes.aks_uat.id,

    //local.service_endpoint_azure_prod_id,
    //local.service_endpoint_azure_devops_docker_prod_id,
    //azuredevops_serviceendpoint_kubernetes.aks_prod.id
  ]
}
