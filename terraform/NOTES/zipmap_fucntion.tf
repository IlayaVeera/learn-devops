

locals {
  tag_names  = ["Name", "Environment", "Owner"]
  tag_values = ["MyApp", "Production", "team@example.com"]
  
  tags = zipmap(local.tag_names, local.tag_values)
}

resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
  tags          = local.tags
}

############################################################

locals {
  azs     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  
  az_subnet_map = zipmap(local.azs, local.subnets)
}

resource "aws_subnet" "example" {
  for_each = local.az_subnet_map
  
  vpc_id     = aws_vpc.main.id
  cidr_block = each.value
  availability_zone = each.key
}