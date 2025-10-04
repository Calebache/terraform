variable "name" {
  description = "The name of the resource group"
}

variable "environment" {
  description = "The environment for the resource group (e.g., dev, stg, prod)"
  type        = string
  
}

variable "region_short_code" {
  description = "Short code for the region (e.g., us, eu, cc)"
  type        = string
  
}

variable "location" {
  description = "The Azure region where the resource group will be created"
  type        = string
}