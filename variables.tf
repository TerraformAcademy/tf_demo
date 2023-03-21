variable "subscription_id" {
  type = string

}

variable "tenant_id" {

}

variable "client_id" {

}

variable "client_secret" {}

variable "location" {
  default = "East US"

}

variable "tags" {
  type = map(any)
  default = {
    "env" = "prod"
  }

}

variable "listvar" {

  type    = list(string)
  default = []

}