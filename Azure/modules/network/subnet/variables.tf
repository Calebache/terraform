variable "resource_group_name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "region_code" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_range" {
  type = list(string)
}

variable "enable_public_subnet" {
  type    = bool
  default = false
}

variable "delegations" {
  type = list(
    object(
      {
        name    = string
        actions = list(string)
      }
    )
  )
  default = []
}