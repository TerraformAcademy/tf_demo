variable "app_service_plan_id" {
  description = "(required)"
  type        = string
}

variable "app_settings" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "daily_memory_time_quota" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "builtin_logging_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "https_only" {
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
    type = string
    default = "null"
    description = "Optional"
  
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
      always_on           = bool
      cors = list(object(
        {
          allowed_origins     = set(string)
          support_credentials = bool
        }
      ))
      ftps_state        = string
      health_check_path = string
      http2_enabled     = bool
      ip_restriction = list(object(
        {
          action                    = string
          ip_address                = string
          name                      = string
          priority                  = number
          service_tag               = string
          subnet_id                 = string
          virtual_network_subnet_id = string
        }
      ))
      min_tls_version           = string
      pre_warmed_instance_count = number
      scm_ip_restriction = list(object(
        {
          action                    = string
          ip_address                = string
          name                      = string
          priority                  = number
          service_tag               = string
          subnet_id                 = string
          virtual_network_subnet_id = string
        }
      ))
      scm_type                    = string
      scm_use_main_ip_restriction = bool
      use_32_bit_worker_process   = bool
      websockets_enabled          = bool
    }
  ))
  default = []
}

variable "create_private_endpoint"{
  type = bool
  default = false
  description = "Wether to creat a private endpoint or not."
}

variable "pe_subnet_id" {
  type = string
  default = null
  description = "Subnet ID for creating Private Endpoint in."
}

variable "zip_deploy_file" {
  type = string
  description = "(Optional) The local path and filename of the Zip packaged application to deploy to this Linux Function App."
  default = null
  
}