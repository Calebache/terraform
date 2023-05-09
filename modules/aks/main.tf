
resource "azurerm_kubernetes_cluster" "this" {
  name                = var.base_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.base_name}-dns"

  dynamic "default_node_pool" {
    for_each = var.node_pools
    content{
        name = default_node_pool.value.name
        enable_auto_scaling = lookup(default_node_pool.value, "enable_auto_scaling", true)
        max_count = lookup(default_node_pool.value, "max_count", 2)
        min_count = lookup(default_node_pool.value, "min_count", 1)
        node_count = lookup(default_node_pool.value, "node_count", 1)
        vm_size = lookup(default_node_pool.value, "vm_size", "Standard_DS2_v2")
        os_disk_size_gb = lookup(default_node_pool.value, "os_diskSize_gb", 128)
        zones = lookup(default_node_pool.value, "zones",["1", "2", "3"])
        tags = merge(var.tags, { Name = var.name })
    }
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  tags = merge(var.tags, {Name = var.base_name})
}
