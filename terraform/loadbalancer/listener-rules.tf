resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = var.blue_target_group
        weight = var.traffic_weight
      }
      target_group {
        arn    = var.green_target_group
        weight = 100 - var.traffic_weight
      }
    }
  }
}

output "alb_dns_name" { value = aws_lb.main.dns_name }
output "alb_arn_suffix" { value = aws_lb.main.arn_suffix }
