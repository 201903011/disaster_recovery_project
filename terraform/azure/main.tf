terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.29.0"
    }
  }
}


provider "azurerm" {
  resource_provider_registrations = "none"
  subscription_id                 = "e81ab642-317a-40f6-afb8-c818940e87a3"
  features {}
}

module "rg" {
  source   = "./modules/resource_group"
  name     = "myresource-group"
  location = "East US"
}

module "network" {
  source              = "./modules/network"
  vnet_name           = "myvnet"
  vnet_cidr           = "20.0.0.0/16"
  subnet_cidr         = "20.0.1.0/24"
  gateway_cidr        = "20.0.255.0/24"
  location            = module.rg.location
  resource_group_name = module.rg.name
}

module "lb" {
  source              = "./modules/loadbalancer"
  resource_group_name = module.rg.name
  location            = module.rg.location
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = module.rg.name
  location            = module.rg.location
  subnet_id           = module.network.subnet_id
  lb_backend_pool_id  = module.lb.backend_pool_id
}

module "bastion" {
  source       = "./modules/bastion"
  bastion_cidr = "20.0.2.0/27"
  vnet         = module.network.vnet_name
}

module "gateway" {
  source               = "./modules/gateway"
  location             = module.rg.location
  resource_group_name  = module.rg.name
  aws_vpn_public_ip    = "3.230.240.3"
  aws_cidr             = "10.0.0.0/16"
  shared_secret        = "YourSuperSecretKey123"
  gateway_cidr         = "20.0.255.0/24"
  virtual_network_name = "myvnet"
}


