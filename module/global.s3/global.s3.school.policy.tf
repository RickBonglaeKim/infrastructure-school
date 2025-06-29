data "aws_iam_policy_document" "school" {
  statement {
    principals {
      type = "AWS"
      identifiers = [var.iam-arn]
    }
    effect = "Allow"
    actions = [ 
      "s3:ListBucket",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = [
      aws_s3_bucket.school.arn,
      "${aws_s3_bucket.school.arn}/*"
    ]
  }
  
  statement {
    principals {
      type = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    effect = "Allow"
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.school.arn}/*"]
    condition {
      test = "StringEquals"
      variable = "AWS:SourceArn"
      values = [aws_cloudfront_distribution.school.arn]
    }
  }
}


resource "aws_s3_bucket_policy" "school" {
  bucket = aws_s3_bucket.school.id
  policy = data.aws_iam_policy_document.school.json
} 