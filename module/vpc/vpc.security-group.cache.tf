resource "aws_security_group" "cache" {
  name = local.security_group-cache-name
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.security_group-cache-name
    Environment = var.environment
  }
}


resource "aws_vpc_security_group_ingress_rule" "cache-6379" {
  security_group_id = aws_security_group.cache.id
  cidr_ipv4 = aws_vpc.this.cidr_block
  from_port = 6379
  ip_protocol = "tcp"
  to_port = 6379
}


resource "aws_vpc_security_group_egress_rule" "cache-all" {
  security_group_id = aws_security_group.cache.id
  cidr_ipv4 = local.all-cidr
  ip_protocol = "-1"
}