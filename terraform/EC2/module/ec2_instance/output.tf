output "public_ip_host_1" {
  value       = resource.aws_instance.host_1.public_ip
}
output "private_ip_host_1" {
  value       = resource.aws_instance.host_1.private_ip
}

output "availability_zone_host_1" {
  value       = resource.aws_instance.host_1.availability_zone
}
