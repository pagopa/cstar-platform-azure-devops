locals {
  domains = [
    #
    # cstar-securehub-infra Domains
    #
    {
      name : "idpay",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "idpay-infra",
      pipeline_path : "idpay-infrastructure",
      kv_name : "cstar-%s-itn-idpay-kv",
      rg_name : "cstar-%s-itn-idpay-security-rg",
      project_name = "iac"
      repository : {
        name = "cstar-securehub-infra"
        yml_prefix_name : "idpay"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "srtp",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "srtp-infra",
      pipeline_path : "srtp-infrastructure",
      kv_name : "cstar-%s-itn-srtp-kv",
      rg_name : "cstar-%s-itn-srtp-security-rg",
      project_name = "iac"
      repository : {
        name = "cstar-securehub-infra"
        yml_prefix_name : "srtp"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "mcshared",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "mcshared-infra",
      pipeline_path : "mcshared-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-securehub-infra"
        yml_prefix_name : "srtp"
        branch_name = "refs/heads/main"
      }
    },
    #
    # cstar-securehub-infra-api-spec
    #
    {
      name : "mcshared-api-spec",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "mcshared-api-spec",
      pipeline_path : "infra-api-spec\\mcshared",
      project_name = "app"
      repository : {
        name = "cstar-securehub-infra-api-spec"
        yml_prefix_name : "mcshared"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "idpay-api-spec",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "idpay-api-spec",
      pipeline_path : "infra-api-spec\\idpay",
      project_name = "app"
      repository : {
        name = "cstar-securehub-infra-api-spec"
        yml_prefix_name : "idpay"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "srtp-api-spec",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "infra-srtp-api-spec",
      pipeline_path : "infra-api-spec\\srtp",
      project_name = "app"
      repository : {
        name = "cstar-securehub-infra-api-spec"
        yml_prefix_name : "srtp"
        branch_name = "refs/heads/main"
      }
    },
    #
    # cstar-securehub-infra CORE
    #
    {
      name : "networking",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "networking-infra",
      pipeline_path : "networking-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-securehub-infra"
        yml_prefix_name : "networking"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "packer",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "packer-infra",
      pipeline_path : "packer-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-securehub-infra"
        yml_prefix_name : "packer"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "security",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "security-infra",
      pipeline_path : "security-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-securehub-infra"
        yml_prefix_name : "security"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "next-core",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "core-infra",
      pipeline_path : "core-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-securehub-infra"
        yml_prefix_name : "core"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "platform",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "platform-infra",
      pipeline_path : "platform-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-securehub-infra"
        yml_prefix_name : "platform"
        branch_name = "refs/heads/main"
      }
    },
    # {
    #   name : "platform-coder",
    #   envs : ["d", "u", "p"],
    #   location_short = "itn"
    #   code_review : true,
    #   deploy : true,
    #   kv_name : "cstar-%s-itn-core-kv",
    #   rg_name : "cstar-%s-itn-core-sec-rg",
    #   pipeline_prefix : "platform-coder-infra",
    #   pipeline_path : "platform-infrastructure",
    #   project_name = "iac"
    #   repository : {
    #     name = "cstar-securehub-infra"
    #     yml_prefix_name : "platform-coder"
    #     branch_name = "refs/heads/main"
    #   }
    # },
    {
      name : "grafanaconf",
      envs : ["d", "u", "p"],
      location_short = "itn"
      code_review : true,
      deploy : true,
      pipeline_prefix : "grafanaconf-infra",
      pipeline_path : "grafanaconf-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-securehub-infra"
        yml_prefix_name : "grafanaconf"
        branch_name = "refs/heads/main"
      }
    },
    #
    # cstar-infrastructure
    #
    {
      name : "mil",
      envs : ["d", "u", "p"],
      location_short = "weu"
      kv_name : "cstar-%s-weu-mil-kv",
      rg_name : "cstar-%s-weu-mil-sec-rg",
      code_review : true,
      deploy : true,
      pipeline_prefix : "mil-infra",
      pipeline_path : "mil-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-infrastructure"
        yml_prefix_name : "mil"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "rtd",
      envs : ["d", "u", "p"],
      location_short = "weu"
      kv_name : "${local.prefix}-%s-rtd-kv",
      rg_name : "${local.prefix}-%s-rtd-sec-rg",
      code_review : true,
      deploy : true,
      pipeline_prefix : "rtd-infra",
      pipeline_path : "rtd-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-infrastructure"
        yml_prefix_name : "rtd"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "tae",
      envs : ["d", "u", "p"],
      location_short = "weu"
      code_review : true,
      deploy : true,
      pipeline_prefix : "tae-infra",
      pipeline_path : "tae-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-infrastructure"
        yml_prefix_name : "tae"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "core",
      envs : ["d", "u", "p"],
      location_short = "weu"
      code_review : true,
      deploy : true,
      pipeline_prefix : "core-infra",
      pipeline_path : "core-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-infrastructure"
        yml_prefix_name : "core"
        branch_name = "refs/heads/main"
      }
    },
    {
      name : "core-secrets",
      envs : ["d", "u", "p"],
      location_short = "weu"
      code_review : true,
      deploy : true,
      pipeline_prefix : "core-infra-secrets",
      pipeline_path : "core-infrastructure",
      project_name = "iac"
      repository : {
        name = "cstar-infrastructure"
        yml_prefix_name : "core-secrets"
        branch_name = "refs/heads/main"
      }
    },
  ]

  domain_variables = {
  }
}
