resource "aws_security_group" "ecs" {
  name = local.security_group-ecs-name
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.security_group-ecs-name
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecs-3000" {
  security_group_id = aws_security_group.ecs.id
  cidr_ipv4 = var.vpc-cidr
  from_port = 3000
  ip_protocol = "tcp"
  to_port = 3000
}

resource "aws_vpc_security_group_egress_rule" "ecs-all" {
  security_group_id = aws_security_group.ecs.id
  cidr_ipv4 = local.all-cidr
  ip_protocol = "-1"
}