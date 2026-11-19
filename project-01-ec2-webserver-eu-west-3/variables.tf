
variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "eu-west-3"
}

variable "project_name" {
  description = "Name prefix for AWS resources"
  type        = string
  default     = "terraform-webserver"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
