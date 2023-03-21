resource "azurerm_resource_group" "rsg" {
  count    = length(var.resource_group)
  name     = var.resource_group[count.index].name
  location = var.resource_group[count.index].location
  tags     = local.tags

}



variable "resource_group" {

  type = list(object({
    name     = string
    location = string

  }))

  default = [{
    location = "east us"
    name     = "testrg903840"
    },
    # {
    #   name     = "rearare9283"
    #   location = "uk south"
    # },
    {
      name     = "tseeradas3223"
      location = "UK West"
    }

  ]

}

variable "tags" {

    default = {}
  
}