output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnet_a_id" {
  value = aws_subnet.private_a.id
}

output "private_subnet_b_id" {
  value = aws_subnet.private_b.id
}


output "public_subnet_a_id" {
  value = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  value = aws_subnet.public_b.id
}

output "public_subnet_a_cidr" {
  value = aws_subnet.public_a.cidr_block
}

output "public_subnet_b_cidr" {
  value = aws_subnet.public_b.cidr_block
}

output "private_subnet_a_cidr" {
  value = aws_subnet.private_a.cidr_block
}

output "private_subnet_b_cidr" {
  value = aws_subnet.private_b.cidr_block
}
