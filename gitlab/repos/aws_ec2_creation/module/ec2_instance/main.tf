
//*****create VPC******//
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_vpc
}

//*****create subnet******//
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.cidr_sgp
  availability_zone = var.av_zone_1
  map_public_ip_on_launch = true
}

//*****create security Group******//
resource "aws_security_group" "mysec_grp" {
  name        = "mysec_grp"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.my_vpc.id
}

//*****create inbound rule******//
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.mysec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_2" {
  security_group_id = aws_security_group.mysec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

//*****create outbound rule******//
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.mysec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

//*****create key pair******//
resource "aws_key_pair" "example" {
  key_name   = "terraform-demo-ilaya"  # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with the path to your public key file
}

//*****create internet gateway******//
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

//*****create route table******//
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.RT.id
}

//*****create ec2 instance******//
resource "aws_instance" "host_1" {
    ami =var.ami
    instance_type = var.instance_type
    key_name      = aws_key_pair.example.key_name
    private_ip=var.private_ip_1
    subnet_id=aws_subnet.my_subnet.id
    vpc_security_group_ids = [aws_security_group.mysec_grp.id]
    associate_public_ip_address = true
   # user_data = "${file("script.sh")}" 
    
    tags = {
    Name ="host_1"
    }

 
}
