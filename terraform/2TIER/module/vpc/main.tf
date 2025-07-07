//*****create VPC******//
resource "aws_vpc" "demo_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
}


//*****create subnet******//

data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count             = length(var.pub_subnet)
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = var.pub_subnet[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "pub_subnet_${count.index + 1}"
    Tier = "app"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.pvt_subnet)
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = var.pvt_subnet[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "pvt_subnet_${count.index + 1}"
    Tier = "db"
  }
}



//*****create internet gateway******//
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo_vpc.id
}

//*****create route table******//
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
    count = length(aws_subnet.public)
    subnet_id      = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.pub_rt.id
}

//*****create security group******//
resource "aws_security_group" "lb" {
  name        = "lb_sg"
  description = "Allow HTTP/HTTPS traffic"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Tier = "lb"
  }
}

locals {
    inbound_port=[5000, 22]
}

resource "aws_security_group" "app" {
  name        = "app_sg"
  description = "Allow HTTP/HTTPS traffic"
  vpc_id      = aws_vpc.demo_vpc.id

    dynamic "ingress" {
        for_each = local.inbound_port
        content {
            from_port   = ingress.value
            to_port     = ingress.value
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
      
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Tier="app"
    }
  }


resource "aws_security_group" "db" {
  name        = "db_sg"
  description = "Allow mysql access from application"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
        Tier = "db"
  }
}
