locals {
  prefix           = "cstar"
  azure_devops_org = "pagopaspa"
  location_short   = "itn"
  location         = "italynorth"
  domain           = "idpay"

  product         = "${local.prefix}-${local.domain}"
  external_domain = "pagopa.it"

  # ⚙️ DevOps
  devops_project_id = data.azuredevops_project.this.project_id

  # 🔐 KV Domain
  dev_domain_key_vault_resource_group  = "${local.prefix}-d-${local.domain}-sec-rg"
  uat_domain_key_vault_resource_group  = "${local.prefix}-u-${local.domain}-sec-rg"
  prod_domain_key_vault_resource_group = "${local.prefix}-p-${local.domain}-sec-rg"

  dev_domain_key_vault_name  = "${local.prefix}-d-${local.domain}-kv"
  uat_domain_key_vault_name  = "${local.prefix}-u-${local.domain}-kv"
  prod_domain_key_vault_name = "${local.prefix}-p-${local.domain}-kv"

  # Agent Pool
  azdo_agent_pool_dev  = "cstar-dev-linux"
  azdo_agent_pool_uat  = "cstar-uat-linux"
  azdo_agent_pool_prod = "cstar-prod-linux"

  dev_aks_name  = "${local.prefix}-d-${local.location_short}-aks"
  uat_aks_name  = "${local.prefix}-u-${local.location_short}-aks"
  prod_aks_name = "${local.prefix}-p-${local.location_short}-aks"

  dev_subscription_name  = "dev-${local.prefix}"
  uat_subscription_name  = "uat-${local.prefix}"
  prod_subscription_name = "prod-${local.prefix}"

  #
  # Outputs from CORE
  #
  # service_endpoint_io_azure_devops_github_ro_name = "io-azure-devops-github-ro"
  # service_endpoint_io_azure_devops_github_pr_name = "io-azure-devops-github-pr"
  # service_endpoint_io_azure_devops_github_pr_id   = data.azuredevops_serviceendpoint_github.io-azure-devops-github-pr.id
  # service_endpoint_io_azure_devops_github_ro_id   = data.azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id

  # DEV
  # service_endpoint_azure_devops_docker_dev_name = data.azuredevops_serviceendpoint_azurecr.dev_weu_workload_identity.service_endpoint_name
  # service_endpoint_azure_devops_docker_dev_id   = data.azuredevops_serviceendpoint_azurecr.dev_weu_workload_identity.id
  service_endpoint_azure_dev_id   = data.azuredevops_serviceendpoint_azurerm.azure_dev.id
  service_endpoint_azure_dev_name = data.azuredevops_serviceendpoint_azurerm.azure_dev.service_endpoint_name

  # UAT
  # service_endpoint_azure_devops_docker_uat_name = data.azuredevops_serviceendpoint_azurecr.uat_weu_workload_identity.service_endpoint_name
  # service_endpoint_azure_devops_docker_uat_id   = data.azuredevops_serviceendpoint_azurecr.uat_weu_workload_identity.id
  service_endpoint_azure_uat_id   = data.azuredevops_serviceendpoint_azurerm.azure_uat.id
  service_endpoint_azure_uat_name = data.azuredevops_serviceendpoint_azurerm.azure_dev.service_endpoint_name

  # PROD
  # service_endpoint_azure_devops_docker_prod_name = data.azuredevops_serviceendpoint_azurecr.prod_weu_workload_identity.service_endpoint_name
  # service_endpoint_azure_devops_docker_prod_id   = data.azuredevops_serviceendpoint_azurecr.prod_weu_workload_identity.id
  service_endpoint_azure_prod_id   = data.azuredevops_serviceendpoint_azurerm.azure_prod.id
  service_endpoint_azure_prod_name = data.azuredevops_serviceendpoint_azurerm.azure_dev.service_endpoint_name
}
