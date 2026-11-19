output "s3_bucket_name" {
  description = "Name of the S3 website bucket"
  value       = aws_s3_bucket.website.id
}

output "s3_website_endpoint" {
  description = "Public S3 static website URL"
  value       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
}

output "aws_region" {
  description = "AWS deployment region"
  value       = var.aws_region
}