
resource "aws_route_table" "database" {
  vpc_id = aws_vpc.this.id

  tags = {
    name = local.route_table-database-name
    environment = var.environment
  }
}

resource "aws_route_table_association" "database" {
  for_each = var.subnet-database

  subnet_id = aws_subnet.database[each.key].id
  route_table_id = aws_route_table.database.id
}


resource "aws_route" "school_v3-database-to-system" {
  route_table_id = aws_route_table.database.id
  destination_cidr_block = var.peering-connection.system.cidr
  vpc_peering_connection_id = var.peering-connection.system.id
}