# Generate a unique suffix for the S3 bucket
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Create the S3 bucket
resource "aws_s3_bucket" "website" {
  bucket = "${var.project_name}-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "${var.project_name}-${random_id.bucket_suffix.hex}"
    Environment = "Capstone"
    ManagedBy   = "Terraform"
  }
}


# Enable static website hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }
}

# Configure public access settings for this bucket
resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = false
}

# Allow public read access to website objects
resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  depends_on = [
    aws_s3_bucket_public_access_block.website
  ]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadForWebsite"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website.arn}/*"
      }
    ]
  })
}

# Upload website homepage to S3
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.website.id
  key    = "index.html"

  source       = "${path.module}/index.html"
  content_type = "text/html"

  etag = filemd5("${path.module}/index.html")
}