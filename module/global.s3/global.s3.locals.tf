locals {
  s3-bucket-name = replace(replace("${var.prefix}-global-${var.environment}", ".", ""), "_", "-")
  s3-bucket-policy-name = replace(replace("${var.prefix}-global-${var.environment}", ".", ""), "_", "-")
  s3-cloud-front-distribution-name = replace(replace("${var.prefix}-global-${var.environment}", ".", ""), "_", "-")
  s3-cloud-front-origin-access-identity-name = replace(replace("${var.prefix}-global-${var.environment}", ".", ""), "_", "-")
} 