<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | ~> 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.116 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module___devops_v0__"></a> [\_\_devops\_v0\_\_](#module\_\_\_devops\_v0\_\_) | git::https://github.com/pagopa/azuredevops-tf-modules.git | 7e23d73d22e7b37352c25a32cc40f6f42b6569ea |
| <a name="module___v3__"></a> [\_\_v3\_\_](#module\_\_\_v3\_\_) | git::https://github.com/pagopa/terraform-azurerm-v3.git | a88c6d99ec3871db7de57db4280422b02db3e4f0 |
| <a name="module_idpay_dev_secrets"></a> [idpay\_dev\_secrets](#module\_idpay\_dev\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_idpay_fe_deploy"></a> [idpay\_fe\_deploy](#module\_idpay\_fe\_deploy) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic | n/a |
| <a name="module_idpay_prod_secrets"></a> [idpay\_prod\_secrets](#module\_idpay\_prod\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_idpay_uat_secrets"></a> [idpay\_uat\_secrets](#module\_idpay\_uat\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_dev_tls_cert_service_conn"></a> [dev\_tls\_cert\_service\_conn](#module\_dev\_tls\_cert\_service\_conn) | ./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated | n/a |
| <a name="module_federated_cert_pipeline_idpay_dev"></a> [federated\_cert\_pipeline\_idpay\_dev](#module\_federated\_cert\_pipeline\_idpay\_dev) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_federated_cert_pipeline_idpay_prod"></a> [federated\_cert\_pipeline\_idpay\_prod](#module\_federated\_cert\_pipeline\_idpay\_prod) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_federated_cert_pipeline_idpay_uat"></a> [federated\_cert\_pipeline\_idpay\_uat](#module\_federated\_cert\_pipeline\_idpay\_uat) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_federated_cert_pipeline_p4pa_dev"></a> [federated\_cert\_pipeline\_p4pa\_dev](#module\_federated\_cert\_pipeline\_p4pa\_dev) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_federated_cert_pipeline_p4pa_prod"></a> [federated\_cert\_pipeline\_p4pa\_prod](#module\_federated\_cert\_pipeline\_p4pa\_prod) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_federated_cert_pipeline_p4pa_uat"></a> [federated\_cert\_pipeline\_p4pa\_uat](#module\_federated\_cert\_pipeline\_p4pa\_uat) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_letsencrypt_dev"></a> [letsencrypt\_dev](#module\_letsencrypt\_dev) | ./.terraform/modules/__v3__/letsencrypt_credential | n/a |
| <a name="module_letsencrypt_prod"></a> [letsencrypt\_prod](#module\_letsencrypt\_prod) | ./.terraform/modules/__v3__/letsencrypt_credential | n/a |
| <a name="module_letsencrypt_uat"></a> [letsencrypt\_uat](#module\_letsencrypt\_uat) | ./.terraform/modules/__v3__/letsencrypt_credential | n/a |
| <a name="module_p4pa_arc_idpay_aks_deploy"></a> [p4pa\_arc\_idpay\_aks\_deploy](#module\_p4pa\_arc\_idpay\_aks\_deploy) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic | n/a |
| <a name="module_prod_tls_cert_service_conn"></a> [prod\_tls\_cert\_service\_conn](#module\_prod\_tls\_cert\_service\_conn) | ./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated | n/a |
| <a name="module_uat_tls_cert_service_conn"></a> [uat\_tls\_cert\_service\_conn](#module\_uat\_tls\_cert\_service\_conn) | ./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_access_policy.dev_tls_cert_service_conn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.prod_tls_cert_service_conn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.uat_tls_cert_service_conn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azuredevops_group.admin](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/group) | data source |
| [azuredevops_project.this](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/project) | data source |
| [azuredevops_serviceendpoint_azurecr.dev_ita_workload_identity](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurecr) | data source |
| [azuredevops_serviceendpoint_azurecr.prod_ita_workload_identity](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurecr) | data source |
| [azuredevops_serviceendpoint_azurecr.uat_ita_workload_identity](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurecr) | data source |
| [azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurerm) | data source |
| [azuredevops_serviceendpoint_azurerm.dev_tls_cert_service_conn](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurerm) | data source |
| [azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurerm) | data source |
| [azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurerm) | data source |
| [azuredevops_serviceendpoint_github.arc_azure_devops_github_ro](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_github) | data source |
| [azuredevops_serviceendpoint_github.arc_azure_devops_github_rw](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_github) | data source |
| [azuredevops_serviceendpoint_sonarcloud.azure_devops_sonar](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_sonarcloud) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.kv_domain_dev](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault.kv_domain_prod](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault.kv_domain_uat](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_subscriptions.dev](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |
| [azurerm_subscriptions.prod](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |
| [azurerm_subscriptions.uat](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_ita_service_connection_workload_identity_dev"></a> [acr\_ita\_service\_connection\_workload\_identity\_dev](#input\_acr\_ita\_service\_connection\_workload\_identity\_dev) | The service connection ID for the ITA DEV workload identity in Azure Container Registry | `string` | `""` | no |
| <a name="input_acr_ita_service_connection_workload_identity_prod"></a> [acr\_ita\_service\_connection\_workload\_identity\_prod](#input\_acr\_ita\_service\_connection\_workload\_identity\_prod) | The service connection ID for the ITA PROD workload identity in Azure Container Registry | `string` | `""` | no |
| <a name="input_acr_ita_service_connection_workload_identity_uat"></a> [acr\_ita\_service\_connection\_workload\_identity\_uat](#input\_acr\_ita\_service\_connection\_workload\_identity\_uat) | The service connection ID for the ITA UAT workload identity in Azure Container Registry | `string` | `""` | no |
| <a name="input_idpay_fe"></a> [idpay\_fe](#input\_idpay\_fe) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "path": "idpay\\fe"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/main",<br/>    "name": "arc-fe",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": null<br/>  }<br/>}</pre> | no |
| <a name="input_p4pa_arc_idpay_aks_deploy"></a> [p4pa\_arc\_idpay\_aks\_deploy](#input\_p4pa\_arc\_idpay\_aks\_deploy) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "name": "arc-idpay-deploy-aks",<br/>    "path": "argocd\\arc-idpay-deploy-aks"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/main",<br/>    "name": "arc-idpay-deploy-aks",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops"<br/>  }<br/>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
