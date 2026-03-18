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

## resource groups
module "resource_group" {
  source = "./modules/resource-group"
  name              = var.resource_group_name
  environment       = var.environment
  region_short_code = var.region_short_code
  location          = var.location
}

## virtual network
module "vnet" {
  source = "./modules/network/virtual-network"
  name = var.virtual_network_name
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  address_space = var.address_space
  environment       = var.environment
  region_code = var.region_short_code

  depends_on = [ module.resource_group ]
}

## jump server
module "jump_server" {
  source = "./modules/compute"
  name                  = var.jump_server_name
  environment           = var.environment
  region_short_code     = var.region_short_code
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  size                  = "Standard_DS1_v2"
  admin_username        = "adminuser"
  admin_ssh_key         = file("id_rsa.pub")
  image_offer           = "0001-com-ubuntu-server-jammy"
  image_publisher       = "Canonical"
  image_sku             = "20_04-lts-gen2"
  image_version         = "latest"
  identity_type         = var.identity_type
  network_interface_ids = [azurerm_network_interface.main.id]

}