terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.8"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  alias           = "dev"
  subscription_id = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  alias           = "uat"
  subscription_id = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  alias           = "prod"
  subscription_id = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id
}

module "__v3__" {
  # https://github.com/pagopa/terraform-azurerm-v3/releases/tag/v8.103.0
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git?ref=d0a0b3a81963169bdc974f79eba31e41e918e63d"
}

module "__devops_v0__" {
  # https://github.com/pagopa/azuredevops-tf-modules/releases/tag/v9.6.0
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git?ref=535f37c3fe420a70acc92bd55c073bb2438e24ba"
}
