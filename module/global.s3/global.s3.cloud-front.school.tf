resource "aws_cloudfront_origin_access_control" "school" {
  name = local.cloud_front-oac-name
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}


resource "aws_cloudfront_response_headers_policy" "school" {
  name = local.cloud_front-rhp-name

  cors_config {
    access_control_allow_credentials = false
    access_control_allow_headers {
      items = ["*"]
    }
    access_control_allow_methods {
      items = ["GET", "HEAD"]
    }
    access_control_allow_origins {
      items = ["*"]
    }
    origin_override = false
  }
}


resource "aws_cloudfront_distribution" "school" {

  enabled = true

  origin {
    domain_name = aws_s3_bucket.school.bucket_regional_domain_name
    origin_id = aws_s3_bucket.school.id
    # Do not use OAI (legacy)
    origin_access_control_id = aws_cloudfront_origin_access_control.school.id
  }

  default_cache_behavior {
    allowed_methods = local.default-methods
    cached_methods = local.default-methods
    target_origin_id = aws_s3_bucket.school.id
    cache_policy_id = local.default-cache-policy
    viewer_protocol_policy = local.default-viewer-policy
    origin_request_policy_id = local.origin-request-policy
    response_headers_policy_id = aws_cloudfront_response_headers_policy.school.id
  }

  price_class = local.default-price-class

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations = []
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Name = local.s3-school-name
    Environment = var.environment
  }

} 