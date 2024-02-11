output "ec2_instance_publicip" {
  description = "ec2 instance publicip"
  value       = aws_instance.myec2Demo.public_ip
}

output "ec2_public_dns" {
  description = "ec2 instance public DNS"
  value       = aws_instance.myec2Demo.public_dns
}


# for loop with list

output "for_output_list" {
  description = "For loop with list"
  value       = [for instance in aws_instance.myec2Demo : instance.public_dns]

}

# for loop with map

output "for_output_map1" {
  description = "For loop with map1"
  value       = { for instance in aws_instance.myec2Demo : instance.id => install.public_dns }
}

# for loop with map advance

output "for_output_map_advance" {
  description = "For loop with map advance"
  value       = { for c, instance in aws_instance.myec2Demo : c => instance.public_dns }
}

# Output Legacy Splat Operator (Legacy) - Returns the List
/*
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value = aws_instance.myec2vm.*.public_dns
}
*/

# Output Latest Generalized Splat Operator - Returns the List
output "latest_splat_instance_publicdns" {
  description = "Generalized latest Splat Operator"
  value       = aws_instance.myec2Demo[*].public_dns
}
