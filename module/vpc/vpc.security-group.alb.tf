resource "aws_security_group" "load_balancer" {
  name = local.security_group-alb-name
  vpc_id = aws_vpc.this.id

  tags = {
    name = local.security_group-alb-name
    environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "load_balancer-80" {
  security_group_id = aws_security_group.load_balancer.id
  cidr_ipv4 = local.all-cidr
  from_port = 80
  ip_protocol = "tcp"
  to_port = 80
}

resource "aws_vpc_security_group_ingress_rule" "load_balancer-443" {
  security_group_id = aws_security_group.load_balancer.id
  cidr_ipv4 = local.all-cidr
  from_port = 443
  ip_protocol = "tcp"
  to_port = 443
}

resource "aws_vpc_security_group_egress_rule" "load_balancer-all" {
  security_group_id = aws_security_group.load_balancer.id
  cidr_ipv4 = local.all-cidr
  ip_protocol = "-1"
}