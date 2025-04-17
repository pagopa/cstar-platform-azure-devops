# #
# # 🟢 DEV - AKS
# #
#
# resource "azuredevops_serviceendpoint_kubernetes" "aks_dev" {
#
#   project_id            = local.devops_project_id
#   service_endpoint_name = local.dev_srv_endpoint_aks_name
#   apiserver_url         = module.idpay_dev_secrets.values["${local.dev_aks_name}-apiserver-url"].value
#   authorization_type    = "ServiceAccount"
#   service_account {
#     # base64 values
#     token   = module.idpay_dev_secrets.values["${local.dev_aks_name}-azure-devops-sa-token"].value
#     ca_cert = module.idpay_dev_secrets.values["${local.dev_aks_name}-azure-devops-sa-cacrt"].value
#   }
# }
#
#
# #
# # 🟨 UAT - AKS
# #
#
# resource "azuredevops_serviceendpoint_kubernetes" "aks_uat" {
#
#   project_id            = local.devops_project_id
#   service_endpoint_name = local.uat_srv_endpoint_aks_name
#   apiserver_url         = module.idpay_uat_secrets.values["${local.uat_aks_name}-apiserver-url"].value
#   authorization_type    = "ServiceAccount"
#   service_account {
#     # base64 values
#     token   = module.idpay_uat_secrets.values["${local.uat_aks_name}-azure-devops-sa-token"].value
#     ca_cert = module.idpay_uat_secrets.values["${local.uat_aks_name}-azure-devops-sa-cacrt"].value
#   }
# }
#
# #
# # 🛑 PROD - AKS
# #
#
# resource "azuredevops_serviceendpoint_kubernetes" "aks_prod" {
#
#   project_id            = local.devops_project_id
#   service_endpoint_name = local.prod_srv_endpoint_aks_name
#   apiserver_url         = module.idpay_prod_secrets.values["${local.prod_aks_name}-apiserver-url"].value
#   authorization_type    = "ServiceAccount"
#   service_account {
#     # base64 values
#     token   = module.idpay_prod_secrets.values["${local.prod_aks_name}-azure-devops-sa-token"].value
#     ca_cert = module.idpay_prod_secrets.values["${local.prod_aks_name}-azure-devops-sa-cacrt"].value
#   }
# }
