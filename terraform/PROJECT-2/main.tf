variable "ami" {}
variable "instance_type" {
    type=map(string)

    default={
        "dev"="t2.micro"
        "stage"="t2.medium"
        "prod"="t2.xlarge"
}
}

module "ec2_instance"{
    source="./module/ec2_instance"
    ami =var.ami
    instance_type = lookup(var.instance_type,terraform.workspace)
}
