output "vnet" {
  value = azurerm_virtual_network.this
}
output "private-subnet" {
  value = azurerm_subnet.private
}
output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}
