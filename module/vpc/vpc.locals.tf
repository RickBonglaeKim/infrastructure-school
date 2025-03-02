locals {

  vpc-name = "${var.prefix}-${var.environment}"
  
  internet_gateway-name = "${var.prefix}-${var.environment}"
  
  route_table-database-name = "${var.prefix}-database-${var.environment}"
  route_table-private-name = "${var.prefix}-private-${var.environment}"
  route_table-public-name = "${var.prefix}-public-${var.environment}"

  security_group-alb-name = "${var.prefix}-alb-${var.environment}"
  security_group-ec2-ssm-name = "${var.prefix}-ssm-${var.environment}"
  security_group-ecs-name = "${var.prefix}-ecs-${var.environment}"
  security_group-ep-name = "${var.prefix}-ep-${var.environment}"
  security_group-mysql-name = "${var.prefix}-mysql-${var.environment}"
  security_group-cache-name = "${var.prefix}-cache-${var.environment}"

  service_name = {
    ecr-api = "com.amazonaws.ap-northeast-2.ecr.api"
    ecr-dkr = "com.amazonaws.ap-northeast-2.ecr.dkr"
    s3 = "com.amazonaws.ap-northeast-2.s3"
    logs = "com.amazonaws.ap-northeast-2.logs"
  }
  

  all-cidr = "0.0.0.0/0"
  i_scream_arts-cidr = "1.212.63.210/32"

  az-northeast-2 = {
    a = "ap-northeast-2a",
    b = "ap-northeast-2b",
    c = "ap-northeast-2c",
    d = "ap-northeast-2d"
  }

  peer-vpc-id = "vpc-059f9898ea7c9506f"
}