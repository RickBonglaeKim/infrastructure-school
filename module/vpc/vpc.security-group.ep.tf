resource "aws_security_group" "ep" {
  name = local.security_group-ep-name
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.security_group-ep-name
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "ep-443" {
  security_group_id = aws_security_group.ep.id
  cidr_ipv4 = var.vpc-cidr
  from_port = 443
  ip_protocol = "tcp"
  to_port = 443
}

resource "aws_vpc_security_group_egress_rule" "ep-all" {
  security_group_id = aws_security_group.ep.id
  cidr_ipv4 = local.all-cidr
  ip_protocol = "-1"
}