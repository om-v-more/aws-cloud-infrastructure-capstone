variable "project_name" {
  description = "Project resource name prefix"
  type        = string
  default     = "omm-ec2-cloudwatch"
}

variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "eu-west-3"
}

variable "cpu_threshold" {
  description = "CPU utilization threshold for CloudWatch alarm"
  type        = number
  default     = 70
}