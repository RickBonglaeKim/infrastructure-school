
# com.amazonaws.ap-northeast-2.ecr.api
resource "aws_vpc_endpoint" "ecr-api" {
  vpc_id = aws_vpc.this.id
  vpc_endpoint_type = "Interface"
  service_name = "com.amazonaws.ap-northeast-2.ecr.api"

  security_group_ids = [aws_security_group.ep.id]

  subnet_ids = [for subnet in aws_subnet.private : subnet.id]
  private_dns_enabled = true
  auto_accept = true

  tags = {
    Name = "${var.prefix}-ecr.api-${var.environment}"
    environment = var.environment
  }
}


# com.amazonaws.ap-northeast-2.ecr.dkr
resource "aws_vpc_endpoint" "ecr-dkr" {
  vpc_id = aws_vpc.this.id
  vpc_endpoint_type = "Interface"
  service_name = "com.amazonaws.ap-northeast-2.ecr.dkr"

  security_group_ids = [aws_security_group.ep.id]

  subnet_ids = [for subnet in aws_subnet.private : subnet.id]
  private_dns_enabled = true
  auto_accept = true

  tags = {
    Name = "${var.prefix}-ecr.dkr-${var.environment}"
    environment = var.environment
  }
}


# com.amazonaws.ap-northeast-2.logs
resource "aws_vpc_endpoint" "logs" {
  vpc_id = aws_vpc.this.id
  vpc_endpoint_type = "Interface"
  service_name = "com.amazonaws.ap-northeast-2.logs"

  security_group_ids = [aws_security_group.ep.id]

  subnet_ids = [for subnet in aws_subnet.private : subnet.id]
  private_dns_enabled = true
  auto_accept = true

  tags = {
    Name = "${var.prefix}-logs-${var.environment}"
    environment = var.environment
  }
}


# com.amazonaws.ap-northeast-2.s3
resource "aws_vpc_endpoint" "s3" {
  vpc_id = aws_vpc.this.id
  vpc_endpoint_type = "Gateway"
  service_name = "com.amazonaws.ap-northeast-2.s3"

  tags = {
    Name = "${var.prefix}-s3-${var.environment}"
    environment = var.environment
  }
}

resource "aws_vpc_endpoint_route_table_association" "s3" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id = aws_route_table.private.id
}