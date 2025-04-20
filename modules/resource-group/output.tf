output "resource_group_name" {
  description = "The name of the resource group that was created"
  value       = azurerm_resource_group.this.name
}

output "resource_group_location" {
  description = "The Azure region where the resource group was deployed"
  value       = azurerm_resource_group.this.location
}
