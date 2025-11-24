resource "aws_autoscaling_group" "green" {
  name                = "green-asg"
  desired_capacity    = var.capacity
  max_size            = var.capacity + 2
  min_size            = var.capacity
  vpc_zone_identifier = var.private_subnets
  target_group_arns   = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.green.id
    version = "$Latest"
  }
  
  tag {
    key                 = "Name"
    value               = "Green-Instance"
    propagate_at_launch = true
  }
}
