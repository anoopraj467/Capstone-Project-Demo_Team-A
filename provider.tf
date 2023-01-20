terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.27"
    }
  }
  backend "azurerm" {
    resource_group_name = "remote-backend"
    storage_account_name = "capstoneprojectdemo"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }

  required_version = ">= 0.14"
}

provider "azurerm" {
  features {}
}
