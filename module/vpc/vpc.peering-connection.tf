
# resource "aws_vpc_peering_connection" "this__to__default" {
#   peer_vpc_id = local.peer-vpc-id
#   vpc_id = aws_vpc.this.id
#   auto_accept = true
# }