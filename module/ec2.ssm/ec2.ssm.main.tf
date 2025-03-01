

resource "aws_instance" "ec2-ssm" {
  ami = local.ec2-ssm-ami
  instance_type = local.instance-type
  iam_instance_profile = aws_iam_instance_profile.ssm.name
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.security_group-ec2-ssm.id]
  subnet_id = data.terraform_remote_state.network.outputs.subnet-public["c"].id

  tags = {
    Name = local.ec2-ssm-name
    Environment = var.environment
  }
}