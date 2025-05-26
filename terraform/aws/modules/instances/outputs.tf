output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

output "jenkins_instance_id" {
  value = aws_instance.jenkins.id
}

output "toolmachine_instance_id" {
  value = aws_instance.toolmachine.id
}

output "app1_instance_id" {
  value = aws_instance.app1.id
}

output "app2_instance_id" {
  value = aws_instance.app2.id
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}




