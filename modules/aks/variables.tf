variable "base_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "node_pools" {
  type = any
  default = []
}

variable "tags" {
  type = map(string)
  default = {}
}