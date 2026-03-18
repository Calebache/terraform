resource "azurerm_nat_gateway" "ngw" {
  name                = "ngw-${var.environment}-${var.region_code}-${lower(var.natgw_name)}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
}

resource "azurerm_nat_gateway_public_ip_association" "example" {
  nat_gateway_id       = azurerm_nat_gateway.ngw.id
  public_ip_address_id = var.public_ip_address_id
}

resource "azurerm_subnet_nat_gateway_association" "example" {
  subnet_id      = var.subnet_id
  nat_gateway_id = azurerm_nat_gateway.ngw.id
}