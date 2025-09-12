terraform {
  required_version = ">= 1.1.5"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.7"
    }
    azurerm = {
      version = "~> 3.116.0"
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
  subscription_id = local.dev_subscription_id
}

provider "azurerm" {
  alias = "uat"

  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  subscription_id = local.uat_subscription_id
}

provider "azurerm" {
  alias = "prod"

  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  subscription_id = local.prod_subscription_id
}

module "__v3__" {
  # https://github.com/pagopa/terraform-azurerm-v3/releases/tag/v8.83.1
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git?ref=087a57940a67444c3b883030c54ceb78562c64ef"
}

module "__devops_v0__" {
  # https://github.com/pagopa/azuredevops-tf-modules/releases/tag/v9.6.0
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git?ref=535f37c3fe420a70acc92bd55c073bb2438e24ba"
}
