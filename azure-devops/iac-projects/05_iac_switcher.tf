variable "switcher_iac" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "eng-common-scripts"
      branch_name     = "refs/heads/main"
      pipelines_path  = "devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable = true
      path   = "switcher"
    }
  }
}

locals {
  # deploy vars
  iac-variables_switcher = {
    TF_AZURE_SERVICE_CONNECTION_NAME = module.dev_tf_azure_service_connection_deploy["iac"].service_endpoint_name
    TF_AZURE_DEVOPS_POOL_AGENT_NAME : "cstar-dev-linux-infra"
  }
  # deploy secrets
  iac-variables_secret_switcher = {}

}


module "resource_switcher" {
  providers = {
    azurerm = azurerm.dev
  }

  source = "./.terraform/modules/__devops_v0__/azuredevops_build_definition_resource_switcher"

  path = var.switcher_iac.pipeline.path

  project_id                   = data.azuredevops_project.this["iac"].id
  repository                   = var.switcher_iac.repository
  github_service_connection_id = data.azuredevops_serviceendpoint_github.azure_devops_github_pr["iac"].id

  variables = merge(
    local.iac-variables_switcher,
  )

  variables_secret = merge(
    local.iac-variables_secret_switcher,
  )

  timeout = 50

  service_connection_ids_authorization = [
    data.azuredevops_serviceendpoint_github.azure_devops_github_ro["iac"].id,
    module.dev_tf_azure_service_connection_deploy["iac"].service_endpoint_id
  ]

  schedule_configuration = {
    days_to_build = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    timezone      = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"
    branch_filter = {
      include = ["main"]
      exclude = []
    }
    aks = [
      {
        cluster_name         = "cstar-d-weu-dev01-aks"
        start_time           = "08:00"
        stop_time            = "20:00"
        rg                   = "cstar-d-weu-dev01-aks-rg"
        node_pool_exclusions = ["cstdev01usr"]
        force                = true
        user = {
          nodes_on_start = "1,3"
          nodes_on_stop  = "0,0"
        }
        system = {
          nodes_on_start = "1,3"
          nodes_on_stop  = "1,1"
        }
      }
    ]
    sa_sftp = [
      {
        sa_name    = "cstardsftp"
        start_time = "08:00"
        stop_time  = "20:00"
      }
    ]
  }
}
