
variable "vnet_name" {}
variable "vnet_cidr" {}
variable "subnet_cidr" {}
variable "gateway_cidr" {}
variable "location" {}
variable "resource_group_name" {}

output "subnet_id" {
  value = azurerm_subnet.private.id
}

output "vnet_name" {
  value = azurerm_virtual_network.this.name
}
