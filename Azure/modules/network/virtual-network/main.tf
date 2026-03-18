resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.environment}-${var.region_code}-${lower(var.name)}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers

}