


resource "aws_instance" "host_1" {
    ami =var.ami
    instance_type = var.instance_type
}