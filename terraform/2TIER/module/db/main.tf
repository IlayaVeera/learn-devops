# Database (RDS)

data "aws_subnets" "private" {
   tags = {
    Tier = "db"
  }
}

resource "aws_db_subnet_group" "mysql" {
    name = "db_subnet_group"
    subnet_ids = data.aws_subnets.private.ids
  }



resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.medium"
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.mysql.name
  vpc_security_group_ids = [var.sg_db_id]
  publicly_accessible  = false
  multi_az             = false
  storage_encrypted    = true
}
