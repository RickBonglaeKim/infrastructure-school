locals {
  s3-school-name = "${var.prefix}-${var.environment}"
  cloud_front-oac-name = "${var.prefix}-${var.environment}"
  cloud_front-rhp-name = "${var.prefix}-${var.environment}"

  # Cloud Front Values
  default-cache-policy = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  default-methods = ["GET", "HEAD"]
  default-viewer-policy = "redirect-to-https"
  default-price-class = "PriceClass_200"  # Use U.S., Canada, Europe, Asia, Middle East and Africa

  origin-request-policy = "88a5eaf4-2fd4-4709-b370-b4c650ea3fcf"
}