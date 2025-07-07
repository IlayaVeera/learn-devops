output "vpc_id" {
    value = aws_vpc.demo_vpc.id
}

output "sg_lb_id" {
  value = aws_security_group.lb.id
}

output "sg_app_id" {
  value = aws_security_group.app.id
}

output "sg_db_id" {
  value = aws_security_group.db.id
}

