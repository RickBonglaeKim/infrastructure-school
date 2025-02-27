resource "aws_s3_bucket" "school" {
  bucket = replace(local.s3-school-name, "_", "-")
  
  tags = {
    environment = var.environment
    name = local.s3-school-name
  }
}