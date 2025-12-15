provider "aws" {
  region = var.region
}

resource "aws_launch_template" "my_template" {
  name_prefix            = var.name_prefix
  image_id               = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name

  vpc_security_group_ids = var.vpc_security_group_ids

  user_data = base64encode(<<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install nginx -y
    echo "<h1>Hello World</h1>" > /var/www/html/index.html
  EOF
  )

  tag_specifications {
    resource_type = var.resource_type
    tags = {
      Name = var.name
    }
  }
}

resource "aws_autoscaling_group" "my_asg" {
  name = "tf_autoscaling_group"

  launch_template {
    id      = aws_launch_template.my_template.id
    version = "$Latest"
  }

  min_size         = 2
  max_size         = 3
  desired_capacity = 2

  vpc_zone_identifier = var.vpc_zone_identifier

  health_check_type         = "EC2"
  wait_for_capacity_timeout = "10m"

  tag {
    key = var.key_name
    value = var.value
    propagate_at_launch = true
  }
}
