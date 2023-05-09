variable "name" {
  description = "(Required) Specifies the name of the EventHub resource."
  type        = string
}

variable "namespace_name" {
  description = "(Required) Specifies the name of the EventHub Namespace."
  type        = string
}

variable "resource_group_name" {
  description = " (Required) The name of the resource group in which the EventHub's parent Namespace exists."
  type        = string
}

variable "partition_count" {
  description = "(Required) Specifies the current number of shards on the Event Hub."
  type        = number
}

variable "message_retention" {
  description = "(Required) Specifies the number of days to retain the events for this Event Hub."
  type        = number
}

variable "capture_description" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      destination = list(object(
        {
          archive_name_format = string
          blob_container_name = string
          name                = string
          storage_account_id  = string
        }
      ))
      enabled             = bool
      encoding            = string
      interval_in_seconds = number
      size_limit_in_bytes = number
      skip_empty_archives = bool
    }
  ))
  default = []
}

variable "timeouts" {
  description = "nested block: NestingSingle, min items: 0, max items: 0"
  type = set(object(
    {
      create = string
      delete = string
      read   = string
      update = string
    }
  ))
  default = []
}