
module "ecs-cluster" {
  source = "../../module/ecs"

  environment = var.environment
  prefix = local.prefix
}