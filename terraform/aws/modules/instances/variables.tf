variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_a_id" {
  description = "Public Subnet A ID"
  type        = string
}

variable "private_subnet_a_id" {
  description = "Public Subnet A ID"
  type        = string
}

variable "private_subnet_b_id" {
  description = "Public Subnet A ID"
  type        = string
}

variable "bastion_sg_id" {
  description = "Security Group ID for bastion host"
  type        = string
}

variable "private_sg_id" {
  description = "Security Group ID for Jenkins and App"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
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
