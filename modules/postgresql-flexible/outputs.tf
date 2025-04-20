output "postgresql_server_name" {
  value = azurerm_postgresql_flexible_server.this.name
}

output "postgresql_fqdn" {
  value = azurerm_postgresql_flexible_server.this.fqdn
}
