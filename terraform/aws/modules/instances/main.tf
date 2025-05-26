resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_a_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.bastion_sg_id]
  associate_public_ip_address = true
  private_ip                  = cidrhost(var.public_subnet_a_cidr, 10)

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "jenkins" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_a_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.private_sg_id]
  associate_public_ip_address = false
  private_ip                  = cidrhost(var.private_subnet_a_cidr, 10)


  tags = {
    Name = "jenkins"
  }
}

resource "aws_instance" "toolmachine" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_a_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.private_sg_id]
  associate_public_ip_address = false
  private_ip                  = cidrhost(var.private_subnet_a_cidr, 20)


  tags = {
    Name = "toolmachine"
  }
}

resource "aws_instance" "app1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_b_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.private_sg_id]
  associate_public_ip_address = false
  private_ip                  = cidrhost(var.private_subnet_b_cidr, 10)

  tags = {
    Name = "app-1"
  }
}

resource "aws_instance" "app2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_b_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.private_sg_id]
  associate_public_ip_address = false
  private_ip                  = cidrhost(var.private_subnet_b_cidr, 20)

  tags = {
    Name = "app-2"
  }
}
