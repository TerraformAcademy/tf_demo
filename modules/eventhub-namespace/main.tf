resource "azurerm_eventhub_namespace" "this" {
  name = var.name
  location = var.location
  resource_group_name = var.resource_group_name
  sku = var.sku
  capacity = var.capacity
  auto_inflate_enabled = var.auto_inflate_enabled
  dedicated_cluster_id = var.dedicated_cluster_id
  maximum_throughput_units = var.maximum_throughput_units
  network_rulesets = var.network_rulesets
  tags = var.tags
  zone_redundant = var.zone_redundant

  dynamic "identity" {
    for_each = var.identity
    content {
      type = identity.value["type"]
    }
  }
}