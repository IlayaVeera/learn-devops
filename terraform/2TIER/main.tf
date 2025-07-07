module "vpc" {
    source = "./module/vpc"
    vpc_cidr = var.vpc_cidr
    pub_subnet = var.pub_subnet
    pvt_subnet = var.pvt_subnet
    aws_region = var.aws_region
  }

module "db" {
  source = "./module/db"
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  sg_db_id = module.vpc.sg_db_id
  depends_on = [ module.vpc ]

}

module "lb" {
  source = "./module/lb"
  app_port = var.app_port
  health_check_path = var.health_check_path
  vpc_id = module.vpc.vpc_id
  sg_lb_id = module.vpc.sg_lb_id
  depends_on = [ module.db ]
}

module "asg_app" {
  source = "./module/asg"
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  sg_app_id = module.vpc.sg_app_id
  tg_lb_app_arn = module.lb.tg_lb_app_arn
  depends_on = [ module.lb ]
}