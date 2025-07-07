provider "aws" {
    region=var.aws_region
}

variable "aws_region" {
  default = "us-east-1"
}


# aws_instance.app:
resource "aws_instance" "app" {
    ami                                  = "ami-0953476d60561c955"
    associate_public_ip_address          = true
    availability_zone                    = "us-east-1a"
    instance_type                        = "t2.micro"
    key_name                             = "aws_key"
    security_groups                      = ["app-sg"]
    subnet_id                            = "subnet-0009b37846199ff4f"
    tags                                 = {
        "Name" = "app"
    }
    vpc_security_group_ids               = ["sg-04a77f33a02089530" ]

}
