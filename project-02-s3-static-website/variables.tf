variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "omm-s3-static-website"
}

variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "eu-west-3"
}