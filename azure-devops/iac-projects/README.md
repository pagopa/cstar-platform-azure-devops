# IaC pipeline definition

This module defines the iac pipelines (code review and deploy)

The creation of pipeline definition is based on a configuration structure defined in `99_locals.tf` described below

```hcl
domains =  [
    {
      name: "payhub",
      envs: ["d"],
      kv_name: "p4pa-%s-payhub-kv",
      rg_name: "p4pa-%s-itn-payhub-sec-rg",
      code_review: true,
      deploy: true,
      pipeline_prefix: "payhub-infra",
      pipeline_path: "payhub-infrastructure",
      repository: {
        yml_prefix_name: "payhub"
        branch_name     = "azdo-iac-pipelines"
      }
    },
  ]

  domain_variables = {
    payhub = {
      iac_variables_cr: {},
      iac_variables_secrets_cr: {},
      iac_variables_deploy: {},
      iac_variables_secrets_deploy: {}
    }
  }
```

## domains
The `domains` section defines the domains for which the pipelines definitions have to be created:

- **name**: name of the domain
- **envs**: list of environments (initials) in which the domain resource are available {`d`, `u`, `p`}. Used to avoid failures when a domain keyvault has not been created on a certain environment
- **kv_name**: name of the domain keyvault. must contain the placeholder string `%s` in place of the environment; will be resolved at run time
- **rg_name**: resource group name of the domain keyvault. must contain the placeholder string `%s` in place of the environment; will be resolved at run time
- **code_review**: if true, enables the creation of the code review pipeline
- **deploy**: if true, enables the creation of the deploy pipeline
- **pipeline_prefix**: prefix assigned to the pipelines being created
- **pipeline_path**: AZDO folder path in which the pipelines will be created
- **repository**: overrides the default respository defined in `04_iac.tf`
  - **yml_prefix_name**: REQUIRED. prefix used to identify this domain `yaml` files.
    the default repository configuration is the following:
```hcl
default_repository = {
    organization    = "pagopa"
    name            = "p4pa-infra"
    branch_name     = "refs/heads/main"
    pipelines_path  = ".devops"
  }
```
any field can be overwritten in the `repository` field

To create pipelines for a new domain simply add the domain configuration to the list and apply the terraform configuration

## domain_variables

If a domain requires additional variables, they can be defined using the `domain_variables` structure; it allows defining different variables and secrets for the code review (`cr`) and deploy pipelines

the structure is the following:

- **<domain_name>**: matches the domain name defined in `domains`
  - **iac_variables_cr**: variables for code review
  - **iac_variables_secrets_cr**: secrets for code review
  - **iac_variables_deploy**: variables for deploy
  - **iac_variables_secrets_deploy**: secrets for deploy<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.5 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | ~> 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.116 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_DEV-AZURERM-IAC-DEPLOY-SERVICE-CONN"></a> [DEV-AZURERM-IAC-DEPLOY-SERVICE-CONN](#module\_DEV-AZURERM-IAC-DEPLOY-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module_DEV-AZURERM-IAC-PLAN-SERVICE-CONN"></a> [DEV-AZURERM-IAC-PLAN-SERVICE-CONN](#module\_DEV-AZURERM-IAC-PLAN-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module_PROD-AZURERM-IAC-DEPLOY-SERVICE-CONN"></a> [PROD-AZURERM-IAC-DEPLOY-SERVICE-CONN](#module\_PROD-AZURERM-IAC-DEPLOY-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module_PROD-AZURERM-IAC-PLAN-SERVICE-CONN"></a> [PROD-AZURERM-IAC-PLAN-SERVICE-CONN](#module\_PROD-AZURERM-IAC-PLAN-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module_UAT-AZURERM-IAC-DEPLOY-SERVICE-CONN"></a> [UAT-AZURERM-IAC-DEPLOY-SERVICE-CONN](#module\_UAT-AZURERM-IAC-DEPLOY-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module_UAT-AZURERM-IAC-PLAN-SERVICE-CONN"></a> [UAT-AZURERM-IAC-PLAN-SERVICE-CONN](#module\_UAT-AZURERM-IAC-PLAN-SERVICE-CONN) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_serviceendpoint_federated | v9.2.1 |
| <a name="module___devops_v0__"></a> [\_\_devops\_v0\_\_](#module\_\_\_devops\_v0\_\_) | git::https://github.com/pagopa/azuredevops-tf-modules.git | 7e23d73d22e7b37352c25a32cc40f6f42b6569ea |
| <a name="module___v3__"></a> [\_\_v3\_\_](#module\_\_\_v3\_\_) | git::https://github.com/pagopa/terraform-azurerm-v3.git | 7a8d091d5a2f90ace30521af79e94fdc02afc1f6 |
| <a name="module_dev_secrets"></a> [dev\_secrets](#module\_dev\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_iac_code_review"></a> [iac\_code\_review](#module\_iac\_code\_review) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_code_review | n/a |
| <a name="module_iac_deploy"></a> [iac\_deploy](#module\_iac\_deploy) | ./.terraform/modules/__devops_v0__/azuredevops_build_definition_deploy | n/a |
| <a name="module_prod_secrets"></a> [prod\_secrets](#module\_prod\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_secrets"></a> [secrets](#module\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |
| <a name="module_uat_secrets"></a> [uat\_secrets](#module\_uat\_secrets) | ./.terraform/modules/__v3__/key_vault_secrets_query | n/a |

## Resources

| Name | Type |
|------|------|
| [azuredevops_environment.environments](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/environment) | resource |
| [azuredevops_project_features.project_features](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/project_features) | resource |
| [azuredevops_serviceendpoint_github.azure-devops-github-pr](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_github) | resource |
| [azuredevops_serviceendpoint_github.azure-devops-github-ro](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_github) | resource |
| [azuredevops_serviceendpoint_github.azure-devops-github-rw](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_github) | resource |
| [azurerm_role_assignment.dev_apply_permissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.dev_plan_permissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.prod_apply_permissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.prod_plan_permissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.uat_apply_permissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.uat_plan_permissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azuredevops_project.project](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/project) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscriptions.dev](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |
| [azurerm_subscriptions.prod](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |
| [azurerm_subscriptions.uat](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_pipeline_environments"></a> [pipeline\_environments](#input\_pipeline\_environments) | List of environments pipeline to create | `list(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
