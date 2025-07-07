
resource "aws_launch_template" "app" {
  name_prefix   = "app-"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [var.sg_app_id]
    delete_on_termination = true
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              sudo ap-get update
              sudo apt-get install mysql-client-8* -y
              EOF
            )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app-server"
    }
  }
}


data "aws_subnets" "public" {
   tags = {
    Tier = "app"
  }
}

resource "aws_autoscaling_group" "asg_app" {
  name                = "asg-app"
  min_size            = 2
  max_size            = 2
  desired_capacity    = 2
  vpc_zone_identifier = data.aws_subnets.public.ids

  target_group_arns = [var.tg_lb_app_arn] # References the LB target group

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "asg-app"
    propagate_at_launch = true
  }
  
}