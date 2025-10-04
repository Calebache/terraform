variable "environment" {
  description = "The environment for the VM (e.g., dev, prod)"
  type        = string
  
}

variable "region_short_code" {
  description = "Short code for the region (e.g., us, eu)"
  type        = string
  
}

variable "location" {
  description = "The Azure region where the VM will be created"
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the VM"
  type        = string
  
}