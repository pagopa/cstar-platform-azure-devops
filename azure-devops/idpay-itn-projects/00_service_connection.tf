# #
# # SONAR CLOUD
# #

# data "azuredevops_serviceendpoint_sonarcloud" "azure_devops_sonar" {
#   project_id            = local.devops_project_id
#   service_endpoint_name = "SONARCLOUD-SERVICE-CONN"
# }

# #
# # GITHUB
# #
# data "azuredevops_serviceendpoint_github" "arc_azure_devops_github_rw" {
#   project_id            = local.devops_project_id
#   service_endpoint_name = "arc-azure-devops-github-rw"
# }

# data "azuredevops_serviceendpoint_github" "arc_azure_devops_github_ro" {
#   project_id            = local.devops_project_id
#   service_endpoint_name = "arc-azure-devops-github-ro"
# }

# #
# # SERVICE CONNECTION DEV
# #
# data "azuredevops_serviceendpoint_azurerm" "dev_azurerm_service_conn" {
#   project_id            = local.devops_project_id
#   service_endpoint_name = "${data.azurerm_subscriptions.dev.subscriptions[0].display_name}-AZURE-SERVICE-CONN"
# }

# data "azuredevops_serviceendpoint_azurerm" "dev_tls_cert_service_conn" {
#   project_id            = local.devops_project_id
#   service_endpoint_name = upper("${local.prefix}-core-d-azdo-tls-cert-kv-policy-service-conn")
# }

# data "azuredevops_serviceendpoint_azurecr" "dev_ita_workload_identity" {
#   project_id            = data.azuredevops_project.this.id
#   service_endpoint_name = var.acr_ita_service_connection_workload_identity_dev
# }

# #
# # SERVICE CONNECTION UAT
# #

# data "azuredevops_serviceendpoint_azurerm" "uat_azurerm_service_conn" {
#   project_id            = local.devops_project_id
#   service_endpoint_name = "${data.azurerm_subscriptions.uat.subscriptions[0].display_name}-AZURE-SERVICE-CONN"
# }

# data "azuredevops_serviceendpoint_azurecr" "uat_ita_workload_identity" {
#   project_id            = data.azuredevops_project.this.id
#   service_endpoint_name = var.acr_ita_service_connection_workload_identity_uat
# }

# #
# # SERVICE CONNECTION PROD
# #

# data "azuredevops_serviceendpoint_azurerm" "prod_azurerm_service_conn" {
#   project_id            = local.devops_project_id
#   service_endpoint_name = "${data.azurerm_subscriptions.prod.subscriptions[0].display_name}-AZURE-SERVICE-CONN"
# }

# data "azuredevops_serviceendpoint_azurecr" "prod_ita_workload_identity" {
#   project_id            = data.azuredevops_project.this.id
#   service_endpoint_name = var.acr_ita_service_connection_workload_identity_prod
# }
