locals {
  prefix = "cstar"

  dev_subscription_name  = "dev-${local.prefix}"
  uat_subscription_name  = "uat-${local.prefix}"
  prod_subscription_name = "prod-${local.prefix}"

  # Service connections/ End points
  srv_endpoint_github_ro = "azure-devops-github-ro"
  srv_endpoint_github_pr = "azure-devops-github-pr"

  aks_dev_platform_name  = "${local.prefix}-d-itn-dev-aks"
  aks_uat_platform_name  = "${local.prefix}-u-itn-uat-aks"
  aks_prod_platform_name = "${local.prefix}-p-itn-prod-aks"

  domains = [
    {
      name : "networking",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "networking-infra",
      pipeline_path : "networking-infrastructure",
      repository : {
        yml_prefix_name : "networking"
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
    {
      name : "security",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "security-infra",
      pipeline_path : "security-infrastructure",
      repository : {
        yml_prefix_name : "security"
      }
    },
    {
      name : "core",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "core-infra-ITN",
      pipeline_path : "core-infrastructure",
      repository : {
        yml_prefix_name : "core"
      }
    },
    {
      name : "platform",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "platform-infra",
      pipeline_path : "platform-infrastructure",
      kv_name : "",
      rg_name : "",
      repository : {
        yml_prefix_name : "platform"
      }
    },
    {
      name : "platform-coder",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "platform-coder-infra",
      pipeline_path : "platform-coder-infrastructure",
      kv_name : "cstar-%s-itn-core-kv",
      rg_name : "cstar-%s-itn-core-sec-rg",
      repository : {
        yml_prefix_name : "platform-coder"
      }
    },
    {
      name : "grafanaconf",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "pgrafanaconf-infra",
      pipeline_path : "grafanaconf-infrastructure",
      kv_name : "",
      rg_name : "",
      repository : {
        yml_prefix_name : "grafanaconf"
      }
    },
    {
      name : "srtp",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "srtp-infra",
      pipeline_path : "srtp-infrastructure",
      kv_name : "cstar-%s-itn-srtp-kv",
      rg_name : "cstar-%s-itn-srtp-security-rg",
      repository : {
        yml_prefix_name : "srtp"
      }
    },
    {
      name : "srtp-api-spec",
      envs : ["d", "u", "p"],
      kv_name : "",
      rg_name : "",
      code_review : true,
      deploy : true,
      pipeline_prefix : "srtp-api-spec",
      pipeline_path : "srtp-infrastructure",
      repository : {
        name = "cstar-securehub-infra-api-spec"
        yml_prefix_name : "srtp"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "idpay",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "idpay-infra",
      pipeline_path : "idpay-infrastructure",
      kv_name : "cstar-%s-itn-idpay-kv",
      rg_name : "cstar-%s-itn-idpay-security-rg",
      repository : {
        yml_prefix_name : "idpay"
      }
    },
    {
      name : "idpay-api-spec",
      envs : ["d", "u", "p"],
      kv_name : "",
      rg_name : "",
      code_review : true,
      deploy : true,
      pipeline_prefix : "idpay-api-spec",
      pipeline_path : "idpay-infrastructure",
      repository : {
        name = "cstar-securehub-infra-api-spec"
        yml_prefix_name : "idpay"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "mcshared",
      envs : ["d", "u", "p"],
      code_review : true,
      deploy : true,
      pipeline_prefix : "mcshared-infra",
      pipeline_path : "mcshared-infrastructure",
      repository : {
        yml_prefix_name : "mcshared"
      }
    },
    {
      name : "mcshared-api-spec",
      envs : ["d", "u", "p"],
      kv_name : "",
      rg_name : "",
      code_review : true,
      deploy : true,
      pipeline_prefix : "mcshared-api-spec",
      pipeline_path : "mcshared-infrastructure",
      repository : {
        name = "cstar-securehub-infra-api-spec"
        yml_prefix_name : "mcshared"
        branch_name = "refs/heads/main"
      }
    }
  ]

  domain_variables = {
  }
}
