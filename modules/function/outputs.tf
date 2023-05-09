output "default_hostname" {
  description = "returns a string"
  value       = azurerm_function_app.this.default_hostname
}

output "id" {
  description = "returns a string"
  value       = azurerm_function_app.this.id
}

output "outbound_ip_addresses" {
  description = "returns a string"
  value       = azurerm_function_app.this.outbound_ip_addresses
}

output "possible_outbound_ip_addresses" {
  description = "returns a string"
  value       = azurerm_function_app.this.possible_outbound_ip_addresses
}

output "this" {
  value = azurerm_function_app.this
}