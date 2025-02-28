
resource "aws_subnet" "database" {
  for_each = var.subnet-database

  vpc_id = aws_vpc.this.id
  cidr_block = each.value.cidr
  availability_zone = local.az-northeast-2[each.value.zone]

  tags = {
    Name = each.value.name
    Environment = var.environment
  }
}