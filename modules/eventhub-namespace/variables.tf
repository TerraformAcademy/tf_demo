variable "name" {
  description = "(Required) Specifies the name of the EventHub Namespace resource."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the namespace."
  type        = string
}

variable "sku" {
  description = "(Required) Defines which tier to use. Valid options are Basic, Standard, and Premium. Please note that setting this field to Premium will force the creation of a new resource."
  type        = string
}

variable "auto_inflate_enabled" {
  description = "(Optional) Is Auto Inflate enabled for the EventHub Namespace?"
  type        = bool
  default     = false
}

variable "capacity" {
  description = "(Optional) Specifies the Capacity / Throughput Units for a Standard SKU namespace. Default capacity has a maximum of 2, but can be increased in blocks of 2 on a committed purchase basis. Defaults to 1."
  type        = number
  default     = 1
}

variable "dedicated_cluster_id" {
  description = "(Optional) Specifies the ID of the EventHub Dedicated Cluster where this Namespace should created. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "maximum_throughput_units" {
  description = "(Optional) Specifies the maximum number of throughput units when Auto Inflate is Enabled. Valid values range from 1 - 20."
  type        = number
  default     = null
}

variable "network_rulesets" {
  description = "(optional)"
  type = list(object(
    {
      default_action = string
      ip_rule = list(object(
        {
          action  = string
          ip_mask = string
        }
      ))
      trusted_service_access_enabled = bool
      virtual_network_rule = list(object(
        {
          ignore_missing_virtual_network_service_endpoint = bool
          subnet_id                                       = string
        }
      ))
    }
  ))
  default = null
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "zone_redundant" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "identity" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      identity_ids = string
      type         = string
    }
  ))
  default = []
}
