
variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "eu-west-3"
}

variable "iam_user_name" {
  description = "Name of the IAM user"
  type        = string
  default     = "omm-s3-read-user"
}

variable "s3_bucket_name" {
  description = "S3 bucket the IAM user can read"
  type        = string
  default     = "omm-s3-static-website-373ee59a"
}

variable "s3_read_policy" {
  description = "Actions allowed by the S3 read-only policy"
  type = object({
    bucket_actions = list(string)
    object_actions = list(string)
  })

  default = {
    bucket_actions = ["s3:ListBucket"]
    object_actions = ["s3:GetObject"]
  }
}