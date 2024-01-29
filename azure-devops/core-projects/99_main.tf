terraform {
  required_version = ">= 1.1.5"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "<= 0.11.0"
    }
    azurerm = {
      version = "<= 3.85.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
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

