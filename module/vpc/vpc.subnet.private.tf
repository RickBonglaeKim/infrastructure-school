
resource "aws_subnet" "private" {
  for_each = var.subnet-private

  vpc_id = aws_vpc.this.id
  cidr_block = each.value.cidr
  availability_zone = local.az-northeast-2[each.value.zone]

  tags = {
    name = each.value.name
  }
}