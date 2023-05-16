variable "app_service_plan_id" {
  description = "(required)"
  type        = string
}

variable "app_settings" {
  description = "(optional)"
  type        = map(string)
  default     = {}
}

variable "daily_memory_time_quota" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "builtin_logging_enabled" {
  description = "(optional)"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "(optional)"
  type        = bool
  default     = true
}

variable "location" {
  description = "(required)"
  type        = string
}

variable "name" {
  description = "(required)"
  type        = string
}


variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "storage_account_access_key" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "(optional)"
  type        = string
  default     = null
}


variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = {}
}

variable "virtual_network_subnet_id" {
  type        = string
  default     = null
  description = "Optional"

}

variable "https_only" {
  type        = bool
  default     = false
  description = "(Optional) Can the Function App only be accessed via HTTPS?"
}

variable "connection_string" {
  description = "nested block: NestingSet, min items: 0, max items: 0"
  type = set(object(
    {
      name  = string
      type  = string
      value = string
    }
  ))
  default = []
}

variable "identity" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      identity_ids = list(string)
      type         = string
    }
  ))
  default = []
}

variable "site_config" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      always_on                              = optional(bool, false)
      api_definition_url                     = optional(string)
      api_management_api_id                  = optional(string)
      app_command_line                       = optional(string)
      app_scale_limit                        = optional(number)
      application_insights_connection_string = optional(string, null)
      application_insights_key               = optional(string, null)
      application_stack = optional(map(object({
        docker                      = optional(map(object({})))
        dotnet_version              = optional(string)
        use_dotnet_isolated_runtime = optional(bool, false)
        java_version                = optional(string)
        node_version                = optional(string)
        python_version              = optional(string)
        powershell_core_version     = optional(string)
        use_custom_runtime          = optional(bool, false)
      })), {})
      ftps_state             = optional(string, "Disabled")
      http2_enabled          = optional(bool, false)
      vnet_route_all_enabled = optional(bool, false)
    }
  ))
  default = [{}]
}

variable "create_private_endpoint" {
  type        = bool
  default     = false
  description = "Wether to creat a private endpoint or not."
}

variable "pe_subnet_id" {
  type        = string
  default     = null
  description = "Subnet ID for creating Private Endpoint in."
}

variable "zip_deploy_file" {
  type        = string
  description = "(Optional) The local path and filename of the Zip packaged application to deploy to this Linux Function App."
  default     = null

}