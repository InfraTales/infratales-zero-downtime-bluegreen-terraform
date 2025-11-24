# Target Groups are created in Blue/Green modules or passed in?
# The prompt implies target-groups.tf is here.
# But target groups are usually tied to the ASG lifecycle or independent.
# For Blue/Green, we need two independent target groups.


resource "aws_lb_target_group" "blue" {
  name     = "blue-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/health"
    matcher = "200"
  }
}

resource "aws_lb_target_group" "green" {
  name     = "green-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/health"
    matcher = "200"
  }
}

output "blue_tg_arn" { value = aws_lb_target_group.blue.arn }
output "green_tg_arn" { value = aws_lb_target_group.green.arn }
