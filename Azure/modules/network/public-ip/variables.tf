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

variable "public_ip_name" {
  type = string
}

variable "allocation_method" {
  type = string
  default = "Static"
}

variable "ip_version" {
  type = string
  default = "IPv4"
}

variable "sku" {
  type = string
  default = "Standard"
}