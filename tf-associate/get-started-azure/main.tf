# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-learn-tf-tst"
  location = "northeurope"

  tags = {
    Environment = "Test"
    Team = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name = "myTFVnet"
  address_space = [ "10.0.0.0/16" ]
  location = "northeurope"
  resource_group_name = azurerm_resource_group.rg.name
}