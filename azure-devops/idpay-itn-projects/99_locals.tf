locals {
  prefix            = "cstar"
  domain            = "idpay"
  location_short    = "itn"
  location          = "italynorth"
  azdo_project_name = "cstar-platform-app-projects"
  product           = "${local.prefix}-${local.location_short}"

  devops_project_id = data.azuredevops_project.this.project_id

  # Subscriptions
  dev_subscription_name  = data.azurerm_subscriptions.dev.subscriptions[0].display_name
  uat_subscription_name  = data.azurerm_subscriptions.uat.subscriptions[0].display_name
  prod_subscription_name = data.azurerm_subscriptions.prod.subscriptions[0].display_name

  dev_subscription_id  = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
  uat_subscription_id  = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
  prod_subscription_id = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id


  ### 🔑 Key Vault
  dev_kv_domain_name            = "${local.prefix}-d-${local.location_short}-${local.domain}-kv"
  dev_kv_domain_resource_group  = "${local.prefix}-d-${local.location_short}-${local.domain}-security-rg"
  uat_kv_domain_name            = "${local.prefix}-u-${local.location_short}-${local.domain}-kv"
  uat_kv_domain_resource_group  = "${local.prefix}-u-${local.location_short}-${local.domain}-security-rg"
  prod_kv_domain_name           = "${local.prefix}-p-${local.location_short}-${local.domain}-kv"
  prod_kv_domain_resource_group = "${local.prefix}-p-${local.location_short}-${local.domain}-security-rg"

  ### 🌐 Network
  rg_dev_dns_zone_name  = "cstar-d-vnet-rg"
  rg_uat_dns_zone_name  = "cstar-u-vnet-rg"
  rg_prod_dns_zone_name = "cstar-p-vnet-rg"

  dev_dns_zone_name  = "dev.cstar.pagopa.it"
  uat_dns_zone_name  = "uat.cstar.pagopa.it"
  prod_dns_zone_name = "cstar.pagopa.it"

  ### Idenity RG
  dev_identity_rg_name  = "cstar-d-itn-idpay-cicd-rg"
  uat_identity_rg_name  = "cstar-u-itn-idpay-cicd-rg"
  prod_identity_rg_name = "cstar-p-itn-idpay-cicd-rg"

  ### Agent Pool
  azdo_agent_pool_dev  = "cstar-dev-linux"
  azdo_agent_pool_uat  = "cstar-uat-linux"
  azdo_agent_pool_prod = "cstar-prod-linux"

  ### AKS
  dev_aks_name  = "${local.prefix}-d-${local.location_short}-aks"
  uat_aks_name  = "${local.prefix}-u-${local.location_short}-aks"
  prod_aks_name = "${local.prefix}-p-${local.location_short}-aks"

  ### Service connections/endpoints Azure
  dev_service_endpoint_azure_id    = data.azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn.service_endpoint_id
  dev_service_endpoint_azure_name  = data.azuredevops_serviceendpoint_azurerm.dev_azurerm_service_conn.service_endpoint_name
  uat_service_endpoint_azure_id    = data.azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn.service_endpoint_id
  uat_service_endpoint_azure_name  = data.azuredevops_serviceendpoint_azurerm.uat_azurerm_service_conn.service_endpoint_name
  prod_service_endpoint_azure_id   = data.azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn.service_endpoint_id
  prod_service_endpoint_azure_name = data.azuredevops_serviceendpoint_azurerm.prod_azurerm_service_conn.service_endpoint_name

  ### Service connections/endpoints GitHub
  service_connection_github_rw_id   = azuredevops_serviceendpoint_github.idpay_bot_github_rw.id
  service_connection_github_rw_name = azuredevops_serviceendpoint_github.idpay_bot_github_rw.service_endpoint_name
  service_connection_github_ro_id   = azuredevops_serviceendpoint_github.idpay_bot_github_ro.id
  service_connection_github_ro_name = azuredevops_serviceendpoint_github.idpay_bot_github_ro.service_endpoint_name
  service_connection_github_pr_id   = azuredevops_serviceendpoint_github.idpay_bot_github_pr.id
  service_connection_github_pr_name = azuredevops_serviceendpoint_github.idpay_bot_github_pr.service_endpoint_name

  # DEV WELFARE
  dev_welfare_cdn_profile          = "${local.prefix}-d-weu-${local.domain}-welfare-cdn-profile"
  dev_welfare_cdn_endpoint         = "${local.prefix}-d-weu-${local.domain}-welfare-cdn-endpoint"
  dev_welfare_storage_account_rg   = "${local.prefix}-d-${local.location_short}-${local.domain}-data-rg"
  dev_welfare_storage_account_name = replace("${local.prefix}-d-${local.location_short}-${local.domain}-wel-cdn-sa", "-", "")

  # UAT
  uat_welfare_cdn_profile          = "${local.prefix}-u-weu-${local.domain}-welfare-cdn-profile"
  uat_welfare_cdn_endpoint         = "${local.prefix}-u-weu-${local.domain}-welfare-cdn-endpoint"
  uat_welfare_storage_account_rg   = "${local.prefix}-u-${local.location_short}-${local.domain}-data-rg"
  uat_welfare_storage_account_name = replace("${local.prefix}-u-${local.location_short}-${local.domain}-wel-cdn-sa", "-", "")

  # PROD
  prod_welfare_cdn_profile          = "${local.prefix}-p-weu-${local.domain}-welfare-cdn-profile"
  prod_welfare_cdn_endpoint         = "${local.prefix}-p-weu-${local.domain}-welfare-cdn-endpoint"
  prod_welfare_storage_account_rg   = "${local.prefix}-p-${local.location_short}-${local.domain}-data-rg"
  prod_welfare_storage_account_name = replace("${local.prefix}-p-${local.location_short}-${local.domain}-wel-cdn-sa", "-", "")

  # DEV REGISTRO DEI BENI
  dev_cdn_profile                         = "${local.prefix}-d-${local.domain}-cdn-profile"
  dev_cdn_endpoint                        = "${local.prefix}-d-${local.domain}-cdn-endpoint"
  dev_storage_account_rg                  = "${local.prefix}-d-${local.location_short}-${local.domain}-cdn-rg"
  dev_storage_asset_register_account_name = "cstarditnidpayregcdnsa"


  # UAT REGISTRO DEI BENI
  uat_cdn_profile                         = "${local.prefix}-u-${local.domain}-cdn-profile"
  uat_cdn_endpoint                        = "${local.prefix}-u-${local.domain}-cdn-endpoint"
  uat_storage_account_rg                  = "${local.prefix}-u-${local.location_short}-${local.domain}-cdn-rg"
  uat_storage_asset_register_account_name = "cstaruitnidpayregcdnsa"

  # PROD REGISTRO DEI BENI
  prod_cdn_profile                         = "${local.prefix}-p-${local.domain}-cdn-profile"
  prod_cdn_endpoint                        = "${local.prefix}-p-${local.domain}-cdn-endpoint"
  prod_storage_account_rg                  = "${local.prefix}-p-${local.location_short}-${local.domain}-cdn-rg"
  prod_storage_asset_register_account_name = "cstarpitnidpayregcdnsa"


  #FRONTEND REACT ENV
  dev_react_app_url_cdn                                     = "https://welfare-italy.dev.cstar.pagopa.it/"
  dev_react_app_url_storage                                 = "https://cstarditnidpaywelcdnsa.z38.web.core.windows.net/"
  dev_react_app_url_fe_pre_login                            = "https://api-io.dev.cstar.pagopa.it/idpay-itn/welfare/token"
  dev_react_app_url_fe_pre_login_merchants                  = "https://api-io.dev.cstar.pagopa.it/idpay-itn/merchant/token"
  dev_react_app_url_fe_login                                = "https://dev.selfcare.pagopa.it/auth"
  dev_react_app_url_fe_assistance_merchants                 = "/portale-esercenti/assistenza"
  dev_react_app_url_fe_assistance_portal                    = "/portale-enti/assistenza"
  dev_react_app_url_fe_landing                              = "https://dev.selfcare.pagopa.it/auth/logout"
  dev_react_app_url_api_initiative                          = "https://api-io.dev.cstar.pagopa.it/idpay-itn/initiative"
  dev_react_app_url_api_groups                              = "https://api-io.dev.cstar.pagopa.it/idpay-itn/group"
  dev_react_app_url_api_role_permission                     = "https://api-io.dev.cstar.pagopa.it/idpay-itn/authorization"
  dev_react_app_url_api_email_notification                  = "https://api-io.dev.cstar.pagopa.it/idpay-itn/email-notification"
  dev_react_app_url_api_merchants                           = "https://api-io.dev.cstar.pagopa.it/idpay-itn/merchant"
  dev_react_app_url_api_merchants_portal                    = "https://api-io.dev.cstar.pagopa.it/idpay-itn/merchant/portal"
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
  dev_analytics_enabled                                     = "true"
  dev_analytics_mocked                                      = "true" //Put to false when mixpanel available
  dev_mixpanel_token                                        = "TODO" //"6e1290bdda5885981a2f443f37444f0f"
  dev_onetrust_domain_id                                    = "TODO" //"a8f58d7a-7f6a-4fe6-ac02-f95bac3876d4-test"


  uat_react_app_url_cdn                                     = "https://welfare-italy.uat.cstar.pagopa.it/"
  uat_react_app_url_storage                                 = "https://cstaruitnidpaywelcdnsa.z38.web.core.windows.net/"
  uat_react_app_url_fe_pre_login                            = "https://api-io.uat.cstar.pagopa.it/idpay-itn/welfare/token"
  uat_react_app_url_fe_pre_login_merchants                  = "https://api-io.uat.cstar.pagopa.it/idpay-itn/merchant/token"
  uat_react_app_url_fe_login                                = "https://uat.selfcare.pagopa.it/auth"
  uat_react_app_url_fe_assistance_merchants                 = "/portale-esercenti/assistenza"
  uat_react_app_url_fe_assistance_portal                    = "/portale-enti/assistenza"
  uat_react_app_url_fe_landing                              = "https://uat.selfcare.pagopa.it/auth/logout"
  uat_react_app_url_api_initiative                          = "https://api-io.uat.cstar.pagopa.it/idpay-itn/initiative"
  uat_react_app_url_api_groups                              = "https://api-io.uat.cstar.pagopa.it/idpay-itn/group"
  uat_react_app_url_api_role_permission                     = "https://api-io.uat.cstar.pagopa.it/idpay-itn/authorization"
  uat_react_app_url_api_email_notification                  = "https://api-io.uat.cstar.pagopa.it/idpay-itn/email-notification"
  uat_react_app_url_api_merchants                           = "https://api-io.uat.cstar.pagopa.it/idpay-itn/merchant"
  uat_react_app_url_api_merchants_portal                    = "https://api-io.uat.cstar.pagopa.it/idpay-itn/merchant/portal"
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
  uat_analytics_enabled                                     = "true"
  uat_analytics_mocked                                      = "true" //Put to false when mixpanel available
  uat_mixpanel_token                                        = "TODO" //"1d1b09b008638080ab34fe9b75db84fd"
  uat_onetrust_domain_id                                    = "TODO" //"15a1f042-9257-450f-b9e8-38d019191729"

  prod_react_app_url_cdn                                     = "https://welfare-italy.cstar.pagopa.it/"
  prod_react_app_url_storage                                 = "https://cstarpweuidpayidpaycdnsa.z38.web.core.windows.net/"
  prod_react_app_url_fe_pre_login                            = "https://api-io.cstar.pagopa.it/idpay-itn/welfare/token"
  prod_react_app_url_fe_pre_login_merchants                  = "https://api-io.cstar.pagopa.it/idpay-itn/merchant/token"
  prod_react_app_url_fe_login                                = "https://selfcare.pagopa.it/auth"
  prod_react_app_url_fe_assistance_merchants                 = "/portale-esercenti/assistenza"
  prod_react_app_url_fe_assistance_portal                    = "/portale-enti/assistenza"
  prod_react_app_url_fe_landing                              = "https://selfcare.pagopa.it/auth/logout"
  prod_react_app_url_api_initiative                          = "https://api-io.cstar.pagopa.it/idpay-itn/initiative"
  prod_react_app_url_api_groups                              = "https://api-io.cstar.pagopa.it/idpay-itn/group"
  prod_react_app_url_api_role_permission                     = "https://api-io.cstar.pagopa.it/idpay-itn/authorization"
  prod_react_app_url_api_email_notification                  = "https://api-io.cstar.pagopa.it/idpay-itn/email-notification"
  prod_react_app_url_api_merchants                           = "https://api-io.cstar.pagopa.it/idpay-itn/merchant"
  prod_react_app_url_api_merchants_portal                    = "https://api-io.cstar.pagopa.it/idpay-itn/merchant/portal"
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
  prod_analytics_enabled                                     = "true"
  prod_analytics_mocked                                      = "true" //Put to false when mixpanel available
  prod_mixpanel_token                                        = "TODO" //"1d1b09b008638080ab34fe9b75db84fd"
  prod_onetrust_domain_id                                    = "TODO" //"084d5de2-d423-458a-9b28-0f8db3e55e71"

  #FRONTEND REACT ENV REGISTRO BENI

  dev_react_app_asset_register_url_cdn                  = "https://registrodeibeni.dev.cstar.pagopa.it/"
  dev_react_app_asset_register_url_storage              = "https://cstarditnidpayregcdnsa.z38.web.core.windows.net"
  dev_react_app_asset_register_url_fe_pre_login         = "https://api-io.dev.cstar.pagopa.it/idpay-itn/register/token"
  dev_react_app_asset_register_url_fe_login             = "https://dev.selfcare.pagopa.it/auth"
  dev_react_app_asset_register_url_fe_assistance_portal = "/registro-dei-beni/assistenza"
  dev_react_app_asset_register_url_fe_landing           = "https://dev.selfcare.pagopa.it/auth/logout"
  dev_vite_keycloak_url                                 = "https://api-mcshared.dev.cstar.pagopa.it/auth-itn"
  dev_vite_keycloak_realm                               = "merchant-operator"
  dev_vite_keycloak_client_id                           = "frontend"

  uat_react_app_asset_register_url_cdn                  = "https://registrodeibeni.uat.cstar.pagopa.it/"
  uat_react_app_asset_register_url_storage              = "https://cstaruitnidpayregcdnsa.z38.web.core.windows.net"
  uat_react_app_asset_register_url_fe_pre_login         = "https://api-io.uat.cstar.pagopa.it/idpay-itn/register/token"
  uat_react_app_asset_register_url_fe_login             = "https://uat.selfcare.pagopa.it/auth"
  uat_react_app_asset_register_url_fe_assistance_portal = "/registro-dei-beni/assistenza"
  uat_react_app_asset_register_url_fe_landing           = "https://uat.selfcare.pagopa.it/auth/logout"
  uat_vite_keycloak_url                                 = "TODO"
  uat_vite_keycloak_realm                               = "merchant-operator"
  uat_vite_keycloak_client_id                           = "frontend"

  prod_react_app_asset_register_url_cdn                  = "https://registrodeibeni.cstar.pagopa.it/"
  prod_react_app_asset_register_url_storage              = "https://cstarpitnidpayregcdnsa.z38.web.core.windows.net"
  prod_react_app_asset_register_url_fe_pre_login         = "https://api-io.cstar.pagopa.it/idpay-itn/register/token"
  prod_react_app_asset_register_url_fe_login             = "https://selfcare.pagopa.it/auth"
  prod_react_app_asset_register_url_fe_assistance_portal = "/registro-dei-beni/assistenza"
  prod_react_app_asset_register_url_fe_landing           = "https://selfcare.pagopa.it/auth/logout"
  prod_vite_keycloak_url                                 = "TODO"
  prod_vite_keycloak_realm                               = "merchant-operator"
  prod_vite_keycloak_client_id                           = "frontend"
}

# LOCAL TLS CERT
locals {
  tlscert_repository = {
    organization   = "pagopa"
    name           = "le-azure-acme-tiny"
    branch_name    = "refs/heads/master"
    pipelines_path = "."
  }
}
