terraform {
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version = ">=3.40.0, <3.45.0"
       
         }
  }

  #required_version = "1.4.0"
}
provider "azurerm" {

  subscription_id =  var.subscription_id 
  tenant_id = var.tenant_id 
  client_id = var.client_id 
  client_secret = var.client_secret 
  features {
    
  }

}

resource "azurerm_resource_group" "name" {
    name = "testrgdemotf01"
    location = var.location
  tags = {
    "key" = "value"
    "key2" = "value2"
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}