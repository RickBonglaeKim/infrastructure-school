
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.route_table-public-name
    Environment = var.environment
  }
}

resource "aws_route" "public-internet_gateway" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = local.all-cidr
  gateway_id = aws_internet_gateway.this.id
}


resource "aws_route_table_association" "public" {
  for_each = var.subnet-public

  subnet_id = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public.id
}