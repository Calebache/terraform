provider "azurerm" {
    features {}
}

terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = ">= 4.43.0"
        }
    }

    backend "azurerm" {
        resource_group_name  = "tfstate-rg"
        storage_account_name = "tfstate2023123"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
      
    }
}

module "resource_group" {
  source = "./modules/resource-group"

  name             = var.resource_group_name
  environment      = var.environment
  region_short_code = var.region_short_code
  location         = var.location
}


module "linux_vm" {
  source = "./modules/compute"

  name             = "linux-vm"
  environment      = var.environment
  region_short_code = var.region_short_code
  resource_group_name = azurerm_resource_group.example.name
  location         = azurerm_resource_group.example.location
  size             = "Standard_DS1_v2"
  admin_username   = "adminuser"
  admin_ssh_key    = file("id_rsa.pub")
  image_offer = "0001-com-ubuntu-server-jammy"
  image_publisher = "Canonical"
  image_sku = "20_04-lts-gen2"
  image_version = "latest"
  identity_type    = "SystemAssigned"
  network_interface_ids = [azurerm_network_interface.main.id]
  
}