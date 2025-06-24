
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

module "global-mysql" {
  source = "../../module/global.rds.mysql"

  user-name     = local.global-user-name
  user-password = local.global-user-password
  instance-class = local.global-instance-class
  storage-type   = local.global-storage-type
  storage-size   = local.global-storage-size

  environment = var.environment
  prefix      = local.prefix
}

module "valkey" {
  source = "../../module/cache.redis"

  prefix = local.prefix
  node_type = "cache.t4g.micro"
  cache_node_number = 1
  environment = var.environment
}

module "global-cache-redis" {
  source = "../../module/global.cache.redis"

  prefix = local.prefix
  node_type = "cache.t4g.micro"
  cache_node_number = 1
  environment = var.environment
}