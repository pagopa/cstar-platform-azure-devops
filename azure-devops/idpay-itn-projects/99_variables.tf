locals {
  prefix           = "cstar"
  azure_devops_org = "pagopaspa"
  location_short   = "itn"
  location         = "italynorth"
  domain           = "idpay"

  product         = "${local.prefix}-${local.domain}"
  external_domain = "pagopa.it"

  # ⚙️ DevOps
  devops_project_id = data.azuredevops_project.this.project_id

  # 🔐 KV Domain
  dev_domain_key_vault_resource_group  = "${local.prefix}-d-${local.domain}-sec-rg"
  uat_domain_key_vault_resource_group  = "${local.prefix}-u-${local.domain}-sec-rg"
  prod_domain_key_vault_resource_group = "${local.prefix}-p-${local.domain}-sec-rg"

  dev_domain_key_vault_name  = "${local.prefix}-d-${local.domain}-kv"
  uat_domain_key_vault_name  = "${local.prefix}-u-${local.domain}-kv"
  prod_domain_key_vault_name = "${local.prefix}-p-${local.domain}-kv"

  # Agent Pool
  azdo_agent_pool_dev  = "cstar-dev-linux"
  azdo_agent_pool_uat  = "cstar-uat-linux"
  azdo_agent_pool_prod = "cstar-prod-linux"

  dev_aks_name  = "${local.prefix}-d-${local.location_short}-aks"
  uat_aks_name  = "${local.prefix}-u-${local.location_short}-aks"
  prod_aks_name = "${local.prefix}-p-${local.location_short}-aks"

  dev_subscription_name  = "dev-${local.prefix}"
  uat_subscription_name  = "uat-${local.prefix}"
  prod_subscription_name = "prod-${local.prefix}"

  #
  # Outputs from CORE
  #
  # service_endpoint_io_azure_devops_github_ro_name = "io-azure-devops-github-ro"
  # service_endpoint_io_azure_devops_github_pr_name = "io-azure-devops-github-pr"
  # service_endpoint_io_azure_devops_github_pr_id   = data.azuredevops_serviceendpoint_github.io-azure-devops-github-pr.id
  # service_endpoint_io_azure_devops_github_ro_id   = data.azuredevops_serviceendpoint_github.io-azure-devops-github-ro.id

  # DEV
  # service_endpoint_azure_devops_docker_dev_name = data.azuredevops_serviceendpoint_azurecr.dev_weu_workload_identity.service_endpoint_name
  # service_endpoint_azure_devops_docker_dev_id   = data.azuredevops_serviceendpoint_azurecr.dev_weu_workload_identity.id
  service_endpoint_azure_dev_id   = data.azuredevops_serviceendpoint_azurerm.azure_dev.id
  service_endpoint_azure_dev_name = data.azuredevops_serviceendpoint_azurerm.azure_dev.service_endpoint_name
  dev_cdn_profile            = "${local.prefix}-d-${local.domain}-cdn-profile"
  dev_cdn_endpoint           = "${local.prefix}-d-${local.domain}-cdn-endpoint"
  dev_storage_account_rg     = "${local.prefix}-d-${local.location_short}-${local.domain}-cdn-rg"
  dev_storage_account_name   = replace("${local.prefix}-d-${local.domain}-sa", "-", "")

  # UAT
  # service_endpoint_azure_devops_docker_uat_name = data.azuredevops_serviceendpoint_azurecr.uat_weu_workload_identity.service_endpoint_name
  # service_endpoint_azure_devops_docker_uat_id   = data.azuredevops_serviceendpoint_azurecr.uat_weu_workload_identity.id
  service_endpoint_azure_uat_id   = data.azuredevops_serviceendpoint_azurerm.azure_uat.id
  service_endpoint_azure_uat_name = data.azuredevops_serviceendpoint_azurerm.azure_dev.service_endpoint_name
  uat_cdn_profile            = "${local.prefix}-u-${local.domain}-cdn-profile"
  uat_cdn_endpoint           = "${local.prefix}-u-${local.domain}-cdn-endpoint"
  uat_storage_account_rg     = "${local.prefix}-u-${local.location_short}-${local.domain}-cdn-rg"
  uat_storage_account_name   = replace("${local.prefix}-u-${local.domain}-sa", "-", "")

  # PROD
  # service_endpoint_azure_devops_docker_prod_name = data.azuredevops_serviceendpoint_azurecr.prod_weu_workload_identity.service_endpoint_name
  # service_endpoint_azure_devops_docker_prod_id   = data.azuredevops_serviceendpoint_azurecr.prod_weu_workload_identity.id
  service_endpoint_azure_prod_id   = data.azuredevops_serviceendpoint_azurerm.azure_prod.id
  service_endpoint_azure_prod_name = data.azuredevops_serviceendpoint_azurerm.azure_dev.service_endpoint_name
  prod_cdn_profile            = "${local.prefix}-p-${local.domain}-cdn-profile"
  prod_cdn_endpoint           = "${local.prefix}-p-${local.domain}-cdn-endpoint"
  prod_storage_account_rg     = "${local.prefix}-p-${local.location_short}-${local.domain}-cdn-rg"
  prod_storage_account_name   = replace("${local.prefix}-p-${local.domain}-sa", "-", "")

  dev_react_app_url_cdn                                     = "https://welfare.dev.cstar.pagopa.it/"
  dev_react_app_url_storage                                 = "https://cstardweuidpayidpaycdnsa.z6.web.core.windows.net/"
  dev_react_app_url_fe_pre_login                            = "https://api-io.dev.cstar.pagopa.it/idpay/welfare/token"
  dev_react_app_url_fe_pre_login_merchants                  = "https://api-io.dev.cstar.pagopa.it/idpay/merchant/token"
  dev_react_app_url_fe_login                                = "https://dev.selfcare.pagopa.it/auth"
  dev_react_app_url_fe_assistance_merchants                 = "/portale-esercenti/assistenza"
  dev_react_app_url_fe_assistance_portal                    = "/portale-enti/assistenza"
  dev_react_app_url_fe_landing                              = "https://dev.selfcare.pagopa.it/auth/logout"
  dev_react_app_url_api_initiative                          = "https://api-io.dev.cstar.pagopa.it/idpay/initiative"
  dev_react_app_url_api_groups                              = "https://api-io.dev.cstar.pagopa.it/idpay/group"
  dev_react_app_url_api_role_permission                     = "https://api-io.dev.cstar.pagopa.it/idpay/authorization"
  dev_react_app_url_api_email_notification                  = "https://api-io.dev.cstar.pagopa.it/idpay/email-notification"
  dev_react_app_url_api_merchants                           = "https://api-io.dev.cstar.pagopa.it/idpay/merchant"
  dev_react_app_url_api_merchants_portal                    = "https://api-io.dev.cstar.pagopa.it/idpay/merchant/portal"
  dev_react_app_one_trust_otnotice_cdn_url                  = "https://privacyportalde-cdn.onetrust.com/privacy-notice-scripts/otnotice-1.0.min.js"
  dev_react_app_one_trust_otnotice_cdn_settings             = "eyJjYWxsYmFja1VybCI6Imh0dHBzOi8vcHJpdmFjeXBvcnRhbC1kZS5vbmV0cnVzdC5jb20vcmVxdWVzdC92MS9wcml2YWN5Tm90aWNlcy9zdGF0cy92aWV3cyJ9"
  dev_react_app_one_trust_privacy_policy_id                 = "otnotice-5b7fed3e-ea34-4620-b01d-b17fa7c88441"
  dev_react_app_one_trust_privacy_policy_json_url           = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/5b7fed3e-ea34-4620-b01d-b17fa7c88441.json"
  dev_react_app_one_trust_tos_id                            = "otnotice-6240fe7c-a66c-4395-a5c6-f1fee15e8258"
  dev_react_app_one_trust_tos_json_url                      = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/6240fe7c-a66c-4395-a5c6-f1fee15e8258.json"
  dev_react_app_one_trust_privacy_policy_id_merchants       = "otnotice-5079ee0c-cfa9-42ec-acda-66799bed5039"
  dev_react_app_one_trust_privacy_policy_json_url_merchants = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/5079ee0c-cfa9-42ec-acda-66799bed5039.json"
  dev_react_app_one_trust_tos_id_merchants                  = "otnotice-d99f1397-31cc-4519-9629-785c0d4c9145"
  dev_react_app_one_trust_tos_json_url_merchants            = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/d99f1397-31cc-4519-9629-785c0d4c9145.json"
  dev_analytics_enabled  = "true"
  dev_analytics_mocked   = "true" //Put to false when mixpanel available
  dev_mixpanel_token     = "TODO" //"6e1290bdda5885981a2f443f37444f0f"
  dev_onetrust_domain_id = "TODO" //"a8f58d7a-7f6a-4fe6-ac02-f95bac3876d4-test"


  uat_react_app_url_cdn                                     = "https://welfare.uat.cstar.pagopa.it/"
  uat_react_app_url_storage                                 = "https://cstaruweuidpayidpaycdnsa.z6.web.core.windows.net/"
  uat_react_app_url_fe_pre_login                            = "https://api-io.uat.cstar.pagopa.it/idpay/welfare/token"
  uat_react_app_url_fe_pre_login_merchants                  = "https://api-io.uat.cstar.pagopa.it/idpay/merchant/token"
  uat_react_app_url_fe_login                                = "https://uat.selfcare.pagopa.it/auth"
  uat_react_app_url_fe_assistance_merchants                 = "/portale-esercenti/assistenza"
  uat_react_app_url_fe_assistance_portal                    = "/portale-enti/assistenza"
  uat_react_app_url_fe_landing                              = "https://uat.selfcare.pagopa.it/auth/logout"
  uat_react_app_url_api_initiative                          = "https://api-io.uat.cstar.pagopa.it/idpay/initiative"
  uat_react_app_url_api_groups                              = "https://api-io.uat.cstar.pagopa.it/idpay/group"
  uat_react_app_url_api_role_permission                     = "https://api-io.uat.cstar.pagopa.it/idpay/authorization"
  uat_react_app_url_api_email_notification                  = "https://api-io.uat.cstar.pagopa.it/idpay/email-notification"
  uat_react_app_url_api_merchants                           = "https://api-io.uat.cstar.pagopa.it/idpay/merchant"
  uat_react_app_url_api_merchants_portal                    = "https://api-io.uat.cstar.pagopa.it/idpay/merchant/portal"
  uat_react_app_one_trust_otnotice_cdn_url                  = "https://privacyportalde-cdn.onetrust.com/privacy-notice-scripts/otnotice-1.0.min.js"
  uat_react_app_one_trust_otnotice_cdn_settings             = "eyJjYWxsYmFja1VybCI6Imh0dHBzOi8vcHJpdmFjeXBvcnRhbC1kZS5vbmV0cnVzdC5jb20vcmVxdWVzdC92MS9wcml2YWN5Tm90aWNlcy9zdGF0cy92aWV3cyJ9"
  uat_react_app_one_trust_privacy_policy_id                 = "otnotice-5b7fed3e-ea34-4620-b01d-b17fa7c88441"
  uat_react_app_one_trust_privacy_policy_json_url           = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/5b7fed3e-ea34-4620-b01d-b17fa7c88441.json"
  uat_react_app_one_trust_tos_id                            = "otnotice-6240fe7c-a66c-4395-a5c6-f1fee15e8258"
  uat_react_app_one_trust_tos_json_url                      = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/6240fe7c-a66c-4395-a5c6-f1fee15e8258.json"
  uat_react_app_one_trust_privacy_policy_id_merchants       = "otnotice-5079ee0c-cfa9-42ec-acda-66799bed5039"
  uat_react_app_one_trust_privacy_policy_json_url_merchants = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/5079ee0c-cfa9-42ec-acda-66799bed5039.json"
  uat_react_app_one_trust_tos_id_merchants                  = "otnotice-d99f1397-31cc-4519-9629-785c0d4c9145"
  uat_react_app_one_trust_tos_json_url_merchants            = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/d99f1397-31cc-4519-9629-785c0d4c9145.json"
  uat_analytics_enabled  = "true"
  uat_analytics_mocked   = "true" //Put to false when mixpanel available
  uat_mixpanel_token     = "TODO" //"1d1b09b008638080ab34fe9b75db84fd"
  uat_onetrust_domain_id = "TODO" //"15a1f042-9257-450f-b9e8-38d019191729"

  prod_react_app_url_cdn                                     = "https://welfare.cstar.pagopa.it/"
  prod_react_app_url_storage                                 = "https://cstarpweuidpayidpaycdnsa.z6.web.core.windows.net/"
  prod_react_app_url_fe_pre_login                            = "https://api-io.cstar.pagopa.it/idpay/welfare/token"
  prod_react_app_url_fe_pre_login_merchants                  = "https://api-io.cstar.pagopa.it/idpay/merchant/token"
  prod_react_app_url_fe_login                                = "https://selfcare.pagopa.it/auth"
  prod_react_app_url_fe_assistance_merchants                 = "/portale-esercenti/assistenza"
  prod_react_app_url_fe_assistance_portal                    = "/portale-enti/assistenza"
  prod_react_app_url_fe_landing                              = "https://selfcare.pagopa.it/auth/logout"
  prod_react_app_url_api_initiative                          = "https://api-io.cstar.pagopa.it/idpay/initiative"
  prod_react_app_url_api_groups                              = "https://api-io.cstar.pagopa.it/idpay/group"
  prod_react_app_url_api_role_permission                     = "https://api-io.cstar.pagopa.it/idpay/authorization"
  prod_react_app_url_api_email_notification                  = "https://api-io.cstar.pagopa.it/idpay/email-notification"
  prod_react_app_url_api_merchants                           = "https://api-io.cstar.pagopa.it/idpay/merchant"
  prod_react_app_url_api_merchants_portal                    = "https://api-io.cstar.pagopa.it/idpay/merchant/portal"
  prod_react_app_one_trust_otnotice_cdn_url                  = "https://privacyportalde-cdn.onetrust.com/privacy-notice-scripts/otnotice-1.0.min.js"
  prod_react_app_one_trust_otnotice_cdn_settings             = "eyJjYWxsYmFja1VybCI6Imh0dHBzOi8vcHJpdmFjeXBvcnRhbC1kZS5vbmV0cnVzdC5jb20vcmVxdWVzdC92MS9wcml2YWN5Tm90aWNlcy9zdGF0cy92aWV3cyJ9"
  prod_react_app_one_trust_privacy_policy_id                 = "otnotice-5b7fed3e-ea34-4620-b01d-b17fa7c88441"
  prod_react_app_one_trust_privacy_policy_json_url           = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/5b7fed3e-ea34-4620-b01d-b17fa7c88441.json"
  prod_react_app_one_trust_tos_id                            = "otnotice-6240fe7c-a66c-4395-a5c6-f1fee15e8258"
  prod_react_app_one_trust_tos_json_url                      = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/6240fe7c-a66c-4395-a5c6-f1fee15e8258.json"
  prod_react_app_one_trust_privacy_policy_id_merchants       = "otnotice-5079ee0c-cfa9-42ec-acda-66799bed5039"
  prod_react_app_one_trust_privacy_policy_json_url_merchants = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/5079ee0c-cfa9-42ec-acda-66799bed5039.json"
  prod_react_app_one_trust_tos_id_merchants                  = "otnotice-d99f1397-31cc-4519-9629-785c0d4c9145"
  prod_react_app_one_trust_tos_json_url_merchants            = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/d99f1397-31cc-4519-9629-785c0d4c9145.json"
  prod_analytics_enabled  = "true"
  prod_analytics_mocked   = "true" //Put to false when mixpanel available
  prod_mixpanel_token     = "TODO" //"1d1b09b008638080ab34fe9b75db84fd"
  prod_onetrust_domain_id = "TODO" //"084d5de2-d423-458a-9b28-0f8db3e55e71"
}
