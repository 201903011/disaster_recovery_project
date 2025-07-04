variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_a_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_b_cidr" {
  default = "10.0.2.0/24"
}

variable "private_subnet_a_cidr" {
  default = "10.0.3.0/24"
}

variable "private_subnet_b_cidr" {
  default = "10.0.4.0/24"
}

variable "az_zone_1" {
  default = "us-east-1a"
}

variable "az_zone_2" {
  default = "us-east-1b"
}

variable "azure_vpn_public_ip" {
}

variable "shared_secret" {
}

variable "azure_vnet_cidr" {
}
