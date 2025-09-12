##################################################
# HOW TO DEFINE A PIPELINE FOR A NEW DOMAIN?     #
# have a look at README.md                       #
##################################################
module "iac_code_review" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_code_review"

  for_each = { for d in local.code_review_domains : d.name => d }
  path     = each.value.pipeline_path

  project_id                   = data.azuredevops_project.this[each.value.project_name].id
  repository                   = merge(local.default_repository, each.value.repository)
  github_service_connection_id = data.azuredevops_serviceendpoint_github.azure_devops_github_pr[each.value.project_name].service_endpoint_id

  pipeline_name_prefix = "${upper(each.value.location_short)}-${each.value.pipeline_prefix}"

  variables = merge(
    {
      tf_aks_dev_name  = local.tf_aks_dev_name[each.value.location_short]
      tf_aks_uat_name  = local.tf_aks_uat_name[each.value.location_short]
      tf_aks_prod_name = local.tf_aks_prod_name[each.value.location_short]
    },
    local.devops_settings[each.value.project_name].default_env_variables,

    local.project_settings[each.value.project_name].default_env_variables,

    contains(each.value.envs, "d") && try(each.value.kv_name, "") != "" ? {
      tf_dev_aks_apiserver_url         = module.dev_secrets[each.value.name].values["${local.tf_aks_dev_name[each.value.location_short]}-apiserver-url"].value,
      tf_dev_aks_azure_devops_sa_cacrt = module.dev_secrets[each.value.name].values["${local.tf_aks_dev_name[each.value.location_short]}-azure-devops-sa-cacrt"].value,
      tf_dev_aks_azure_devops_sa_token = base64decode(module.dev_secrets[each.value.name].values["${local.tf_aks_dev_name[each.value.location_short]}-azure-devops-sa-token"].value),
    } : {},
    contains(each.value.envs, "u") && try(each.value.kv_name, "") != "" ? {
      tf_uat_aks_apiserver_url         = module.uat_secrets[each.value.name].values["${local.tf_aks_uat_name[each.value.location_short]}-apiserver-url"].value,
      tf_uat_aks_azure_devops_sa_cacrt = module.uat_secrets[each.value.name].values["${local.tf_aks_uat_name[each.value.location_short]}-azure-devops-sa-cacrt"].value,
      tf_uat_aks_azure_devops_sa_token = base64decode(module.uat_secrets[each.value.name].values["${local.tf_aks_uat_name[each.value.location_short]}-azure-devops-sa-token"].value),
    } : {},
    contains(each.value.envs, "p") && try(each.value.kv_name, "") != "" ? {
      tf_prod_aks_apiserver_url         = module.prod_secrets[each.value.name].values["${local.tf_aks_prod_name[each.value.location_short]}-apiserver-url"].value,
      tf_prod_aks_azure_devops_sa_cacrt = module.prod_secrets[each.value.name].values["${local.tf_aks_prod_name[each.value.location_short]}-azure-devops-sa-cacrt"].value,
      tf_prod_aks_azure_devops_sa_token = base64decode(module.prod_secrets[each.value.name].values["${local.tf_aks_prod_name[each.value.location_short]}-azure-devops-sa-token"].value),
    } : {},
    local.base_iac_variables_code_review,
  )

  variables_secret = merge(
    local.base_iac_variables_secret_code_review,
    try(local.domain_variables[each.value.name].iac_variables_secrets_deploy, {})
  )

  service_connection_ids_authorization = [
    data.azuredevops_serviceendpoint_github.azure_devops_github_ro[each.value.project_name].service_endpoint_id,

    # PLAN
    data.azuredevops_serviceendpoint_azurerm.dev_tf_azure_service_connection_plan[each.value.project_name].service_endpoint_id,
    data.azuredevops_serviceendpoint_azurerm.uat_tf_azure_service_connection_plan[each.value.project_name].service_endpoint_id,
    data.azuredevops_serviceendpoint_azurerm.prod_tf_azure_service_connection_plan[each.value.project_name].service_endpoint_id
  ]
}

