data "aws_subnets" "public" {
   tags = {
    Tier = "app"
  }
}

resource "aws_lb" "lb_app" {
  name               = "lb-app"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_lb_id]
  subnets            = data.aws_subnets.public.ids
}


resource "aws_lb_target_group" "tg_lb_app" {
  name     = "app-target-group"
  port     = var.app_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = var.health_check_path
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.lb_app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_lb_app.arn
  }
}
