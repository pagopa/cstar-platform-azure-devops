terraform {
  required_version = ">= 1.7.5"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "<= 1.3.1"
    }
    azurerm = {
      version = "<= 3.107.0"
    }
    null = {
      version = "<= 3.2.1"
    }
    time = {
      version = "<= 1.3.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
}

provider "azurerm" {
  alias = "dev"
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  subscription_id = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
}

provider "azurerm" {
  alias = "uat"
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  subscription_id = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
}

provider "azurerm" {
  alias = "prod"
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  subscription_id = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id
}

data "azurerm_client_config" "current" {}

data "azurerm_subscriptions" "prod" {
  display_name_prefix = var.prod_subscription_name
}

data "azurerm_subscriptions" "uat" {
  display_name_prefix = var.uat_subscription_name
}

data "azurerm_subscriptions" "dev" {
  display_name_prefix = var.dev_subscription_name
}

#
# Modules
#
module "__azdo__" {
  # https://github.com/pagopa/azuredevops-tf-modules/releases/tag/v9.2.1
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git?ref=7e23d73d22e7b37352c25a32cc40f6f42b6569ea"
}

module "__v3__" {
  # https://github.com/pagopa/terraform-azurerm-v3/releases/tag/v8.42.3
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git?ref=7dbbc06d591d3ce66536a7bdb2208b1370de04dd"
}
