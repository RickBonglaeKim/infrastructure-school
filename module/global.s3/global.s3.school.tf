resource "aws_s3_bucket" "school" {
  bucket = local.s3-bucket-name
  
  tags = {
    Name = local.s3-bucket-name
    Environment = var.environment
  }
} 