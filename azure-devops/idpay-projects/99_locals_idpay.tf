locals {

  idpay-fe-common-variables_deploy = {

    blob_container_name = "$web"

    git_mail          = "TODO" //module.secrets.values["io-azure-devops-github-EMAIL"].value
    git_username      = "TODO" //module.secrets.values["io-azure-devops-github-USERNAME"].value
    github_connection = "TODO" //azuredevops_serviceendpoint_github.io-azure-devops-github-rw.service_endpoint_name

    dev_azure_subscription = local.service_endpoint_azure_dev_id
    dev_cdn_endpoint       = "cstar-d-weu-idpay-idpaycdn-cdn-endpoint"
    dev_cdn_profile        = "cstar-d-weu-idpay-idpaycdn-cdn-profile"
    dev_resource_group     = "cstar-d-idpay-cdn-rg"
    dev_storage_account    = "cstardweuidpayidpaycdnsa"
    dev_analytics_enabled  = "true"
    dev_analytics_mocked   = "true" //Put to false when mixpanel available
    dev_mixpanel_token     = "TODO" //"6e1290bdda5885981a2f443f37444f0f"
    dev_onetrust_domain_id = "TODO" //"a8f58d7a-7f6a-4fe6-ac02-f95bac3876d4-test"

    uat_azure_subscription = local.service_endpoint_azure_uat_id
    uat_cdn_endpoint       = "cstar-u-weu-idpay-idpaycdn-cdn-endpoint"
    uat_cdn_profile        = "cstar-u-weu-idpay-idpaycdn-cdn-profile"
    uat_resource_group     = "cstar-u-idpay-cdn-rg"
    uat_storage_account    = "cstaruweuidpayidpaycdnsa"
    uat_analytics_enabled  = "true"
    uat_analytics_mocked   = "true" //Put to false when mixpanel available
    uat_mixpanel_token     = "TODO" //"1d1b09b008638080ab34fe9b75db84fd"
    uat_onetrust_domain_id = "TODO" //"15a1f042-9257-450f-b9e8-38d019191729"

    prod_azure_subscription = local.service_endpoint_azure_prod_id
    prod_cdn_endpoint       = "cstar-p-weu-idpay-idpaycdn-cdn-endpoint"
    prod_cdn_profile        = "cstar-p-weu-idpay-idpaycdn-cdn-profile"
    prod_resource_group     = "cstar-p-idpay-cdn-rg"
    prod_storage_account    = "cstarpweuidpayidpaycdnsa"
    prod_analytics_enabled  = "true"
    prod_analytics_mocked   = "true" //Put to false when mixpanel available
    prod_mixpanel_token     = "TODO" //"1d1b09b008638080ab34fe9b75db84fd"
    prod_onetrust_domain_id = "TODO" //"084d5de2-d423-458a-9b28-0f8db3e55e71"

    react_app_assistance_email = "selfcare@assistenza.pagopa.it"

    dev_react_app_url_cdn                           = "https://welfare.dev.cstar.pagopa.it/"
    dev_react_app_url_storage                       = "https://cstardweuidpayidpaycdnsa.z6.web.core.windows.net/"
    dev_react_app_url_fe_pre_login                  = "https://api-io.dev.cstar.pagopa.it/idpay/welfare/token"
    dev_react_app_url_fe_pre_login_merchants        = "https://api-io.dev.cstar.pagopa.it/idpay/merchant/token"
    dev_react_app_url_fe_login                      = "https://dev.selfcare.pagopa.it/auth"
    dev_react_app_url_fe_assistance_merchants       = "/portale-esercenti/assistenza"
    dev_react_app_url_fe_landing                    = "https://dev.selfcare.pagopa.it/auth/logout"
    dev_react_app_url_api_initiative                = "https://api-io.dev.cstar.pagopa.it/idpay/initiative"
    dev_react_app_url_api_groups                    = "https://api-io.dev.cstar.pagopa.it/idpay/group"
    dev_react_app_url_api_role_permission           = "https://api-io.dev.cstar.pagopa.it/idpay/authorization"
    dev_react_app_url_api_email_notification        = "https://api-io.dev.cstar.pagopa.it/idpay/email-notification"
    dev_react_app_url_api_merchants                 = "https://api-io.dev.cstar.pagopa.it/idpay/merchant"
    dev_react_app_url_api_merchants_portal          = "https://api-io.dev.cstar.pagopa.it/idpay/merchant/portal"
    dev_react_app_one_trust_otnotice_cdn_url        = "https://privacyportalde-cdn.onetrust.com/privacy-notice-scripts/otnotice-1.0.min.js"
    dev_react_app_one_trust_otnotice_cdn_settings   = "eyJjYWxsYmFja1VybCI6Imh0dHBzOi8vcHJpdmFjeXBvcnRhbC1kZS5vbmV0cnVzdC5jb20vcmVxdWVzdC92MS9wcml2YWN5Tm90aWNlcy9zdGF0cy92aWV3cyJ9"
    dev_react_app_one_trust_privacy_policy_id       = "otnotice-5b7fed3e-ea34-4620-b01d-b17fa7c88441"
    dev_react_app_one_trust_privacy_policy_json_url = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/5b7fed3e-ea34-4620-b01d-b17fa7c88441.json"
    dev_react_app_one_trust_tos_id                  = "otnotice-6240fe7c-a66c-4395-a5c6-f1fee15e8258"
    dev_react_app_one_trust_tos_json_url            = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/6240fe7c-a66c-4395-a5c6-f1fee15e8258.json"


    uat_react_app_url_cdn                           = "https://welfare.uat.cstar.pagopa.it/"
    uat_react_app_url_storage                       = "https://cstaruweuidpayidpaycdnsa.z6.web.core.windows.net/"
    uat_react_app_url_fe_pre_login                  = "https://api-io.uat.cstar.pagopa.it/idpay/welfare/token"
    uat_react_app_url_fe_pre_login_merchants        = "https://api-io.uat.cstar.pagopa.it/idpay/merchant/token"
    uat_react_app_url_fe_login                      = "https://uat.selfcare.pagopa.it/auth"
    uat_react_app_url_fe_assistance_merchants       = "/portale-esercenti/assistenza"
    uat_react_app_url_fe_landing                    = "https://uat.selfcare.pagopa.it/auth/logout"
    uat_react_app_url_api_initiative                = "https://api-io.uat.cstar.pagopa.it/idpay/initiative"
    uat_react_app_url_api_groups                    = "https://api-io.uat.cstar.pagopa.it/idpay/group"
    uat_react_app_url_api_role_permission           = "https://api-io.uat.cstar.pagopa.it/idpay/authorization"
    uat_react_app_url_api_email_notification        = "https://api-io.uat.cstar.pagopa.it/idpay/email-notification"
    uat_react_app_url_api_merchants                 = "https://api-io.uat.cstar.pagopa.it/idpay/merchant"
    uat_react_app_url_api_merchants_portal          = "https://api-io.uat.cstar.pagopa.it/idpay/merchant/portal"
    uat_react_app_one_trust_otnotice_cdn_url        = "https://privacyportalde-cdn.onetrust.com/privacy-notice-scripts/otnotice-1.0.min.js"
    uat_react_app_one_trust_otnotice_cdn_settings   = "eyJjYWxsYmFja1VybCI6Imh0dHBzOi8vcHJpdmFjeXBvcnRhbC1kZS5vbmV0cnVzdC5jb20vcmVxdWVzdC92MS9wcml2YWN5Tm90aWNlcy9zdGF0cy92aWV3cyJ9"
    uat_react_app_one_trust_privacy_policy_id       = "otnotice-5b7fed3e-ea34-4620-b01d-b17fa7c88441"
    uat_react_app_one_trust_privacy_policy_json_url = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/5b7fed3e-ea34-4620-b01d-b17fa7c88441.json"
    uat_react_app_one_trust_tos_id                  = "otnotice-6240fe7c-a66c-4395-a5c6-f1fee15e8258"
    uat_react_app_one_trust_tos_json_url            = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/draft/6240fe7c-a66c-4395-a5c6-f1fee15e8258.json"

    prod_react_app_url_cdn                           = "https://welfare.cstar.pagopa.it/"
    prod_react_app_url_storage                       = "https://cstarpweuidpayidpaycdnsa.z6.web.core.windows.net/"
    prod_react_app_url_fe_pre_login                  = "https://api-io.cstar.pagopa.it/idpay/welfare/token"
    prod_react_app_url_fe_pre_login_merchants        = "https://api-io.cstar.pagopa.it/idpay/merchant/token"
    prod_react_app_url_fe_login                      = "https://selfcare.pagopa.it/auth"
    prod_react_app_url_fe_assistance_merchants       = "/portale-esercenti/assistenza"
    prod_react_app_url_fe_landing                    = "https://selfcare.pagopa.it/auth/logout"
    prod_react_app_url_api_initiative                = "https://api-io.cstar.pagopa.it/idpay/initiative"
    prod_react_app_url_api_groups                    = "https://api-io.cstar.pagopa.it/idpay/group"
    prod_react_app_url_api_role_permission           = "https://api-io.cstar.pagopa.it/idpay/authorization"
    prod_react_app_url_api_email_notification        = "https://api-io.cstar.pagopa.it/idpay/email-notification"
    prod_react_app_url_api_merchants                 = "https://api-io.cstar.pagopa.it/idpay/merchant"
    prod_react_app_url_api_merchants_portal          = "https://api-io.cstar.pagopa.it/idpay/merchant/portal"
    prod_react_app_one_trust_otnotice_cdn_url        = "https://privacyportalde-cdn.onetrust.com/privacy-notice-scripts/otnotice-1.0.min.js"
    prod_react_app_one_trust_otnotice_cdn_settings   = "eyJjYWxsYmFja1VybCI6Imh0dHBzOi8vcHJpdmFjeXBvcnRhbC1kZS5vbmV0cnVzdC5jb20vcmVxdWVzdC92MS9wcml2YWN5Tm90aWNlcy9zdGF0cy92aWV3cyJ9"
    prod_react_app_one_trust_privacy_policy_id       = "otnotice-5b7fed3e-ea34-4620-b01d-b17fa7c88441"
    prod_react_app_one_trust_privacy_policy_json_url = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/5b7fed3e-ea34-4620-b01d-b17fa7c88441.json"
    prod_react_app_one_trust_tos_id                  = "otnotice-6240fe7c-a66c-4395-a5c6-f1fee15e8258"
    prod_react_app_one_trust_tos_json_url            = "https://privacyportalde-cdn.onetrust.com/77f17844-04c3-4969-a11d-462ee77acbe1/privacy-notices/6240fe7c-a66c-4395-a5c6-f1fee15e8258.json"

  }

}
