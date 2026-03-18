resource "azurerm_private_dns_zone" "pdnsz" {
  name                = "pdnsz-${var.environment}-${var.region_code}-${lower(var.private_dns_zone_name)}"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "pdnsvnl" {
  name                  = "pdnsvnl-${var.environment}-${var.region_code}-${lower(var.private_dns_zone_name)}"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.pdnsz.name
  virtual_network_id    = var.virtual_network_id
}