resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

resource "azurerm_subnet" "this" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes

  dynamic "delegation" {
    for_each = each.value.name == "DB-Subnet" ? [1] : []
    content {
      name = "postgresql-delegation"
      service_delegation {
        name = "Microsoft.DBforPostgreSQL/flexibleServers"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/action"
        ]
      }
    }
  }   
}
