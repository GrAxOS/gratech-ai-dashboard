terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

variable "rg_name" {
  type    = string
  default = "gratech-resource-group"
}

variable "location" {
  type    = string
  default = "eastus2"
}

# TODO: add azurerm_search_service, azurerm_api_management, app service or aks modules
