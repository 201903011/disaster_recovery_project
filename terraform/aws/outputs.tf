
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_a_id" {
  value = module.vpc.private_subnet_a_id
}

output "private_subnet_b_id" {
  value = module.vpc.private_subnet_b_id
}

output "bastion_sg_id" {
  value = module.security_groups.bastion_sg_id
}

output "private_sg_id" {
  value = module.security_groups.private_sg_id
}

output "lb_sg_id" {
  value = module.security_groups.lb_sg_id
}

