terraform {

}

provider "azurerm" {

  features {

  }

}

resource "azurerm_resource_group" "rsg" {
  for_each = var.rsg
  name     = each.value.name
  location = each.value.location

}

variable "rsg"{
    type = map(any)

    default = { 
        rg1 = {
      location = "UK South"
      name = "value001"
      #tags = {}
    },
    
    rg2={
        name = "rsg2"
        location = "West Europe"
    }
    }
}

variable "rsg_obj" {

  type = map(string)
  default = {
    "rsgname001" = "UK South"
    "rsg02name"  = "East US"
  }

}

resource "azurerm_resource_group" "rsg01" {
    for_each = var.rsg_obj
    name = each.key
    location = each.value

}

data "azurerm_virtual_network" "vnet" {
    name = ""
    resource_group_name = ""
  
}

resource "azurerm_subnet" "sub" {

    for_each = var.subnet
    name = each.key
    address_prefixes = each.value.prefix
    service_endpoints = each.value.service_tags
  
}

variable "subnet"{
    type = map(any)

    default = { 
        subnet1 = {
      prefix = ["10.2.0.0/24"]
      service_tags = ["Microsoft.Storage"]
    },
    
    subnet2={
       prefix = ["10.3.0.0/24"]
      service_tags = ["Microsoft.Storage"]
    }
    }
}