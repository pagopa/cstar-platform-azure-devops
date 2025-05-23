<!-- markdownlint-disable -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.5 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | <= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | <= 3.116.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 0.11.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.71.0 |
| <a name="provider_azurerm.dev"></a> [azurerm.dev](#provider\_azurerm.dev) | 3.71.0 |
| <a name="provider_azurerm.prod"></a> [azurerm.prod](#provider\_azurerm.prod) | 3.71.0 |
| <a name="provider_azurerm.uat"></a> [azurerm.uat](#provider\_azurerm.uat) | 3.71.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_DEV-CSTAR-RTD-TLS-CERT-SERVICE-CONN-FEDERATED"></a> [DEV-CSTAR-RTD-TLS-CERT-SERVICE-CONN-FEDERATED](#module\_DEV-CSTAR-RTD-TLS-CERT-SERVICE-CONN-FEDERATED) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v5.4.0 |
| <a name="module_PROD-CSTAR-RTD-TLS-CERT-SERVICE-CONN-FEDERATED"></a> [PROD-CSTAR-RTD-TLS-CERT-SERVICE-CONN-FEDERATED](#module\_PROD-CSTAR-RTD-TLS-CERT-SERVICE-CONN-FEDERATED) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v5.4.0 |
| <a name="module_UAT-CSTAR-RTD-TLS-CERT-SERVICE-CONN-FEDERATED"></a> [UAT-CSTAR-RTD-TLS-CERT-SERVICE-CONN-FEDERATED](#module\_UAT-CSTAR-RTD-TLS-CERT-SERVICE-CONN-FEDERATED) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v5.4.0 |
| <a name="module_cstar-aks-cert-mounter_deploy"></a> [cstar-aks-cert-mounter\_deploy](#module\_cstar-aks-cert-mounter\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_cstar-io-mock_code_review"></a> [cstar-io-mock\_code\_review](#module\_cstar-io-mock\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.5.0 |
| <a name="module_cstar-io-mock_deploy"></a> [cstar-io-mock\_deploy](#module\_cstar-io-mock\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_domain_dev_secrets"></a> [domain\_dev\_secrets](#module\_domain\_dev\_secrets) | git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query | v7.47.2 |
| <a name="module_domain_prod_secrets"></a> [domain\_prod\_secrets](#module\_domain\_prod\_secrets) | git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query | v7.47.2 |
| <a name="module_domain_uat_secrets"></a> [domain\_uat\_secrets](#module\_domain\_uat\_secrets) | git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query | v7.47.2 |
| <a name="module_idpay-lolab-payment_code_review"></a> [idpay-lolab-payment\_code\_review](#module\_idpay-lolab-payment\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.4.0 |
| <a name="module_idpay-lolab-payment_deploy"></a> [idpay-lolab-payment\_deploy](#module\_idpay-lolab-payment\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_letsencrypt_dev"></a> [letsencrypt\_dev](#module\_letsencrypt\_dev) | git::https://github.com/pagopa/terraform-azurerm-v3.git//letsencrypt_credential | v7.47.2 |
| <a name="module_letsencrypt_prod"></a> [letsencrypt\_prod](#module\_letsencrypt\_prod) | git::https://github.com/pagopa/terraform-azurerm-v3.git//letsencrypt_credential | v7.47.2 |
| <a name="module_letsencrypt_uat"></a> [letsencrypt\_uat](#module\_letsencrypt\_uat) | git::https://github.com/pagopa/terraform-azurerm-v3.git//letsencrypt_credential | v7.47.2 |
| <a name="module_rtd-ms-alternative-gateway_code_review"></a> [rtd-ms-alternative-gateway\_code\_review](#module\_rtd-ms-alternative-gateway\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.4.0 |
| <a name="module_rtd-ms-alternative-gateway_deploy"></a> [rtd-ms-alternative-gateway\_deploy](#module\_rtd-ms-alternative-gateway\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_rtd-ms-decrypter_code_review"></a> [rtd-ms-decrypter\_code\_review](#module\_rtd-ms-decrypter\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.4.0 |
| <a name="module_rtd-ms-decrypter_deploy"></a> [rtd-ms-decrypter\_deploy](#module\_rtd-ms-decrypter\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_rtd-ms-enrolled-payment-instrument_code_review"></a> [rtd-ms-enrolled-payment-instrument\_code\_review](#module\_rtd-ms-enrolled-payment-instrument\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.4.0 |
| <a name="module_rtd-ms-enrolled-payment-instrument_deploy"></a> [rtd-ms-enrolled-payment-instrument\_deploy](#module\_rtd-ms-enrolled-payment-instrument\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_rtd-ms-exporter_code_review"></a> [rtd-ms-exporter\_code\_review](#module\_rtd-ms-exporter\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.4.0 |
| <a name="module_rtd-ms-exporter_deploy"></a> [rtd-ms-exporter\_deploy](#module\_rtd-ms-exporter\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_rtd-ms-file-register_code_review"></a> [rtd-ms-file-register\_code\_review](#module\_rtd-ms-file-register\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.4.0 |
| <a name="module_rtd-ms-file-register_deploy"></a> [rtd-ms-file-register\_deploy](#module\_rtd-ms-file-register\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_rtd-ms-file-reporter_code_review"></a> [rtd-ms-file-reporter\_code\_review](#module\_rtd-ms-file-reporter\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.4.0 |
| <a name="module_rtd-ms-file-reporter_deploy"></a> [rtd-ms-file-reporter\_deploy](#module\_rtd-ms-file-reporter\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_rtd-ms-ingestor_code_review"></a> [rtd-ms-ingestor\_code\_review](#module\_rtd-ms-ingestor\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.4.0 |
| <a name="module_rtd-ms-ingestor_deploy"></a> [rtd-ms-ingestor\_deploy](#module\_rtd-ms-ingestor\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_rtd-ms-payment-instrument_code_review"></a> [rtd-ms-payment-instrument\_code\_review](#module\_rtd-ms-payment-instrument\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.4.0 |
| <a name="module_rtd-ms-payment-instrument_deploy"></a> [rtd-ms-payment-instrument\_deploy](#module\_rtd-ms-payment-instrument\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_rtd-ms-pi-event-processor_code_review"></a> [rtd-ms-pi-event-processor\_code\_review](#module\_rtd-ms-pi-event-processor\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.4.0 |
| <a name="module_rtd-ms-pi-event-processor_deploy"></a> [rtd-ms-pi-event-processor\_deploy](#module\_rtd-ms-pi-event-processor\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_rtd-ms-sender-auth_code_review"></a> [rtd-ms-sender-auth\_code\_review](#module\_rtd-ms-sender-auth\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review | v5.4.0 |
| <a name="module_rtd-ms-sender-auth_deploy"></a> [rtd-ms-sender-auth\_deploy](#module\_rtd-ms-sender-auth\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy | v5.4.0 |
| <a name="module_secret_azdo"></a> [secret\_azdo](#module\_secret\_azdo) | git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault_secrets_query | v7.47.2 |
| <a name="module_tlscert-dev01-rtd-internal-dev-cstar-pagopa-it-cert_az"></a> [tlscert-dev01-rtd-internal-dev-cstar-pagopa-it-cert\_az](#module\_tlscert-dev01-rtd-internal-dev-cstar-pagopa-it-cert\_az) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_tls_cert_federated | v5.4.0 |
| <a name="module_tlscert-prod01-rtd-internal-cstar-pagopa-it-cert_az"></a> [tlscert-prod01-rtd-internal-cstar-pagopa-it-cert\_az](#module\_tlscert-prod01-rtd-internal-cstar-pagopa-it-cert\_az) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_tls_cert_federated | v5.4.0 |
| <a name="module_tlscert-uat01-rtd-internal-uat-cstar-pagopa-it-cert_az"></a> [tlscert-uat01-rtd-internal-uat-cstar-pagopa-it-cert\_az](#module\_tlscert-uat01-rtd-internal-uat-cstar-pagopa-it-cert\_az) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_tls_cert_federated | v5.4.0 |

## Resources

| Name | Type |
|------|------|
| [azuredevops_serviceendpoint_kubernetes.aks_dev](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_kubernetes) | resource |
| [azuredevops_serviceendpoint_kubernetes.aks_prod](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_kubernetes) | resource |
| [azuredevops_serviceendpoint_kubernetes.aks_uat](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_kubernetes) | resource |
| [azurerm_key_vault_access_policy.DEV-CSTAR-RTD-TLS-CERT-SERVICE-CONN_kv_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.PROD-CSTAR-RTD-TLS-CERT-SERVICE-CONN_kv_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.UAT-CSTAR-RTD-TLS-CERT-SERVICE-CONN_kv_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
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
| <a name="input_cstar-aks-cert-mounter"></a> [cstar-aks-cert-mounter](#input\_cstar-aks-cert-mounter) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\cstar-aks-cert-mounter"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/main",<br/>    "name": "cstar-aks-cert-mounter",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_cstar-io-mock"></a> [cstar-io-mock](#input\_cstar-io-mock) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\io-mock"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/main",<br/>    "name": "cstar-io-mock",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar"<br/>  }<br/>}</pre> | no |
| <a name="input_dev_subscription_name"></a> [dev\_subscription\_name](#input\_dev\_subscription\_name) | DEV Subscription name | `string` | n/a | yes |
| <a name="input_idpay-lolab-payment"></a> [idpay-lolab-payment](#input\_idpay-lolab-payment) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\idpay-lolab-payment"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/main",<br/>    "name": "idpay-lolab-payment",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar-rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_prod_subscription_name"></a> [prod\_subscription\_name](#input\_prod\_subscription\_name) | PROD Subscription name | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name (e.g. pagoPA platform) | `string` | n/a | yes |
| <a name="input_rtd-ms-alternative-gateway"></a> [rtd-ms-alternative-gateway](#input\_rtd-ms-alternative-gateway) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\rtd-ms-alternative-gateway"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/develop",<br/>    "name": "rtd-ms-alternative-gateway",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar-rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_rtd-ms-decrypter"></a> [rtd-ms-decrypter](#input\_rtd-ms-decrypter) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\rtd-ms-decrypter"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/develop",<br/>    "name": "rtd-ms-decrypter",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar-rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_rtd-ms-enrolled-payment-instrument"></a> [rtd-ms-enrolled-payment-instrument](#input\_rtd-ms-enrolled-payment-instrument) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\rtd-ms-enrolled-payment-instrument"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/develop",<br/>    "name": "rtd-ms-enrolled-payment-instrument",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar-rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_rtd-ms-exporter"></a> [rtd-ms-exporter](#input\_rtd-ms-exporter) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\rtd-ms-exporter"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/develop",<br/>    "name": "rtd-ms-exporter",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar-rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_rtd-ms-file-register"></a> [rtd-ms-file-register](#input\_rtd-ms-file-register) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\rtd-ms-file-register"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/develop",<br/>    "name": "rtd-ms-file-register",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar-rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_rtd-ms-file-reporter"></a> [rtd-ms-file-reporter](#input\_rtd-ms-file-reporter) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\rtd-ms-file-reporter"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/develop",<br/>    "name": "rtd-ms-file-reporter",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar-rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_rtd-ms-ingestor"></a> [rtd-ms-ingestor](#input\_rtd-ms-ingestor) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\rtd-ms-ingestor"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/develop",<br/>    "name": "rtd-ms-ingestor",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar-rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_rtd-ms-payment-instrument"></a> [rtd-ms-payment-instrument](#input\_rtd-ms-payment-instrument) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\rtd-ms-payment-instrument"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/develop",<br/>    "name": "rtd-ms-payment-instrument",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar-rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_rtd-ms-pi-event-processor"></a> [rtd-ms-pi-event-processor](#input\_rtd-ms-pi-event-processor) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\rtd-ms-pi-event-processor"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/develop",<br/>    "name": "rtd-ms-pi-event-processor",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar-rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_rtd-ms-sender-auth"></a> [rtd-ms-sender-auth](#input\_rtd-ms-sender-auth) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable_code_review": true,<br/>    "enable_deploy": true,<br/>    "path": "rtd\\rtd-ms-sender-auth"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/develop",<br/>    "name": "rtd-ms-sender-auth",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "cstar-rtd"<br/>  }<br/>}</pre> | no |
| <a name="input_service_endpoint_azure_dev_name"></a> [service\_endpoint\_azure\_dev\_name](#input\_service\_endpoint\_azure\_dev\_name) | azure service endpoint name for dev | `string` | n/a | yes |
| <a name="input_service_endpoint_azure_prod_name"></a> [service\_endpoint\_azure\_prod\_name](#input\_service\_endpoint\_azure\_prod\_name) | azure service endpoint name for prod | `string` | n/a | yes |
| <a name="input_service_endpoint_azure_uat_name"></a> [service\_endpoint\_azure\_uat\_name](#input\_service\_endpoint\_azure\_uat\_name) | azure service endpoint name for uat | `string` | n/a | yes |
| <a name="input_tlscert-dev01-rtd-internal-dev-cstar-pagopa-it"></a> [tlscert-dev01-rtd-internal-dev-cstar-pagopa-it](#input\_tlscert-dev01-rtd-internal-dev-cstar-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "dev01.rtd.internal",<br/>    "dns_zone_name": "dev.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\DEV",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/master",<br/>    "name": "le-azure-acme-tiny",<br/>    "organization": "pagopa",<br/>    "pipelines_path": "."<br/>  }<br/>}</pre> | no |
| <a name="input_tlscert-prod01-rtd-internal-cstar-pagopa-it"></a> [tlscert-prod01-rtd-internal-cstar-pagopa-it](#input\_tlscert-prod01-rtd-internal-cstar-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "prod01.rtd.internal",<br/>    "dns_zone_name": "cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\PROD",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/master",<br/>    "name": "le-azure-acme-tiny",<br/>    "organization": "pagopa",<br/>    "pipelines_path": "."<br/>  }<br/>}</pre> | no |
| <a name="input_tlscert-uat01-rtd-internal-uat-cstar-pagopa-it"></a> [tlscert-uat01-rtd-internal-uat-cstar-pagopa-it](#input\_tlscert-uat01-rtd-internal-uat-cstar-pagopa-it) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "dns_record_name": "uat01.rtd.internal",<br/>    "dns_zone_name": "uat.cstar.pagopa.it",<br/>    "enable_tls_cert": true,<br/>    "path": "TLS-Certificates\\UAT",<br/>    "variables": {<br/>      "CERT_NAME_EXPIRE_SECONDS": "2592000"<br/>    },<br/>    "variables_secret": {}<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/master",<br/>    "name": "le-azure-acme-tiny",<br/>    "organization": "pagopa",<br/>    "pipelines_path": "."<br/>  }<br/>}</pre> | no |
| <a name="input_uat_subscription_name"></a> [uat\_subscription\_name](#input\_uat\_subscription\_name) | UAT Subscription name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
