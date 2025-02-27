
module "sqs" {
  source = "../../module/sqs"

  environment = var.environment
  prefix = local.prefix
  iam-arn = local.iam-arn
}