module "generic_pipelines" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  for_each = local.generic_pipelines

  project_id                   = data.azuredevops_project.this[each.value.project_name].id
  repository                   = merge(local.default_repository, each.value.repository)
  github_service_connection_id = data.azuredevops_serviceendpoint_github.azure_devops_github_pr[each.value.project_name].service_endpoint_id
  path                         = each.value.pipeline_path
  pipeline_name                = each.key
  pipeline_yml_filename        = each.value.repository.yml_file_name

  ci_trigger_use_yaml = false

  variables = merge(
    local.devops_settings[each.value.project_name].default_env_variables,
    {
      #APPLY
      TF_AZURE_SERVICE_CONNECTION_APPLY_NAME_DEV  = local.devops_settings[each.value.project_name].dev_tf_azure_service_connection_deploy_name
      TF_AZURE_SERVICE_CONNECTION_APPLY_NAME_UAT  = local.devops_settings[each.value.project_name].uat_tf_azure_service_connection_deploy_name
      TF_AZURE_SERVICE_CONNECTION_APPLY_NAME_PROD = local.devops_settings[each.value.project_name].prod_tf_azure_service_connection_deploy_name
  })

  variables_secret = {}

  service_connection_ids_authorization = [
    data.azuredevops_serviceendpoint_github.azure_devops_github_ro[each.value.project_name].service_endpoint_id,
    module.dev_tf_azure_service_connection_plan[each.value.project_name].service_endpoint_id,
    module.uat_tf_azure_service_connection_plan[each.value.project_name].service_endpoint_id,
    module.prod_tf_azure_service_connection_plan[each.value.project_name].service_endpoint_id
  ]

  schedules = lookup(each.value, "schedules", null)
}
