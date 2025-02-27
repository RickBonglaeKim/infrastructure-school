
module "vpc" {
  source = "../../module/vpc"

  environment = var.environment

  prefix = local.prefix

  vpc-cidr = local.vpc-cidr

  subnet-database = local.subnet-database
  subnet-private = local.subnet-private
  subnet-public = local.subnet-public
  peering-connection = local.peering-connection
}