data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_launch_template" "green" {
  name_prefix   = "green-lt-"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  
  user_data = filebase64("${path.module}/user_data.sh")

  vpc_security_group_ids = [aws_security_group.app.id]
  
  iam_instance_profile {
    name = aws_iam_instance_profile.app_green.name
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Green-Instance"
      Env  = "Green"
    }
  }
}

resource "aws_iam_role" "app_green" {
  name = "green-app-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_green" {
  role       = aws_iam_role.app_green.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "app_green" {
  name = "green-app-profile"
  role = aws_iam_role.app_green.name
}

variable "vpc_id" {}
variable "private_subnets" { type = list(string) }
variable "instance_type" {}
variable "capacity" {}
variable "alb_sg_id" {}
variable "target_group_arn" {}
