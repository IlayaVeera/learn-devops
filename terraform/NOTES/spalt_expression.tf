resource "aws_instance" "server" {
  count         = 3
  ami           = "ami-123456"
  instance_type = "t3.micro"
}

# Get all private IPs
output "private_ips" {
  value = aws_instance.server[*].private_ip
}

###################################

resource "aws_instance" "server" {
  for_each = toset(["web", "db", "cache"])

  ami           = "ami-123456"
  instance_type = "t3.micro"
  tags = {
    Name = each.key
  }
}

# Get all instance IDs
output "instance_ids" {
  value = values(aws_instance.server[*].id)
}

# Get security group IDs from all instances

output "security_groups" {
  value = aws_instance.server[*].security_groups[*]
}

# Get only instances with a specific tag
output "production_instances" {
  value = [for instance in aws_instance.server[*] : instance if instance.tags["Environment"] == "production"]
}
# Create a map of instance names to private IPs
output "instance_ip_map" {
  value = zipmap(
    aws_instance.server[*].tags.Name,
    aws_instance.server[*].private_ip
  )
}