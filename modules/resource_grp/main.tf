resource "azurerm_resource_group" "rg" {
  name     = var.base_name
  location = var.location
}