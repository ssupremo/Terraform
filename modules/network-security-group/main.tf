resource "azurerm_network_security_group" "this" {
  for_each            = var.nsgs
  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = var.nsgs
  subnet_id = each.value.subnet_id
  network_security_group_id = azurerm_network_security_group.this[each.key].id
}