##################################################
# HOW TO DEFINE A PIPELINE FOR A NEW DOMAIN?     #
# have a look at README.md                       #
##################################################
module "iac_deploy" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_deploy"

  for_each = { for d in local.deploy_domains : d.name => d }
  path     = each.value.pipeline_path

  project_id                   = data.azuredevops_project.this[each.value.project_name].id
  repository                   = merge(local.default_repository, each.value.repository)
  github_service_connection_id = data.azuredevops_serviceendpoint_github.azure_devops_github_pr[each.value.project_name].service_endpoint_id

  pipeline_name_prefix = "${upper(each.value.location_short)}-${each.value.pipeline_prefix}"

  variables = merge(
    {
      tf_aks_dev_name  = local.tf_aks_dev_name[each.value.location_short]
      tf_aks_uat_name  = local.tf_aks_uat_name[each.value.location_short]
      tf_aks_prod_name = local.tf_aks_prod_name[each.value.location_short]
    },
    local.devops_settings[each.value.project_name].default_env_variables,

    local.project_settings[each.value.project_name].default_env_variables,

    contains(each.value.envs, "d") && try(each.value.kv_name, "") != "" ? {
      tf_dev_aks_apiserver_url         = module.dev_secrets[each.value.name].values["${local.tf_aks_dev_name[each.value.location_short]}-apiserver-url"].value,
      tf_dev_aks_azure_devops_sa_cacrt = module.dev_secrets[each.value.name].values["${local.tf_aks_dev_name[each.value.location_short]}-azure-devops-sa-cacrt"].value,
      tf_dev_aks_azure_devops_sa_token = base64decode(module.dev_secrets[each.value.name].values["${local.tf_aks_dev_name[each.value.location_short]}-azure-devops-sa-token"].value),
    } : {},
    contains(each.value.envs, "u") && try(each.value.kv_name, "") != "" ? {
      tf_uat_aks_apiserver_url         = module.uat_secrets[each.value.name].values["${local.tf_aks_uat_name[each.value.location_short]}-apiserver-url"].value,
      tf_uat_aks_azure_devops_sa_cacrt = module.uat_secrets[each.value.name].values["${local.tf_aks_uat_name[each.value.location_short]}-azure-devops-sa-cacrt"].value,
      tf_uat_aks_azure_devops_sa_token = base64decode(module.uat_secrets[each.value.name].values["${local.tf_aks_uat_name[each.value.location_short]}-azure-devops-sa-token"].value),
    } : {},
    contains(each.value.envs, "p") && try(each.value.kv_name, "") != "" ? {
      tf_prod_aks_apiserver_url         = module.prod_secrets[each.value.name].values["${local.tf_aks_prod_name[each.value.location_short]}-apiserver-url"].value,
      tf_prod_aks_azure_devops_sa_cacrt = module.prod_secrets[each.value.name].values["${local.tf_aks_prod_name[each.value.location_short]}-azure-devops-sa-cacrt"].value,
      tf_prod_aks_azure_devops_sa_token = base64decode(module.prod_secrets[each.value.name].values["${local.tf_aks_prod_name[each.value.location_short]}-azure-devops-sa-token"].value),
    } : {},
    local.base_iac_variables_deploy
  )

  variables_secret = merge(
    local.base_iac_variables_secret_deploy,
    try(local.domain_variables[each.value.name].iac_variables_secrets_deploy, {})
  )

  service_connection_ids_authorization = [
    data.azuredevops_serviceendpoint_github.azure_devops_github_ro[each.value.project_name].service_endpoint_id,

    # PLAN
    data.azuredevops_serviceendpoint_azurerm.dev_tf_azure_service_connection_plan[each.value.project_name].service_endpoint_id,
    data.azuredevops_serviceendpoint_azurerm.uat_tf_azure_service_connection_plan[each.value.project_name].service_endpoint_id,
    data.azuredevops_serviceendpoint_azurerm.prod_tf_azure_service_connection_plan[each.value.project_name].service_endpoint_id,

    # APPLY
    data.azuredevops_serviceendpoint_azurerm.dev_tf_azure_service_connection_apply[each.value.project_name].service_endpoint_id,
    data.azuredevops_serviceendpoint_azurerm.uat_tf_azure_service_connection_apply[each.value.project_name].service_endpoint_id,
    data.azuredevops_serviceendpoint_azurerm.prod_tf_azure_service_connection_apply[each.value.project_name].service_endpoint_id
  ]
}
