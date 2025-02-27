<!-- markdownlint-disable -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.5 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | ~> 1.7 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.116.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 1.7.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.116.0 |
| <a name="provider_azurerm.dev"></a> [azurerm.dev](#provider\_azurerm.dev) | 3.116.0 |
| <a name="provider_azurerm.prod"></a> [azurerm.prod](#provider\_azurerm.prod) | 3.116.0 |
| <a name="provider_azurerm.uat"></a> [azurerm.uat](#provider\_azurerm.uat) | 3.116.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module___devops_v0__"></a> [\_\_devops\_v0\_\_](#module\_\_\_devops\_v0\_\_) | git::https://github.com/pagopa/azuredevops-tf-modules.git | 7e23d73d22e7b37352c25a32cc40f6f42b6569ea |
| <a name="module___v3__"></a> [\_\_v3\_\_](#module\_\_\_v3\_\_) | git::https://github.com/pagopa/terraform-azurerm-v3.git | 087a57940a67444c3b883030c54ceb78562c64ef |
| <a name="module_api-cstar-dev-pagopa-it-cert_az"></a> [api-cstar-dev-pagopa-it-cert\_az](#module\_api-cstar-dev-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_api-cstar-pagopa-it-cert_az"></a> [api-cstar-pagopa-it-cert\_az](#module\_api-cstar-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_api-cstar-uat-pagopa-it-cert_az"></a> [api-cstar-uat-pagopa-it-cert\_az](#module\_api-cstar-uat-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_api-io-cstar-dev-pagopa-it-cert_az"></a> [api-io-cstar-dev-pagopa-it-cert\_az](#module\_api-io-cstar-dev-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_api-io-cstar-pagopa-it-cert_az"></a> [api-io-cstar-pagopa-it-cert\_az](#module\_api-io-cstar-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_api-io-cstar-uat-pagopa-it-cert_az"></a> [api-io-cstar-uat-pagopa-it-cert\_az](#module\_api-io-cstar-uat-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_api_emd_cstar_pagopa_it_cert_az"></a> [api\_emd\_cstar\_pagopa\_it\_cert\_az](#module\_api\_emd\_cstar\_pagopa\_it\_cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_api_emd_dev_cstar_pagopa_it_cert_az"></a> [api\_emd\_dev\_cstar\_pagopa\_it\_cert\_az](#module\_api\_emd\_dev\_cstar\_pagopa\_it\_cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_api_emd_uat_cstar_pagopa_it_cert_az"></a> [api\_emd\_uat\_cstar\_pagopa\_it\_cert\_az](#module\_api\_emd\_uat\_cstar\_pagopa\_it\_cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_dev_appinsights_service_conn_federated"></a> [dev\_appinsights\_service\_conn\_federated](#module\_dev\_appinsights\_service\_conn\_federated) | ./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated | n/a |
| <a name="module_dev_azurerm_service_conn"></a> [dev\_azurerm\_service\_conn](#module\_dev\_azurerm\_service\_conn) | ./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated | n/a |
| <a name="module_dev_cstar_core_tls_cert_service_conn_federated"></a> [dev\_cstar\_core\_tls\_cert\_service\_conn\_federated](#module\_dev\_cstar\_core\_tls\_cert\_service\_conn\_federated) | ./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated | n/a |
| <a name="module_letsencrypt_dev"></a> [letsencrypt\_dev](#module\_letsencrypt\_dev) | ./.terraform/modules/__v3__/letsencrypt_credential | n/a |
| <a name="module_letsencrypt_prod"></a> [letsencrypt\_prod](#module\_letsencrypt\_prod) | ./.terraform/modules/__v3__/letsencrypt_credential | n/a |
| <a name="module_letsencrypt_uat"></a> [letsencrypt\_uat](#module\_letsencrypt\_uat) | ./.terraform/modules/__v3__/letsencrypt_credential | n/a |
| <a name="module_management-cstar-dev-pagopa-it-cert_az"></a> [management-cstar-dev-pagopa-it-cert\_az](#module\_management-cstar-dev-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_management-cstar-pagopa-it-cert_az"></a> [management-cstar-pagopa-it-cert\_az](#module\_management-cstar-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_management-cstar-uat-pagopa-it-cert_az"></a> [management-cstar-uat-pagopa-it-cert\_az](#module\_management-cstar-uat-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_mcshared-cstar-dev-pagopa-it-cert_az"></a> [mcshared-cstar-dev-pagopa-it-cert\_az](#module\_mcshared-cstar-dev-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_mcshared-cstar-pagopa-it-cert_az"></a> [mcshared-cstar-pagopa-it-cert\_az](#module\_mcshared-cstar-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_mcshared-cstar-uat-pagopa-it-cert_az"></a> [mcshared-cstar-uat-pagopa-it-cert\_az](#module\_mcshared-cstar-uat-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_portal-cstar-dev-pagopa-it-cert_az"></a> [portal-cstar-dev-pagopa-it-cert\_az](#module\_portal-cstar-dev-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_portal-cstar-pagopa-it-cert_az"></a> [portal-cstar-pagopa-it-cert\_az](#module\_portal-cstar-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_portal-cstar-uat-pagopa-it-cert_az"></a> [portal-cstar-uat-pagopa-it-cert\_az](#module\_portal-cstar-uat-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_prod_azurerm_service_conn"></a> [prod\_azurerm\_service\_conn](#module\_prod\_azurerm\_service\_conn) | ./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated | n/a |
| <a name="module_prod_cstar_core_tls_cert_service_conn_federated"></a> [prod\_cstar\_core\_tls\_cert\_service\_conn\_federated](#module\_prod\_cstar\_core\_tls\_cert\_service\_conn\_federated) | ./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated | n/a |
| <a name="module_rtp-cstar-dev-pagopa-it-cert_az"></a> [rtp-cstar-dev-pagopa-it-cert\_az](#module\_rtp-cstar-dev-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_rtp-cstar-pagopa-it-cert_az"></a> [rtp-cstar-pagopa-it-cert\_az](#module\_rtp-cstar-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_rtp-cstar-uat-pagopa-it-cert_az"></a> [rtp-cstar-uat-pagopa-it-cert\_az](#module\_rtp-cstar-uat-pagopa-it-cert\_az) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_tls_cert_federated | n/a |
| <a name="module_secret_azdo"></a> [secret\_azdo](#module\_secret\_azdo) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_uat_azurerm_service_conn"></a> [uat\_azurerm\_service\_conn](#module\_uat\_azurerm\_service\_conn) | ./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated | n/a |
| <a name="module_uat_cstar_core_tls_cert_service_conn_federated"></a> [uat\_cstar\_core\_tls\_cert\_service\_conn\_federated](#module\_uat\_cstar\_core\_tls\_cert\_service\_conn\_federated) | ./.terraform/modules/__devops_v0__/azuredevops_serviceendpoint_federated | n/a |

## Resources

| Name | Type |
|------|------|
| [azuredevops_serviceendpoint_github.io-azure-devops-github-pr](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_github) | resource |
| [azuredevops_serviceendpoint_github.io-azure-devops-github-ro](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_github) | resource |
| [azuredevops_serviceendpoint_github.io-azure-devops-github-rw](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_github) | resource |
| [azuredevops_team.external_team](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/team) | resource |
| [azurerm_key_vault_access_policy.DEV-CSTAR-CORE-TLS-CERT-SERVICE-CONN_kv_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.PROD-CSTAR-CORE-TLS-CERT-SERVICE-CONN_kv_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.UAT-CSTAR-CORE-TLS-CERT-SERVICE-CONN_kv_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_role_assignment.appinsights_component_contributor_dev](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.dev_azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.prod_azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.uat_azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azuredevops_project.project](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/project) | data source |
| [azuredevops_serviceendpoint_azurecr.dev_weu_workload_identity](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurecr) | data source |
| [azuredevops_serviceendpoint_azurecr.prod_weu_workload_identity](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurecr) | data source |
| [azuredevops_serviceendpoint_azurecr.uat_weu_workload_identity](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurecr) | data source |
| [azurerm_application_insights.application_insights_dev](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/application_insights) | data source |
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
| <a name="input_api-cstar-dev-pagopa-it"></a> [api-cstar-dev-pagopa-it](#input\_api-cstar-dev-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api",<br/>    "dns_zone_name": "dev.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\DEV",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_api-cstar-pagopa-it"></a> [api-cstar-pagopa-it](#input\_api-cstar-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api",<br/>    "dns_zone_name": "cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\PROD",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_api-cstar-uat-pagopa-it"></a> [api-cstar-uat-pagopa-it](#input\_api-cstar-uat-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api",<br/>    "dns_zone_name": "uat.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\UAT",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_api-io-cstar-dev-pagopa-it"></a> [api-io-cstar-dev-pagopa-it](#input\_api-io-cstar-dev-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-io",<br/>    "dns_zone_name": "dev.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\DEV",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_api-io-cstar-pagopa-it"></a> [api-io-cstar-pagopa-it](#input\_api-io-cstar-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-io",<br/>    "dns_zone_name": "cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\PROD",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_api-io-cstar-uat-pagopa-it"></a> [api-io-cstar-uat-pagopa-it](#input\_api-io-cstar-uat-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-io",<br/>    "dns_zone_name": "uat.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\UAT",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_api_emd_cstar_pagopa_it"></a> [api\_emd\_cstar\_pagopa\_it](#input\_api\_emd\_cstar\_pagopa\_it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-emd",<br/>    "dns_zone_name": "cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\PROD",<br/>    "variables": {},<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_api_emd_dev_cstar_pagopa_it"></a> [api\_emd\_dev\_cstar\_pagopa\_it](#input\_api\_emd\_dev\_cstar\_pagopa\_it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-emd",<br/>    "dns_zone_name": "dev.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\DEV",<br/>    "variables": {},<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_api_emd_uat_cstar_pagopa_it"></a> [api\_emd\_uat\_cstar\_pagopa\_it](#input\_api\_emd\_uat\_cstar\_pagopa\_it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-emd",<br/>    "dns_zone_name": "uat.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\UAT",<br/>    "variables": {},<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_dev_subscription_name"></a> [dev\_subscription\_name](#input\_dev\_subscription\_name) | DEV Subscription name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_management-cstar-dev-pagopa-it"></a> [management-cstar-dev-pagopa-it](#input\_management-cstar-dev-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "management",<br/>    "dns_zone_name": "dev.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\DEV",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/master",<br/>    "name": "le-azure-acme-tiny",<br/>    "organization": "pagopa",<br/>    "pipelines_path": "."<br/>  }<br/>}</pre> | no |
| <a name="input_management-cstar-pagopa-it"></a> [management-cstar-pagopa-it](#input\_management-cstar-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "management",<br/>    "dns_zone_name": "cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\PROD",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/master",<br/>    "name": "le-azure-acme-tiny",<br/>    "organization": "pagopa",<br/>    "pipelines_path": "."<br/>  }<br/>}</pre> | no |
| <a name="input_management-cstar-uat-pagopa-it"></a> [management-cstar-uat-pagopa-it](#input\_management-cstar-uat-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "management",<br/>    "dns_zone_name": "uat.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\UAT",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/master",<br/>    "name": "le-azure-acme-tiny",<br/>    "organization": "pagopa",<br/>    "pipelines_path": "."<br/>  }<br/>}</pre> | no |
| <a name="input_mcshared-cstar-dev-pagopa-it"></a> [mcshared-cstar-dev-pagopa-it](#input\_mcshared-cstar-dev-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-mcshared",<br/>    "dns_zone_name": "dev.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\DEV",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_mcshared-cstar-pagopa-it"></a> [mcshared-cstar-pagopa-it](#input\_mcshared-cstar-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-mcshared",<br/>    "dns_zone_name": "cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\PROD",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_mcshared-cstar-uat-pagopa-it"></a> [mcshared-cstar-uat-pagopa-it](#input\_mcshared-cstar-uat-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-mcshared",<br/>    "dns_zone_name": "uat.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\UAT",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_portal-cstar-dev-pagopa-it"></a> [portal-cstar-dev-pagopa-it](#input\_portal-cstar-dev-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "portal",<br/>    "dns_zone_name": "dev.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\DEV",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/master",<br/>    "name": "le-azure-acme-tiny",<br/>    "organization": "pagopa",<br/>    "pipelines_path": "."<br/>  }<br/>}</pre> | no |
| <a name="input_portal-cstar-pagopa-it"></a> [portal-cstar-pagopa-it](#input\_portal-cstar-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "portal",<br/>    "dns_zone_name": "cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\PROD",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_portal-cstar-uat-pagopa-it"></a> [portal-cstar-uat-pagopa-it](#input\_portal-cstar-uat-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "portal",<br/>    "dns_zone_name": "uat.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\UAT",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_prod_subscription_name"></a> [prod\_subscription\_name](#input\_prod\_subscription\_name) | PROD Subscription name | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name project | `string` | n/a | yes |
| <a name="input_rtp-cstar-dev-pagopa-it"></a> [rtp-cstar-dev-pagopa-it](#input\_rtp-cstar-dev-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-rtp",<br/>    "dns_zone_name": "dev.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\DEV",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_rtp-cstar-pagopa-it"></a> [rtp-cstar-pagopa-it](#input\_rtp-cstar-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-rtp",<br/>    "dns_zone_name": "cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\PROD",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_rtp-cstar-uat-pagopa-it"></a> [rtp-cstar-uat-pagopa-it](#input\_rtp-cstar-uat-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "api-rtp",<br/>    "dns_zone_name": "uat.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\UAT",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  }<br/>}</pre> | no |
| <a name="input_uat_subscription_name"></a> [uat\_subscription\_name](#input\_uat\_subscription\_name) | UAT Subscription name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_endpoint_azure_devops_github_pr_name"></a> [service\_endpoint\_azure\_devops\_github\_pr\_name](#output\_service\_endpoint\_azure\_devops\_github\_pr\_name) | n/a |
| <a name="output_service_endpoint_io_azure_devops_github_pr_id"></a> [service\_endpoint\_io\_azure\_devops\_github\_pr\_id](#output\_service\_endpoint\_io\_azure\_devops\_github\_pr\_id) | Github |
| <a name="output_service_endpoint_io_azure_devops_github_ro_id"></a> [service\_endpoint\_io\_azure\_devops\_github\_ro\_id](#output\_service\_endpoint\_io\_azure\_devops\_github\_ro\_id) | n/a |
| <a name="output_service_endpoint_io_azure_devops_github_ro_name"></a> [service\_endpoint\_io\_azure\_devops\_github\_ro\_name](#output\_service\_endpoint\_io\_azure\_devops\_github\_ro\_name) | n/a |
<!-- END_TF_DOCS -->
