<!-- markdownlint-disable -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.5 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.51 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) |  ~> 1.4.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.117.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 1.4.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_DEV-AZURERM-IAC-PLAN-SERVICE-CONN"></a> [DEV-AZURERM-IAC-PLAN-SERVICE-CONN](#module\_DEV-AZURERM-IAC-PLAN-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module_DEV-AZURERM-SERVICE-CONN"></a> [DEV-AZURERM-SERVICE-CONN](#module\_DEV-AZURERM-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module_DEV-CSTAR-PLAN-SERVICE-CONN"></a> [DEV-CSTAR-PLAN-SERVICE-CONN](#module\_DEV-CSTAR-PLAN-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan | v9.2.1 |
| <a name="module_PROD-AZURERM-IAC-PLAN-SERVICE-CONN"></a> [PROD-AZURERM-IAC-PLAN-SERVICE-CONN](#module\_PROD-AZURERM-IAC-PLAN-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module_PROD-AZURERM-SERVICE-CONN"></a> [PROD-AZURERM-SERVICE-CONN](#module\_PROD-AZURERM-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module_PROD-CSTAR-PLAN-SERVICE-CONN"></a> [PROD-CSTAR-PLAN-SERVICE-CONN](#module\_PROD-CSTAR-PLAN-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan | v9.2.1 |
| <a name="module_UAT-AZURERM-IAC-PLAN-SERVICE-CONN"></a> [UAT-AZURERM-IAC-PLAN-SERVICE-CONN](#module\_UAT-AZURERM-IAC-PLAN-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module_UAT-AZURERM-SERVICE-CONN"></a> [UAT-AZURERM-SERVICE-CONN](#module\_UAT-AZURERM-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module_UAT-CSTAR-PLAN-SERVICE-CONN"></a> [UAT-CSTAR-PLAN-SERVICE-CONN](#module\_UAT-CSTAR-PLAN-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_azurerm_plan | v9.2.1 |
| <a name="module___azdo__"></a> [\_\_azdo\_\_](#module\_\_\_azdo\_\_) | git::https://github.com/pagopa/azuredevops-tf-modules.git | 7e23d73d22e7b37352c25a32cc40f6f42b6569ea |
| <a name="module___v3__"></a> [\_\_v3\_\_](#module\_\_\_v3\_\_) | git::https://github.com/pagopa/terraform-azurerm-v3.git | 7dbbc06d591d3ce66536a7bdb2208b1370de04dd |
| <a name="module_apim_backup"></a> [apim\_backup](#module\_apim\_backup) | ./.terraform/modules/__azdo__/azuredevops_build_definition_deploy | n/a |
| <a name="module_idpay_dev_secrets"></a> [idpay\_dev\_secrets](#module\_idpay\_dev\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_idpay_prod_secrets"></a> [idpay\_prod\_secrets](#module\_idpay\_prod\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_idpay_uat_secrets"></a> [idpay\_uat\_secrets](#module\_idpay\_uat\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_resource_switcher"></a> [resource\_switcher](#module\_resource\_switcher) | ./.terraform/modules/__azdo__/azuredevops_build_definition_resource_switcher | n/a |
| <a name="module_rtd_dev_secrets"></a> [rtd\_dev\_secrets](#module\_rtd\_dev\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_rtd_prod_secrets"></a> [rtd\_prod\_secrets](#module\_rtd\_prod\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_rtd_uat_secrets"></a> [rtd\_uat\_secrets](#module\_rtd\_uat\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_rtp_dev_secrets"></a> [rtp\_dev\_secrets](#module\_rtp\_dev\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_rtp_prod_secrets"></a> [rtp\_prod\_secrets](#module\_rtp\_prod\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_rtp_uat_secrets"></a> [rtp\_uat\_secrets](#module\_rtp\_uat\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_secret_azdo"></a> [secret\_azdo](#module\_secret\_azdo) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_tae_dev_secrets"></a> [tae\_dev\_secrets](#module\_tae\_dev\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_tae_uat_secrets"></a> [tae\_uat\_secrets](#module\_tae\_uat\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |

## Resources

| Name | Type |
|------|------|
| [azuredevops_serviceendpoint_azurerm.DEV-CSTAR](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_azurerm) | resource |
| [azuredevops_serviceendpoint_azurerm.PROD-CSTAR](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_azurerm) | resource |
| [azuredevops_serviceendpoint_azurerm.UAT-CSTAR](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_azurerm) | resource |
| [azuredevops_serviceendpoint_github.io-azure-devops-github-pr](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_github) | resource |
| [azuredevops_serviceendpoint_github.io-azure-devops-github-ro](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_github) | resource |
| [azuredevops_serviceendpoint_github.io-azure-devops-github-rw](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_github) | resource |
| [azuredevops_team.external_team](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/team) | resource |
| [azurerm_role_assignment.dev_azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.dev_plan_permissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.prod_azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.prod_plan_permissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.uat_azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.uat_plan_permissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azuredevops_project.project](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/project) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscriptions.dev](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |
| [azurerm_subscriptions.prod](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |
| [azurerm_subscriptions.uat](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_dev_platform_name"></a> [aks\_dev\_platform\_name](#input\_aks\_dev\_platform\_name) | AKS DEV platform name | `string` | n/a | yes |
| <a name="input_aks_prod_platform_name"></a> [aks\_prod\_platform\_name](#input\_aks\_prod\_platform\_name) | AKS PROD platform name | `string` | n/a | yes |
| <a name="input_aks_uat_platform_name"></a> [aks\_uat\_platform\_name](#input\_aks\_uat\_platform\_name) | AKS UAT platform name | `string` | n/a | yes |
| <a name="input_apim_backup"></a> [apim\_backup](#input\_apim\_backup) | n/a | `map` | <pre>{<br/>  "repository": {<br/>    "branch_name": "refs/heads/main",<br/>    "name": "cstar-infrastructure",<br/>    "organization": "pagopa",<br/>    "pipelines_path": ".devops",<br/>    "yml_prefix_name": "backup-apim"<br/>  }<br/>}</pre> | no |
| <a name="input_dev_subscription_name"></a> [dev\_subscription\_name](#input\_dev\_subscription\_name) | DEV Subscription name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_prod_subscription_name"></a> [prod\_subscription\_name](#input\_prod\_subscription\_name) | PROD Subscription name | `string` | n/a | yes |
| <a name="input_project_iac_name"></a> [project\_iac\_name](#input\_project\_iac\_name) | Project name for IaC projects | `string` | n/a | yes |
| <a name="input_switcher_iac"></a> [switcher\_iac](#input\_switcher\_iac) | n/a | `map` | <pre>{<br/>  "pipeline": {<br/>    "enable": true,<br/>    "path": "switcher"<br/>  },<br/>  "repository": {<br/>    "branch_name": "refs/heads/main",<br/>    "name": "eng-common-scripts",<br/>    "organization": "pagopa",<br/>    "pipelines_path": "devops",<br/>    "yml_prefix_name": null<br/>  }<br/>}</pre> | no |
| <a name="input_uat_subscription_name"></a> [uat\_subscription\_name](#input\_uat\_subscription\_name) | UAT Subscription name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
