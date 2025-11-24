resource "aws_autoscaling_group" "blue" {
  name                = "blue-asg"
  desired_capacity    = var.capacity
  max_size            = var.capacity + 2
  min_size            = var.capacity
  vpc_zone_identifier = var.private_subnets
  target_group_arns   = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.blue.id
    version = "$Latest"
  }
  
  tag {
    key                 = "Environment"
    value               = "Blue"
    propagate_at_launch = true
  }
}
