
data "aws_iam_policy_document" "ec2-ssm" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [local.service-principal]
    }
    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role" "ec2-ssm" {
  name = local.ec2-ssm-role-name
  assume_role_policy = data.aws_iam_policy_document.ec2-ssm.json

  tags = {
    Name = local.ec2-ssm-role-name
    Environment = var.environment
  }
}


resource "aws_iam_role_policy_attachment" "ec2-ssm" {
  role = aws_iam_role.ec2-ssm.name
  policy_arn = local.role-policy-ssm-arn
}


resource "aws_iam_instance_profile" "ssm" {
  name = local.ec2-ssm-profile-name
  role = aws_iam_role.ec2-ssm.name

  tags = {
    Name = local.ec2-ssm-profile-name
    Environment = var.environment
  }
}