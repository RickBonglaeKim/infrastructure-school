
module "load_balancer" {
  source = "../../module/load-balancer"
  environment = var.environment
  prefix = local.prefix
}

module "global-load-balancer" {
  source = "../../module/global.load-balancer"
  environment = var.environment
  prefix = local.prefix
}