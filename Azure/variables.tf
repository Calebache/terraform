variable "environment" {
  description = "The environment for the VM (e.g., dev, prod)"
  type        = string

}

variable "region_short_code" {
  description = "Short code for the region (e.g., us, eu)"
  type        = string

}

## resource group variables
variable "location" {
  description = "The Azure region where the VM will be created"
  type        = string

}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the VM"
  type        = string

}

## virtual network
variable "virtual_network_name" {
  type = string
}

variable "address_space" {
  type = list(any)
}

## jump server variables
variable "jump_server_name" {
  type = string
}

variable "identity_type" {
  type = string
  default = "SystemAssigned"
}

## 