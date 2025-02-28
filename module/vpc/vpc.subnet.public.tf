
resource "aws_subnet" "public" {
  for_each = var.subnet-public

  vpc_id = aws_vpc.this.id
  cidr_block = each.value.cidr
  availability_zone = local.az-northeast-2[each.value.zone]
  map_public_ip_on_launch = true

  tags = {
    Name = each.value.name
    Environment = var.environment
  }
}