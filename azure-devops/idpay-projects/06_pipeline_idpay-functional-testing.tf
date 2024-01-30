variable "idpay-functional-testing" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "idpay-functional-testing"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = "idpay-functional-testing"
      yml_suffix_name = ".yml"
    }
    pipeline = {
      enable_scheduled_test = true
      enable_deploy         = true
      path                  = "idpay\\idpay-functional-testing"
    }
  }
}

variable "idpay-functional-testing-discount-flow" {
  default = {
    flow_name = "discount-flow"
  }
}

variable "idpay-functional-testing-refund-flow" {
  default = {
    flow_name = "refund-flow"
  }
}

locals {
  # global vars
  idpay-functional-testing-variables = {

  }
  # global secrets
  idpay-functional-testing-variables_secret = {

  }
  # scheduled test vars
  idpay-functional-testing-variables_scheduled_test = {

  }
  # scheduled test secrets
  idpay-functional-testing-secret_scheduled_test = {

  }
}

module "idpay-functional-testing_scheduled_test" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v5.4.0"
  count  = var.idpay-functional-testing.pipeline.enable_scheduled_test == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-functional-testing.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-functional-testing.pipeline.path

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay-functional-testing-variables,
    local.idpay-functional-testing-variables_scheduled_test,
  )

  variables_secret = merge(
    local.idpay-functional-testing-variables_secret,
    local.idpay-functional-testing-secret_scheduled_test,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
  ]
}


module "idpay-functional-testing_scheduled_test_discount" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_generic?ref=v5.4.0"
  count  = var.idpay-functional-testing.pipeline.enable_scheduled_test == true ? 1 : 0

  pipeline_name                = "${var.idpay-functional-testing.repository.yml_prefix_name}.${var.idpay-functional-testing-discount-flow.flow_name}"
  pipeline_yml_filename        = "${var.idpay-functional-testing.repository.yml_prefix_name}-${var.idpay-functional-testing-discount-flow.flow_name}${var.idpay-functional-testing.repository.yml_suffix_name}"
  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-functional-testing.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-functional-testing.pipeline.path

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay-functional-testing-variables,
    local.idpay-functional-testing-variables_scheduled_test,
  )

  variables_secret = merge(
    local.idpay-functional-testing-variables_secret,
    local.idpay-functional-testing-secret_scheduled_test,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
  ]
}

module "idpay-functional-testing_scheduled_test_refund" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_generic?ref=v5.4.0"
  count  = var.idpay-functional-testing.pipeline.enable_scheduled_test == true ? 1 : 0

  pipeline_name                = "${var.idpay-functional-testing.repository.yml_prefix_name}.${var.idpay-functional-testing-refund-flow.flow_name}"
  pipeline_yml_filename        = "${var.idpay-functional-testing.repository.yml_prefix_name}-${var.idpay-functional-testing-refund-flow.flow_name}${var.idpay-functional-testing.repository.yml_suffix_name}"
  project_id                   = data.azuredevops_project.project.id
  repository                   = var.idpay-functional-testing.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  path                         = var.idpay-functional-testing.pipeline.path

  pull_request_trigger_use_yaml = true

  variables = merge(
    local.idpay-functional-testing-variables,
    local.idpay-functional-testing-variables_scheduled_test,
  )

  variables_secret = merge(
    local.idpay-functional-testing-variables_secret,
    local.idpay-functional-testing-secret_scheduled_test,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_ro_id,
  ]
}
