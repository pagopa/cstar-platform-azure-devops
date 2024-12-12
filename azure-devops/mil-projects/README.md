<!-- markdownlint-disable -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.5 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | ~> 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.116 |
| <a name="requirement_null"></a> [null](#requirement\_null) | <= 3.2.1 |
| <a name="requirement_time"></a> [time](#requirement\_time) | <= 0.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 1.4.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.0 |
| <a name="provider_azurerm.dev"></a> [azurerm.dev](#provider\_azurerm.dev) | 3.117.0 |
| <a name="provider_azurerm.prod"></a> [azurerm.prod](#provider\_azurerm.prod) | 3.117.0 |
| <a name="provider_azurerm.uat"></a> [azurerm.uat](#provider\_azurerm.uat) | 3.117.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_DEV-CSTAR-MIL-TLS-CERT-SERVICE-CONN-FEDERATED"></a> [DEV-CSTAR-MIL-TLS-CERT-SERVICE-CONN-FEDERATED](#module\_DEV-CSTAR-MIL-TLS-CERT-SERVICE-CONN-FEDERATED) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.0.0 |
| <a name="module_UAT_CSTAR_MIL_TLS_CERT_SERVICE_CONN_FEDERATED"></a> [UAT\_CSTAR\_MIL\_TLS\_CERT\_SERVICE\_CONN\_FEDERATED](#module\_UAT\_CSTAR\_MIL\_TLS\_CERT\_SERVICE\_CONN\_FEDERATED) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.0.0 |
| <a name="module___devops_v0__"></a> [\_\_devops\_v0\_\_](#module\_\_\_devops\_v0\_\_) | git::https://github.com/pagopa/azuredevops-tf-modules.git | 7e23d73d22e7b37352c25a32cc40f6f42b6569ea |
| <a name="module___v3__"></a> [\_\_v3\_\_](#module\_\_\_v3\_\_) | git::https://github.com/pagopa/terraform-azurerm-v3.git | 50f4db15d35bebedc8251139346fd0fac9ac6ca2 |
| <a name="module_domain_dev_secrets"></a> [domain\_dev\_secrets](#module\_domain\_dev\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_domain_uat_secrets"></a> [domain\_uat\_secrets](#module\_domain\_uat\_secrets) | git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query | v8.22.0 |
| <a name="module_emd_functional_test"></a> [emd\_functional\_test](#module\_emd\_functional\_test) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_generic | n/a |
| <a name="module_letsencrypt_dev"></a> [letsencrypt\_dev](#module\_letsencrypt\_dev) | ./.terraform/modules/__v3__/letsencrypt_credential | n/a |
| <a name="module_letsencrypt_uat"></a> [letsencrypt\_uat](#module\_letsencrypt\_uat) | ./.terraform/modules/__v3__/letsencrypt_credential | n/a |
| <a name="module_mil-deploy_deploy"></a> [mil-deploy\_deploy](#module\_mil-deploy\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v9.0.0 |
| <a name="module_secret_azdo"></a> [secret\_azdo](#module\_secret\_azdo) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_tlscert-mil-internal-dev-cstar-pagopa-it-cert_az"></a> [tlscert-mil-internal-dev-cstar-pagopa-it-cert\_az](#module\_tlscert-mil-internal-dev-cstar-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_tlscert_mil_internal_uat_cstar_pagopa_it_cert_az"></a> [tlscert\_mil\_internal\_uat\_cstar\_pagopa\_it\_cert\_az](#module\_tlscert\_mil\_internal\_uat\_cstar\_pagopa\_it\_cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |

## Resources

| Name | Type |
|------|------|
| [azuredevops_serviceendpoint_kubernetes.aks_dev](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_kubernetes) | resource |
| [azuredevops_serviceendpoint_kubernetes.aks_uat](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_kubernetes) | resource |
| [azurerm_key_vault_access_policy.DEV-CSTAR-MIL-TLS-CERT-SERVICE-CONN_kv_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.UAT_CSTAR_MIL_TLS_CERT_SERVICE_CONN_kv_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azuredevops_project.project](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/project) | data source |
| [azuredevops_serviceendpoint_azurecr.dev_weu_workload_identity](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurecr) | data source |
| [azuredevops_serviceendpoint_azurecr.prod_weu_workload_identity](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurecr) | data source |
| [azuredevops_serviceendpoint_azurecr.uat_weu_workload_identity](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurecr) | data source |
| [azuredevops_serviceendpoint_azurerm.azure_dev](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurerm) | data source |
| [azuredevops_serviceendpoint_azurerm.azure_prod](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurerm) | data source |
| [azuredevops_serviceendpoint_azurerm.azure_uat](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurerm) | data source |
| [azuredevops_serviceendpoint_github.io-azure-devops-github-pr](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_github) | data source |
| [azuredevops_serviceendpoint_github.io-azure-devops-github-ro](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_github) | data source |
| [azuredevops_serviceendpoint_sonarcloud.sonar_cloud](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_sonarcloud) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.domain_kv_dev](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault.domain_kv_prod](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault.domain_kv_uat](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_subscriptions.dev](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |
| [azurerm_subscriptions.prod](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |
| [azurerm_subscriptions.uat](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_weu_service_connection_workload_identity_dev"></a> [acr\_weu\_service\_connection\_workload\_identity\_dev](#input\_acr\_weu\_service\_connection\_workload\_identity\_dev) | The service connection ID for the ITA DEV workload identity in Azure Container Registry | `string` | `""` | no |
| <a name="input_acr_weu_service_connection_workload_identity_prod"></a> [acr\_weu\_service\_connection\_workload\_identity\_prod](#input\_acr\_weu\_service\_connection\_workload\_identity\_prod) | The service connection ID for the ITA PROD workload identity in Azure Container Registry | `string` | `""` | no |
| <a name="input_acr_weu_service_connection_workload_identity_uat"></a> [acr\_weu\_service\_connection\_workload\_identity\_uat](#input\_acr\_weu\_service\_connection\_workload\_identity\_uat) | The service connection ID for the ITA UAT workload identity in Azure Container Registry | `string` | `""` | no |
| <a name="input_dev_subscription_name"></a> [dev\_subscription\_name](#input\_dev\_subscription\_name) | DEV Subscription name | `string` | n/a | yes |
| <a name="input_emd_functional_test"></a> [emd\_functional\_test](#input\_emd\_functional\_test) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "path": "mil"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/main",<br/>    "name": "emd-functional-testing",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": null<br/>  }<br/>}</pre> | no |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | n/a | `string` | n/a | yes |
| <a name="input_mil-deploy"></a> [mil-deploy](#input\_mil-deploy) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "mil"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/main",<br/>    "name": "mil-aks-deploy",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": null<br/>  }<br/>}</pre> | no |
| <a name="input_prod_subscription_name"></a> [prod\_subscription\_name](#input\_prod\_subscription\_name) | PROD Subscription name | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name (e.g. pagoPA platform) | `string` | n/a | yes |
| <a name="input_service_endpoint_azure_dev_name"></a> [service\_endpoint\_azure\_dev\_name](#input\_service\_endpoint\_azure\_dev\_name) | azure service endpoint name for dev | `string` | n/a | yes |
| <a name="input_service_endpoint_azure_prod_name"></a> [service\_endpoint\_azure\_prod\_name](#input\_service\_endpoint\_azure\_prod\_name) | azure service endpoint name for prod | `string` | n/a | yes |
| <a name="input_service_endpoint_azure_uat_name"></a> [service\_endpoint\_azure\_uat\_name](#input\_service\_endpoint\_azure\_uat\_name) | azure service endpoint name for uat | `string` | n/a | yes |
| <a name="input_tlscert-mil-internal-dev-cstar-pagopa-it"></a> [tlscert-mil-internal-dev-cstar-pagopa-it](#input\_tlscert-mil-internal-dev-cstar-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "mil.weu.internal",<br/>    "dns_zone_name": "dev.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\DEV",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/master",<br/>    "name": "le-azure-acme-tiny",<br/>    "organization": "pagopa",<br/>    "pipelines_path": "."<br/>  }<br/>}</pre> | no |
| <a name="input_tlscert-mil-internal-uat-cstar-pagopa-it"></a> [tlscert-mil-internal-uat-cstar-pagopa-it](#input\_tlscert-mil-internal-uat-cstar-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "mil.weu.internal",<br/>    "dns_zone_name": "uat.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\UAT",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/master",<br/>    "name": "le-azure-acme-tiny",<br/>    "organization": "pagopa",<br/>    "pipelines_path": "."<br/>  }<br/>}</pre> | no |
| <a name="input_uat_subscription_name"></a> [uat\_subscription\_name](#input\_uat\_subscription\_name) | UAT Subscription name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
