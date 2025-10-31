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
  # https://github.com/pagopa/terraform-azurerm-v3/releases/tag/v8.98.0
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git?ref=4ac32cd6fb7d56e7be3b1c0dbcbf251f5b0cd199"
}

module "__devops_v0__" {
  # https://github.com/pagopa/azuredevops-tf-modules/releases/tag/v9.5.0
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git?ref=0ae8d9d49f92f690afc66a39f245924a04aa274b"
}
