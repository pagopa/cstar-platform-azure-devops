locals {
  prefix = "cstar"

  # Projects on Devops
  projects = {
    app = "${local.prefix}-platform-app-projects"
    iac = "${local.prefix}-platform-iac-projects"
  }

  default_repository = {
    organization   = "pagopa"
    branch_name    = "refs/heads/main"
    pipelines_path = ".devops"
  }

  # AKS
  tf_aks_dev_name = {
    itn = "${local.prefix}-d-itn-dev-aks"
    weu = "${local.prefix}-d-weu-dev01-aks"
  }
  tf_aks_uat_name = {
    itn = "${local.prefix}-u-itn-uat-aks"
    weu = "${local.prefix}-u-weu-uat01-aks"
  }
  tf_aks_prod_name = {
    itn = "${local.prefix}-p-itn-prod-aks"
    weu = "${local.prefix}-p-weu-prod01-aks"
  }

  dev_subscription_name  = "dev-${local.prefix}"
  uat_subscription_name  = "uat-${local.prefix}"
  prod_subscription_name = "prod-${local.prefix}"

  aks_dev_platform_name  = "${local.prefix}-d-itn-dev-aks"
  aks_uat_platform_name  = "${local.prefix}-u-itn-uat-aks"
  aks_prod_platform_name = "${local.prefix}-p-itn-prod-aks"

  # aks_dev_weu_platform_name  = "${local.prefix}-d-weu-dev01-aks"
  # aks_uat_weu_platform_name  = "${local.prefix}-u-weu-uat01-aks"
  # aks_prod_weu_platform_name = "${local.prefix}-p-weu-prod01-aks"

  code_review_domains = [for d in local.domains : d if d.code_review == true]
  deploy_domains      = [for d in local.domains : d if d.deploy == true]

  project_settings = {
    for key, project_name in local.projects : project_name => {

      tf_azure_service_connection_plan_name_dev  = data.azuredevops_serviceendpoint_azurerm.dev_tf_azure_service_connection_plan[project_name].service_endpoint_name
      tf_azure_service_connection_plan_name_uat  = data.azuredevops_serviceendpoint_azurerm.uat_tf_azure_service_connection_plan[project_name].service_endpoint_name
      tf_azure_service_connection_plan_name_prod = data.azuredevops_serviceendpoint_azurerm.prod_tf_azure_service_connection_plan[project_name].service_endpoint_name

      tf_azure_service_connection_apply_name_dev  = data.azuredevops_serviceendpoint_azurerm.dev_tf_azure_service_connection_apply[local.projects.app].service_endpoint_name
      tf_azure_service_connection_apply_name_uat  = data.azuredevops_serviceendpoint_azurerm.uat_tf_azure_service_connection_apply[local.projects.app].service_endpoint_name
      tf_azure_service_connection_apply_name_prod = data.azuredevops_serviceendpoint_azurerm.prod_tf_azure_service_connection_apply[local.projects.app].service_endpoint_name

      default_env_variables = {

        # PLAN
        TF_AZURE_SERVICE_CONNECTION_PLAN_NAME_DEV  = data.azuredevops_serviceendpoint_azurerm.dev_tf_azure_service_connection_plan[project_name].service_endpoint_name
        TF_AZURE_SERVICE_CONNECTION_PLAN_NAME_UAT  = data.azuredevops_serviceendpoint_azurerm.uat_tf_azure_service_connection_plan[project_name].service_endpoint_name
        TF_AZURE_SERVICE_CONNECTION_PLAN_NAME_PROD = data.azuredevops_serviceendpoint_azurerm.prod_tf_azure_service_connection_plan[project_name].service_endpoint_name

        #APPLY
        TF_AZURE_SERVICE_CONNECTION_APPLY_NAME_DEV  = data.azuredevops_serviceendpoint_azurerm.dev_tf_azure_service_connection_apply[project_name].service_endpoint_name
        TF_AZURE_SERVICE_CONNECTION_APPLY_NAME_UAT  = data.azuredevops_serviceendpoint_azurerm.uat_tf_azure_service_connection_apply[project_name].service_endpoint_name
        TF_AZURE_SERVICE_CONNECTION_APPLY_NAME_PROD = data.azuredevops_serviceendpoint_azurerm.prod_tf_azure_service_connection_apply[project_name].service_endpoint_name
      }
    }
  }

  devops_settings = {
    (local.projects.app) = {
      srv_endpoint_github_ro = "io-azure-devops-github-ro"
      srv_endpoint_github_pr = "io-azure-devops-github-pr"

      default_env_variables = {
        TF_POOL_NAME_DEV  = "${local.prefix}-dev-linux"
        TF_POOL_NAME_UAT  = "${local.prefix}-uat-linux"
        TF_POOL_NAME_PROD = "${local.prefix}-prod-linux"
      }
      # PLAN
      dev_tf_azure_service_connection_plan_name  = "azdo-dev-${local.prefix}-app-plan-v2-service-conn"
      uat_tf_azure_service_connection_plan_name  = "azdo-uat-${local.prefix}-app-plan-v2-service-conn"
      prod_tf_azure_service_connection_plan_name = "azdo-prod-${local.prefix}-app-plan-v2-service-conn"

      # DEPLOY
      dev_tf_azure_service_connection_deploy_name  = "azdo-dev-${local.prefix}-app-deploy-v2-service-conn"
      uat_tf_azure_service_connection_deploy_name  = "azdo-uat-${local.prefix}-app-deploy-v2-service-conn"
      prod_tf_azure_service_connection_deploy_name = "azdo-prod-${local.prefix}-app-deploy-v2-service-conn"
    }
    (local.projects.iac) = {
      srv_endpoint_github_ro = "azure-devops-github-ro"
      srv_endpoint_github_pr = "azure-devops-github-pr"
      srv_endpoint_github_rw = "azure-devops-github-rw"

      default_env_variables = {
        TF_POOL_NAME_DEV  = "${local.prefix}-dev-linux-infra-next"
        TF_POOL_NAME_UAT  = "${local.prefix}-uat-linux-infra-next"
        TF_POOL_NAME_PROD = "${local.prefix}-prod-linux-infra-next"
      }
      # PLAN
      dev_tf_azure_service_connection_plan_name  = "azdo-dev-${local.prefix}-iac-plan-v2-service-conn"
      uat_tf_azure_service_connection_plan_name  = "azdo-uat-${local.prefix}-iac-plan-v2-service-conn"
      prod_tf_azure_service_connection_plan_name = "azdo-prod-${local.prefix}-iac-plan-v2-service-conn"

      # DEPLOY
      dev_tf_azure_service_connection_deploy_name  = "azdo-dev-${local.prefix}-iac-deploy-v2-service-conn"
      uat_tf_azure_service_connection_deploy_name  = "azdo-uat-${local.prefix}-iac-deploy-v2-service-conn"
      prod_tf_azure_service_connection_deploy_name = "azdo-prod-${local.prefix}-iac-deploy-v2-service-conn"
    }
  }

  # code review vars
  base_iac_variables_code_review = {}
  # code review secrets
  base_iac_variables_secret_code_review = {}
  # deploy vars
  base_iac_variables_deploy = {}
  # deploy secrets
  base_iac_variables_secret_deploy = {}

  prod_key_vault_azdo_resource_group = "${local.prefix}-p-sec-rg"
  prod_key_vault_azdo_name           = "${local.prefix}-p-azdo-weu-kv"

}
