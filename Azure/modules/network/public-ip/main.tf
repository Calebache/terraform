resource "azurerm_public_ip" "pip" {
  name                = "pip-${var.environment}-${var.region_code}-${lower(var.public_ip_name)}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  ip_version          = var.ip_version
  sku                 = var.sku

}