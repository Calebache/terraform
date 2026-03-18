variable "name" {
  type = string
}

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

variable "address_space" {
  type = list(any)
}

variable "dns_servers" {
  type = list(any)
  default = []
}