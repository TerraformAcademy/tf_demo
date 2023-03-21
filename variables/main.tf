terraform {
  
}

provider "azurerm" {
    features {
      
    }
  
}

locals {
  #rg = lower(var.rsg)
  default_tags = {
    "created_by" = "terraform"
  }
  tags = merge(local.default_tags, var.tags)

}