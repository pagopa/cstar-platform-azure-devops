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
      envs : ["d"],
      kv_name : "cstar-%s-weu-mil-kv",
      rg_name : "cstar-%s-weu-mil-sec-rg",
      code_review : true,
      deploy : false,
      pipeline_prefix : "mil-infra",
      pipeline_path : "mil-infrastructure",
      repository : {
        yml_prefix_name : "mil"
        branch_name : "iac-devops"
      }
    }
    #    {
    #      name : "networking",
    #      envs : ["d", "u", "p"],
    #      kv_name : "",
    #      rg_name : "",
    #      code_review : true,
    #      deploy : true,
    #      pipeline_prefix : "networking-infra",
    #      pipeline_path : "networking-infrastructure",
    #      repository : {
    #        yml_prefix_name : "networking"
    #      }
    #    },
    #    {
    #      name : "security",
    #      envs : ["d", "u", "p"],
    #      kv_name : "",
    #      rg_name : "",
    #      code_review : true,
    #      deploy : true,
    #      pipeline_prefix : "security-infra",
    #      pipeline_path : "security-infrastructure",
    #      repository : {
    #        yml_prefix_name : "security"
    #      }
    #    },
    #    {
    #      name : "packer",
    #      envs : ["d", "u", "p"],
    #      kv_name : "",
    #      rg_name : "",
    #      code_review : true,
    #      deploy : true,
    #      pipeline_prefix : "packer-infra",
    #      pipeline_path : "packer-infrastructure",
    #      repository : {
    #        yml_prefix_name : "packer"
    #      }
    #    },
    #    {
    #      name : "core",
    #      envs : ["d", "u", "p"],
    #      kv_name : "",
    #      rg_name : "",
    #      code_review : true,
    #      deploy : true,
    #      pipeline_prefix : "core-infra",
    #      pipeline_path : "core-infrastructure",
    #      repository : {
    #        yml_prefix_name : "core"
    #      }
    #    },
    #    {
    #      name : "monitoring",
    #      envs : ["d", "u", "p"],
    #      kv_name : "",
    #      rg_name : "",
    #      code_review : true,
    #      deploy : true,
    #      pipeline_prefix : "monitoring-infra",
    #      pipeline_path : "monitoring-infrastructure",
    #      repository : {
    #        yml_prefix_name : "monitoring"
    #      }
    #    },
    #    {
    #      name : "platform",
    #      envs : ["d", "u", "p"],
    #      kv_name : "",
    #      rg_name : "",
    #      code_review : true,
    #      deploy : true,
    #      pipeline_prefix : "platform-infra",
    #      pipeline_path : "platform-infrastructure",
    #      repository : {
    #        yml_prefix_name : "platform"
    #      }
    #    },
    #    {
    #      name : "payhub-api-spec",
    #      envs : ["d", "u", "p"],
    #      kv_name : "",
    #      rg_name : "",
    #      code_review : true,
    #      deploy : true,
    #      pipeline_prefix : "payhub-api-spec",
    #      pipeline_path : "payhub-api-spec",
    #      repository : {
    #        name = "p4pa-infra-api-spec"
    #        yml_prefix_name : "payhub"
    #        branch_name = "refs/heads/main"
    #      }
    #    }
  ]
  #
  domain_variables = {
    #    mil = {
    #      iac_variables_cr : {},
    #      iac_variables_secrets_cr : {},
    #      iac_variables_deploy : {},
    #      iac_variables_secrets_deploy : {}
    #    }
  }
}
