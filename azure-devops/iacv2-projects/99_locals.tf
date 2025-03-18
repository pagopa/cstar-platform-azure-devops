locals {
  prefix         = "cstar"
  location_short = "weu"

  dev_subscription_name  = "dev-${local.prefix}"
  uat_subscription_name  = "uat-${local.prefix}"
  prod_subscription_name = "prod-${local.prefix}"

  dev_identity_rg_name  = "${local.prefix}-d-identity-rg"
  uat_identity_rg_name  = "${local.prefix}-u-identity-rg"
  prod_identity_rg_name = "${local.prefix}-p-identity-rg"

  prod_key_vault_azdo_resource_group = "${local.prefix}-p-sec-rg"
  prod_key_vault_azdo_name           = "${local.prefix}-p-azdo-${local.location_short}-kv"

  # Service connections/ End points
  srv_endpoint_github_ro = "azure-devops-github-ro"
  srv_endpoint_github_rw = "azure-devops-github-rw"
  srv_endpoint_github_pr = "azure-devops-github-pr"

  aks_dev_platform_name  = "${local.prefix}-d-weu-dev01-aks"
  aks_uat_platform_name  = "${local.prefix}-u-weu-uat01-aks"
  aks_prod_platform_name = "${local.prefix}-p-weu-prod01-aks"

  domains = [
    {
      name : "mil",
      envs : ["d", "u", "p"],
      kv_name : "cstar-%s-weu-mil-kv",
      rg_name : "cstar-%s-weu-mil-sec-rg",
      code_review : true,
      deploy : true,
      pipeline_prefix : "mil-infra",
      pipeline_path : "mil-infrastructure",
      repository : {
        yml_prefix_name : "mil"
      }
    },
    {
      name : "rtp",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "rtp-infra",
      pipeline_path : "rtp-infrastructure",
      repository : {
        yml_prefix_name : "rtp"
      }
    },
    {
      name : "rtd",
      envs : ["d", "u", "p"],
      kv_name : "${local.prefix}-%s-rtd-kv",
      rg_name : "${local.prefix}-%s-rtd-sec-rg",
      code_review : true,
      deploy : true,
      pipeline_prefix : "rtd-infra",
      pipeline_path : "rtd-infrastructure",
      repository : {
        yml_prefix_name : "rtd"
      }
    },
    {
      name : "tae",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "tae-infra",
      pipeline_path : "tae-infrastructure",
      repository : {
        yml_prefix_name : "tae"
      }
    },
    {
      name : "idpay",
      envs : ["d", "u", "p"],
      kv_name : "${local.prefix}-%s-idpay-kv",
      rg_name : "${local.prefix}-%s-idpay-sec-rg",
      code_review : true,
      deploy : true,
      pipeline_prefix : "idpay-infra",
      pipeline_path : "idpay-infrastructure",
      repository : {
        yml_prefix_name : "idpay"
      }
    },
    {
      name : "core",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "core-infra",
      pipeline_path : "core-infrastructure",
      repository : {
        yml_prefix_name : "core"
      }
    },
    {
      name : "core-secrets",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "core-infra-secrets",
      pipeline_path : "core-infrastructure",
      repository : {
        yml_prefix_name : "core-secrets"
      }
    },
    {
      name : "packer",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "packer-infra",
      pipeline_path : "packer-infrastructure",
      repository : {
        yml_prefix_name : "packer"
      }
    },
  ]

  domain_variables = {
    #    mil = {
    #      iac_variables_cr : {},
    #      iac_variables_secrets_cr : {},
    #      iac_variables_deploy : {},
    #      iac_variables_secrets_deploy : {}
    #    }
  }
}
