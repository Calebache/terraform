variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "region_code" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "network_interface_id" {
  type = string
}

variable "security_rules" {
  type = list(object({
    name                       = string
    priority                   = string
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = optional(string)
    source_address_prefixes    = optional(list(string))
    destination_address_prefix = string
  }))
  default = []
}