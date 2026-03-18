variable "environment" {
  description = "The environment for the VM (e.g., dev, stg, prod)"
  type        = string

}

variable "region_short_code" {
  description = "Short code for the region (e.g., us, eu, cc)"
  type        = string

}

variable "vm_name" {
  description = "The base name for the VM"
  type        = string

}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the VM"
  type        = string
}

variable "location" {
  description = "The Azure region where the VM will be created"
  type        = string
}

variable "size" {
  description = "The size of the VM (e.g., Standard_DS1_v2)"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "The public SSH key for the admin user"
  type        = string
}

variable "network_interface_ids" {
  description = "List of network interface IDs to attach to the VM"
  type        = list(any)
}

variable "os_disk_caching" {
  description = "The caching type for the OS disk (e.g., ReadWrite, ReadOnly, None)"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk (e.g., StandardSSD_LRS, Premium_LRS)"
  type        = string
  default     = "Standard_LRS"
}

variable "image_publisher" {
  description = "The publisher of the image to use for the VM"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  description = "The offer of the image to use for the VM"
  type        = string
  default     = "WindowsServer"
}

variable "image_sku" {
  description = "The SKU of the image to use for the VM"
  type        = string
  default     = "2016-Datacenter"
}

variable "image_version" {
  description = "The version of the image to use for the VM"
  type        = string
  default     = "latest"
}

variable "identity_type" {
  description = "The type of identity to assign to the VM (e.g., SystemAssigned, UserAssigned, None)"
  type        = string
  default     = "SystemAssigned"
}

