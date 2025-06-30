
module "ecs-cluster" {
  source = "../../module/ecs"

  environment = var.environment
  prefix = local.prefix
}

module "global-ecs-cluster" {
  source = "../../module/global.ecs"

  environment = var.environment
  prefix = local.prefix
}