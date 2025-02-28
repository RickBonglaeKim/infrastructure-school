
resource "aws_security_group" "mysql" {
  name = local.security_group-mysql-name
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.security_group-mysql-name
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "mysql-3306" {
  security_group_id = aws_security_group.mysql.id
  cidr_ipv4 = aws_vpc.this.cidr_block
  from_port = 3306
  ip_protocol = "tcp"
  to_port = 3306
}

resource "aws_vpc_security_group_ingress_rule" "mysql-3306-from-system" {
  security_group_id = aws_security_group.mysql.id
  cidr_ipv4 = var.peering-connection.system.cidr
  from_port = 3306
  ip_protocol = "tcp"
  to_port = 3306
}

resource "aws_vpc_security_group_egress_rule" "mysql-all" {
  security_group_id = aws_security_group.mysql.id
  cidr_ipv4 = local.all-cidr
  ip_protocol = "-1"
}