resource "aws_s3_bucket" "school" {
  bucket = replace(local.s3-school-name, "_", "-")
  
  tags = {
    Environment = var.environment
    Name = local.s3-school-name
  }
}