locals {
  redis-subnet_group-name = "${var.prefix}-${var.environment}"
  cluster-id = "${var.prefix}-${var.environment}"
}