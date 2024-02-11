output "ec2_instance_publicip" {
  description = "ec2 instance publicip"
  value       = aws_instance.myec2Demo.public_ip
}

output "ec2_public_dns" {
  description = "ec2 instance public DNS"
  value       = aws_instance.myec2Demo.public_dns
}