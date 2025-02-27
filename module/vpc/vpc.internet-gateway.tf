
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    name = local.internet_gateway-name
    environment = var.environment
  }
}