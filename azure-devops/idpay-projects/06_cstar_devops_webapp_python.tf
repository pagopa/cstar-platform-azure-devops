variable "devops-webapp-python" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "devops-webapp-python"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
      sonarcloud = {
        # TODO azure devops terraform provider does not support SonarCloud service endpoint
        service_connection = "SONARCLOUD-SERVICE-CONN"
        org                = "pagopa"
        project_key        = "pagopa_devops-webapp-python"
        project_name       = "devops-webapp-python"
      }
    }
  }
}

locals {
  # global vars
  devops-webapp-python-variables = {
    cache_version_id = "v1"
    default_branch   = var.devops-webapp-python.repository.branch_name
  }
  # global secrets
  devops-webapp-python-variables_secret = {

  }
  # code_review vars
  devops-webapp-python-variables_code_review = {
    danger_github_api_token = "skip"
    sonarcloud_service_conn = var.devops-webapp-python.pipeline.sonarcloud.service_connection
    sonarcloud_org          = var.devops-webapp-python.pipeline.sonarcloud.org
    sonarcloud_project_key  = var.devops-webapp-python.pipeline.sonarcloud.project_key
    sonarcloud_project_name = var.devops-webapp-python.pipeline.sonarcloud.project_name
  }
  # code_review secrets
  devops-webapp-python-variables_secret_code_review = {

  }
  # deploy vars
  devops-webapp-python-variables_deploy = {
    github_connection = data.terraform_remote_state.core.outputs.service_endpoint_azure_devops_github_ro_name
    tenant_id         = module.secret_azdo.values["PAGOPAIT-TENANTID"].value

    # acr section
    image_repository = "devops-webapp-python"

    dev_container_registry = data.terraform_remote_state.core.outputs.service_endpoint_azure_devops_acr_aks_dev_name
    # uat_container_registry  = azuredevops_serviceendpoint_azurecr.acr_aks_uat.service_endpoint_name
    # prod_container_registry = azuredevops_serviceendpoint_azurecr.acr_aks_prod.service_endpoint_name

    dev_container_namespace  = "pagopapcommonacr.azurecr.io"
    # uat_container_namespace  = "pagopapcommonacr.azurecr.io"
    # prod_container_namespace = "pagopapcommonacr.azurecr.io"

  }
  # deploy secrets
  devops-webapp-python-variables_secret_deploy = {

  }
}

module "devops-webapp-python_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v2.0.4"
  count  = var.devops-webapp-python.pipeline.enable_code_review == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.devops-webapp-python.repository
  github_service_connection_id = data.terraform_remote_state.core.outputs.service_endpoint_azure_devops_github_pr_id


  variables = merge(
    local.devops-webapp-python-variables,
    local.devops-webapp-python-variables_code_review,
  )

  variables_secret = merge(
    local.devops-webapp-python-variables_secret,
    local.devops-webapp-python-variables_secret_code_review,
  )

  service_connection_ids_authorization = [
    data.terraform_remote_state.core.outputs.service_endpoint_azure_devops_github_ro_id,
    local.azuredevops_serviceendpoint_sonarcloud_id
  ]
}

module "devops-webapp-python_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.0.4"
  count  = var.devops-webapp-python.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.devops-webapp-python.repository
  github_service_connection_id = data.terraform_remote_state.core.outputs.service_endpoint_azure_devops_github_ro_id

  variables = merge(
    local.devops-webapp-python-variables,
    local.devops-webapp-python-variables_deploy,
  )

  variables_secret = merge(
    local.devops-webapp-python-variables_secret,
    local.devops-webapp-python-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    data.terraform_remote_state.core.outputs.service_endpoint_azure_devops_github_ro_id,
    data.terraform_remote_state.core.outputs.service_endpoint_azure_devops_acr_aks_dev_id,
    # azuredevops_serviceendpoint_azurecr.acr_aks_uat.id,
    # azuredevops_serviceendpoint_azurecr.acr_aks_prod.id,
    data.terraform_remote_state.core.outputs.service_endpoint_azure_dev_id,
    # azuredevops_serviceendpoint_azurerm.UAT-SERVICE-CONN.id,
    # azuredevops_serviceendpoint_azurerm.PROD-SERVICE-CONN.id,
  ]
}
