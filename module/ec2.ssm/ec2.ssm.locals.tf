
locals {
  
  ec2-ssm-ami = "ami-05be23b5a3f59423f"
  ec2-ssm-name = "${var.prefix}-ec2-ssm-${var.environment}"
  ec2-ssm-role-name = "${var.prefix}-ec2@ssm-${var.environment}"
  ec2-ssm-profile-name = "${var.prefix}-ec2-ssm-profile-${var.environment}"
  
  instance-type = "t4g.nano"
  service-principal = "ec2.amazonaws.com"

  role-policy-ssm-arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}