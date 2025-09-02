terraform {
  required_version = ">= 1.6.5"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.4"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.12"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  alias           = "dev"
  subscription_id = data.azurerm_subscriptions.dev.subscriptions[0].subscription_id
}

provider "azurerm" {
  features {}
  alias           = "uat"
  subscription_id = data.azurerm_subscriptions.uat.subscriptions[0].subscription_id
}

provider "azurerm" {
  features {}
  alias           = "prod"
  subscription_id = data.azurerm_subscriptions.prod.subscriptions[0].subscription_id
}

module "__v3__" {
  # https://github.com/pagopa/terraform-azurerm-v3/releases/tag/v8.102.0
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git?ref=c704288151f6226e5b33ed07b7d9e810ded0ea06"
}

module "__devops_v0__" {
  # https://github.com/pagopa/azuredevops-tf-modules/releases/tag/v9.5.0
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git?ref=0ae8d9d49f92f690afc66a39f245924a04aa274b"
}
