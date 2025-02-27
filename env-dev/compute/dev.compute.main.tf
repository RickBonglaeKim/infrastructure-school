
module "ec2_ssm" {
  source = "../../module/ec2.ssm"
  environment = var.environment
  prefix = local.prefix
}
