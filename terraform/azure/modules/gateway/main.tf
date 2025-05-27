resource "azurerm_public_ip" "vpn_gw_ip" {
  name                = "vpn-gw-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# resource "azurerm_virtual_network_gateway" "vpn_gw" {
#   name                = "azure-vpn-gw"
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   type          = "Vpn"
#   vpn_type      = "RouteBased"
#   active_active = false
#   enable_bgp    = false
#   sku           = "VpnGw1"

#   ip_configuration {
#     name                          = "vpn-ipconfig"
#     public_ip_address_id          = azurerm_public_ip.vpn_gw_ip.id
#     subnet_id                     = azurerm_subnet.subnet_gateway.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_subnet" "subnet_gateway" {
#   name                 = "GatewaySubnet"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = var.virtual_network_name
#   address_prefixes     = [var.gateway_cidr]
# }


# resource "azurerm_local_network_gateway" "aws" {
#   name                = "aws-vpn-peer"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   gateway_address     = var.aws_vpn_public_ip
#   address_space       = [var.aws_cidr]
# }


# resource "azurerm_virtual_network_gateway_connection" "aws_connection" {
#   name                       = "vpn-to-aws"
#   location                   = var.location
#   resource_group_name        = var.resource_group_name
#   virtual_network_gateway_id = azurerm_virtual_network_gateway.vpn_gw.id
#   local_network_gateway_id   = azurerm_local_network_gateway.aws.id
#   type                       = "IPsec"
#   shared_key                 = var.shared_secret
#   enable_bgp                 = false
# }
