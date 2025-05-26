resource "azurerm_public_ip" "lb_ip" {
  name                = "lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "weblb" {
  name                = "weblb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "pool" {
  name            = "backend-pool"
  loadbalancer_id = azurerm_lb.weblb.id
  #   resource_group_name = var.resource_group_name
}

resource "azurerm_lb_rule" "lb_rule" {
  name = "http-rule"
  #   resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.weblb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  #   backend_address_pool_id        = azurerm_lb_backend_address_pool.pool.id
  probe_id = azurerm_lb_probe.http.id
}

resource "azurerm_lb_probe" "http" {
  name = "http-probe"
  #   resource_group_name = var.resource_group_name
  loadbalancer_id = azurerm_lb.weblb.id
  protocol        = "Tcp"
  port            = 80
}
