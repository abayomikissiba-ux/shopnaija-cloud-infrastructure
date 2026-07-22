############################################
# Amazon Linux 2023 AMI

data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

}

# Launch Template

resource "aws_launch_template" "this" {

  name_prefix = "${var.project_name}-lt-"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"

  iam_instance_profile {

    name = var.instance_profile_name

  }

  network_interfaces {

    associate_public_ip_address = false

    security_groups = [
      var.ec2_security_group_id
    ]

  }

  user_data = base64encode(
    file("${path.root}/scripts/user_data.sh")
  )

  monitoring {

    enabled = true

  }

  block_device_mappings {

    device_name = "/dev/xvda"

    ebs {

      volume_size = 10

      volume_type = "gp3"

      delete_on_termination = true

    }

  }

  tag_specifications {

    resource_type = "instance"

    tags = {

      Name = "${var.project_name}-ec2"

      Environment = var.environment

    }

  }

}

# Auto Scaling Group

resource "aws_autoscaling_group" "this" {

  name = "${var.project_name}-asg"

  min_size         = 2
  desired_capacity = 2
  max_size         = 4

  vpc_zone_identifier = var.private_subnet_ids

  target_group_arns = [
    var.target_group_arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-ec2"
    propagate_at_launch = true
  }

}