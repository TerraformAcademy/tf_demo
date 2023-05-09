output "id" {
  value       = azurerm_eventhub.this.id
  description = "The ID of the EventHub."

}

output "partition_ids" {
  value       = azurerm_eventhub.this.partition_ids
  description = "The identifiers for partitions created for Event Hubs."
}

output "eventhub" {
  value = azurerm_eventhub.this
  description = "Returns all properties of the eventhub."
}
