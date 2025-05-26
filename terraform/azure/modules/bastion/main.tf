resource "azurerm_public_ip" "bastion_ip" {
  name                = "myvnet-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet
  address_prefixes     = [var.bastion_cidr] # Must be at least /27 per Azure Bastion requirements
}

resource "azurerm_bastion_host" "bastion" {
  name                = "myvnet-bastion"
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_name = null

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.bastion_ip.id
  }

  sku = "Standard"
}
