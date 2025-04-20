resource "azurerm_postgresql_flexible_server" "this" {
  name                   = var.name
  location               = var.location
  resource_group_name    = var.resource_group_name
  version                = "16"
  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  sku_name   = "GP_Standard_D2ds_v5"
  storage_mb = 131072

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  delegated_subnet_id = var.delegated_subnet_id
  private_dns_zone_id = var.private_dns_zone_id

  authentication {
    password_auth_enabled = true
  }

  tags = var.tags
}
