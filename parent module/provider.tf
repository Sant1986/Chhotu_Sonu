terraform {
  # backend "azurerm" {
  #   subscription_id      = "a46e2f32-e4a1-44bf-946c-f3fa4a273aa1"
  #   resource_group_name  = "sonu-backend-rg"
  #   storage_account_name = "sonutfstg"
  #   container_name       = "tfstate"
  #   key                  = "sonu.azure.tfstate"
  # }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "a46e2f32-e4a1-44bf-946c-f3fa4a273aa1"
}

