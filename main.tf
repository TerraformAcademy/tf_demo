terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.40.0, <3.45.0"

    }
  }
  backend "azurerm" {
    resource_group_name  = "RG0001"
    storage_account_name = "kotnalaa"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }

  #required_version = "1.4.0"
}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  features {

  }

}



resource "azurerm_resource_group" "name" {

  name     = "testrgdemotf01"
  location = var.location
  tags = {
    "key"  = "value"
    "key2" = "value2"
  }

}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet1"
  location            = var.location
  resource_group_name = azurerm_resource_group.name.name
  address_space       = ["10.0.0.0/22"]

}


resource "azurerm_resource_group" "rsg001" {
  name     = "kotnalaweb-rg"
  location = "South Central US"
  tags = {
    "name" = "sunil"
  }

}