
module "s3" {
  source = "../../module/s3"

  environment = var.environment
  prefix = local.prefix
  iam-arn = local.iam-arn
}