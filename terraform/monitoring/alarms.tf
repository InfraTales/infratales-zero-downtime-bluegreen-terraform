resource "aws_cloudwatch_metric_alarm" "high_5xx" {
  alarm_name          = "High-5xx-Error-Rate"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "10"
  alarm_description   = "This metric monitors high 5xx error rates"
  
  dimensions = {
    LoadBalancer = var.alb_arn_suffix
  }
}

variable "alb_arn_suffix" {}
