locals {
  prefix         = "cstar"
  location_short = "itn"

  dev_subscription_name  = "dev-${local.prefix}"
  uat_subscription_name  = "uat-${local.prefix}"
  prod_subscription_name = "prod-${local.prefix}"

  # dev_identity_rg_name  = "${local.prefix}-d-identity-rg"
  # uat_identity_rg_name  = "${local.prefix}-u-identity-rg"
  # prod_identity_rg_name = "${local.prefix}-p-identity-rg"
  #
  # prod_key_vault_azdo_resource_group = "${local.prefix}-p-sec-rg"
  # prod_key_vault_azdo_name           = "${local.prefix}-p-azdo-${local.location_short}-kv"

  # Service connections/ End points
  srv_endpoint_github_ro = "azure-devops-github-ro"
  srv_endpoint_github_rw = "azure-devops-github-rw"
  srv_endpoint_github_pr = "azure-devops-github-pr"

  aks_dev_platform_name  = "${local.prefix}-d-itn-dev-aks"
  aks_uat_platform_name  = "${local.prefix}-u-itn-uat-aks"
  aks_prod_platform_name = "${local.prefix}-p-itn-prod-aks"

  domains = [
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
        branch_name = "refs/heads/PAYMCLOUD-473/iac-itn"
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
        branch_name = "refs/heads/PAYMCLOUD-473/iac-itn"
      }
    }
  ]

  domain_variables = {
  }
}
