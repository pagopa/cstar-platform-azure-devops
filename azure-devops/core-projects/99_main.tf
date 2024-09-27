terraform {
  required_version = ">= 1.1.5"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "<= 1.1.1"
    }
    azurerm = {
      version = "<= 3.116.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  skip_provider_registration = true

  features {}
}

provider "azurerm" {
  alias                      = "dev"
  skip_provider_registration = true

  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  subscription_id = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
}

provider "azurerm" {
  alias                      = "uat"
  skip_provider_registration = true

  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  subscription_id = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
}

provider "azurerm" {
  alias                      = "prod"
  skip_provider_registration = true

  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  subscription_id = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id
}

