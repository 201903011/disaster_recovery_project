
variable "resource_group_name" {}
variable "location" {}

output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.pool.id
}
