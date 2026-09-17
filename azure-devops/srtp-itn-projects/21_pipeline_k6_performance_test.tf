variable "srtp_k6_performance_test" {
  default = {
    repository = {
      organization   = "pagopa"
      name           = "srtp-deploy-aks"
      branch_name    = "refs/heads/main"
      pipelines_path = ".devops"
    }
    pipeline = {
      path = "k6"
      name = "srtp-deploy-aks"
    }
  }
}

locals {
  srtp_k6_performance_test_variables_deploy = {
    DEV_AGENT_POOL                    = local.azdo_agent_pool_dev
    DEV_AZURE_SERVICE_CONNECTION_NAME = local.dev_service_endpoint_azure_name
    DEV_POSTMAN_KV_NAME               = local.dev_kv_domain_name

    UAT_AGENT_POOL                    = local.azdo_agent_pool_uat
    UAT_AZURE_SERVICE_CONNECTION_NAME = local.uat_service_endpoint_azure_name
    UAT_POSTMAN_KV_NAME               = local.uat_kv_domain_name
  }
}

module "srtp_k6_performance_test" {
  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic"

  project_id                   = local.devops_project_id
  repository                   = var.srtp_k6_performance_test.repository
  github_service_connection_id = local.service_connection_github_pr_id

  pipeline_name         = "${var.srtp_k6_performance_test.pipeline.name}.k6-performance-test"
  pipeline_yml_filename = "k6-performance-tests.yml"
  path                  = var.srtp_k6_performance_test.pipeline.path

  ci_trigger_enabled           = false
  pull_request_trigger_enabled = false

  variables = local.srtp_k6_performance_test_variables_deploy

  variables_secret = {}

  service_connection_ids_authorization = [
    local.dev_service_endpoint_azure_id,
    local.uat_service_endpoint_azure_id,
    local.service_connection_github_ro_id,
  ]
}
