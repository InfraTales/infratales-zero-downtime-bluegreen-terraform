variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (e.g., prod, staging)"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "blue_capacity" {
  description = "Desired capacity for Blue ASG"
  type        = number
  default     = 2
}

variable "green_capacity" {
  description = "Desired capacity for Green ASG"
  type        = number
  default     = 0
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.medium"
}

variable "traffic_distribution" {
  description = "Traffic weight for Blue environment (0-100)"
  type        = number
  default     = 100
}
