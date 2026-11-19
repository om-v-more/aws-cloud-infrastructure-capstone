
# --------------------------------------------------
# IAM User
# --------------------------------------------------

resource "aws_iam_user" "s3_read_user" {
  name = var.iam_user_name
  path = "/"

  tags = {
    Name      = var.iam_user_name
    Project   = "Project-04-IAM-Automation"
    ManagedBy = "Terraform"
  }
}

# --------------------------------------------------
# IAM User Policy
# --------------------------------------------------

resource "aws_iam_user_policy" "s3_read_policy" {
  name = "omm-s3-read-only-policy"
  user = aws_iam_user.s3_read_user.name

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect   = "Allow"
        Action   = var.s3_read_policy.bucket_actions
        Resource = "arn:aws:s3:::${var.s3_bucket_name}"
      },
      {
        Effect   = "Allow"
        Action   = var.s3_read_policy.object_actions
        Resource = "arn:aws:s3:::${var.s3_bucket_name}/*"
      }
    ]
  })
}
