output "bastion_public_ip" {
  description = "Public IP address of the bastion host"
  value       = aws_instance.bastion.public_ip
}

output "ssh_command" {
  description = "SSH command to access the bastion host"
  value       = "ssh -i my-key ec2-user@${aws_instance.bastion.public_ip}"
}
