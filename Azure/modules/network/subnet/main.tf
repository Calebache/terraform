resource "azurerm_subnet" "snet" {
  name                            = "snet-${var.environment}-${var.region_code}-${lower(var.subnet_name)}"
  resource_group_name             = var.resource_group_name
  virtual_network_name            = var.virtual_network_name
  address_prefixes                = var.subnet_range
  default_outbound_access_enabled = var.enable_public_subnet

  dynamic "delegation" {
    for_each = var.delegations == null ? [] : var.delegations

    content {
      name = "delegation"
      service_delegation {
        name    = delegation.value["name"]
        actions = delegation.value["actions"]
      }
    }
  }
}