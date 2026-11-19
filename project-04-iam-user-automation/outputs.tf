
output "iam_user_name" {
  description = "Created IAM user name"
  value       = aws_iam_user.s3_read_user.name
}

output "iam_user_arn" {
  description = "ARN of the created IAM user"
  value       = aws_iam_user.s3_read_user.arn
}

output "s3_bucket_name" {
  description = "S3 bucket the IAM user can read"
  value       = var.s3_bucket_name
}

output "policy_name" {
  description = "Attached IAM policy name"
  value       = aws_iam_user_policy.s3_read_policy.name
}
