
module "mysql" {
  source = "../../module/rds.mysql"

  user-name = local.user-name
  user-password = local.user-password
  instance-class = local.instance-class
  storage-type = local.storage-type
  storage-size = local.storage-size

  environment = var.environment

  prefix = local.prefix
}

module "valkey" {
  source = "../../module/cache.redis"

  prefix = local.prefix
  node_type = "cache.t4g.small"
  cache_node_number = 1
  environment = var.environment
}