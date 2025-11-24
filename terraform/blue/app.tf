data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_launch_template" "blue" {
  name_prefix   = "blue-lt-"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  
  user_data = filebase64("${path.module}/user_data.sh")

  vpc_security_group_ids = [aws_security_group.app.id]
  
  iam_instance_profile {
    name = aws_iam_instance_profile.app.name
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Blue-Instance"
      Env  = "Blue"
    }
  }
}

resource "aws_iam_role" "app" {
  name = "blue-app-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.app.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "app" {
  name = "blue-app-profile"
  role = aws_iam_role.app.name
}

variable "vpc_id" {}
variable "private_subnets" { type = list(string) }
variable "instance_type" {}
variable "capacity" {}
variable "alb_sg_id" {}
variable "target_group_arn" {}
