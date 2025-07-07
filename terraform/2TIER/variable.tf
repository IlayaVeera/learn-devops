
########## aws region #####################

variable "aws_region"{
    default = "us-east-1"
}

########## vpc config #####################

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "pub_subnet" {
    default = ["10.0.1.0/28", "10.0.2.0/28"]
}

variable "pvt_subnet" {
    default = ["10.0.3.0/28", "10.0.4.0/28"]
}

########## db config #####################
variable "db_name" {
    default = "login"
}
variable "db_username" {
    default = "mysqluser"
}
variable "db_password" {
    default = "mysql123"
}

########## lb config #####################
variable "app_port" {
    default = 5000
}

variable "health_check_path" {
    default = "/"
}

########## asg config #####################

variable "image_id" {
    default = "ami-084568db4383264d4"
  
}
variable "instance_type" {
    default = "t2.micro"
}

variable "key_name" {
    default = "aws_key"
}

