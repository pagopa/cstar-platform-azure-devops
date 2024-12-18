terraform {
  required_version = ">= 1.7.5"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.2"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116"
    }
    null = {
      version = "<= 3.2.1"
    }
    time = {
      version = "<= 0.11.0"
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

module "__v3__" {
  # https://github.com/pagopa/terraform-azurerm-v3/releases/tag/v8.63.0
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git?ref=50f4db15d35bebedc8251139346fd0fac9ac6ca2"
}

module "__devops_v0__" {
  # https://github.com/pagopa/azuredevops-tf-modules/releases/tag/v9.2.1
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git?ref=7e23d73d22e7b37352c25a32cc40f6f42b6569ea"
}
