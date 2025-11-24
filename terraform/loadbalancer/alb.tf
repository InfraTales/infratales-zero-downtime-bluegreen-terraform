resource "aws_lb" "main" {
  name               = "bluegreen-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.public_subnets

  enable_deletion_protection = false
}

variable "vpc_id" {}
variable "public_subnets" { type = list(string) }
variable "security_groups" { type = list(string) }
variable "blue_target_group" {}
variable "green_target_group" {}
variable "traffic_weight" { default = 100 }
