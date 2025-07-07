
module "ec2_instance"{
    source="./module/ec2_instance"
    ami="ami-0261755bbcb8c4a84"
    instance_type="t2.micro"
    cidr_vpc = "172.16.0.0/16"
    cidr_sgp = "172.16.10.0/24"
    private_ip_1="172.16.10.100"
    av_zone_1="us-east-1a"
   
}

module "s3_bucket"{
    source="./module/s3_bucket"
}