
resource "aws_vpc" "this" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  
  tags = {
    name = local.vpc-name
  }
}