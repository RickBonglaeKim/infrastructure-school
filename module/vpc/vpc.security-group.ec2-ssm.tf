
resource "aws_security_group" "ec2-ssm" {
  name = local.security_group-ec2-ssm-name
  vpc_id = aws_vpc.this.id

  tags = {
    name = local.security_group-ec2-ssm-name
    environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "ec2-ssm-443" {
  security_group_id = aws_security_group.ec2-ssm.id
  cidr_ipv4 = local.i_scream_arts-cidr
  from_port = 443
  ip_protocol = "tcp"
  to_port = 443
}

resource "aws_vpc_security_group_egress_rule" "ec2-ssm-all" {
  security_group_id = aws_security_group.ec2-ssm.id
  cidr_ipv4 = local.all-cidr
  ip_protocol = "-1"
}