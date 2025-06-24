resource "aws_s3_bucket_policy" "school" {
  bucket = aws_s3_bucket.school.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontServicePrincipal"
        Effect    = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.school.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.school.arn
          }
        }
      },
      {
        Sid       = "AllowIAMUserAccess"
        Effect    = "Allow"
        Principal = {
          AWS = var.iam-arn
        }
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.school.arn,
          "${aws_s3_bucket.school.arn}/*"
        ]
      }
    ]
  })
} 