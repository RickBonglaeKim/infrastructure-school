
output "this" {
  value = aws_vpc.this
}
output "subnet-database" {
  value = aws_subnet.database
}

output "subnet-private" {
  value = aws_subnet.private
}

output "subnet-public" {
  value = aws_subnet.public
}

output "security_group-mysql" {
  value = aws_security_group.mysql
}

output "security_group-ec2-ssm" {
  value = aws_security_group.ec2-ssm
}

output "security_group-alb" {
  value = aws_security_group.load_balancer
}

output "security_group-ecs" {
  value = aws_security_group.ecs
}

output "security_group-ep" {
  value = aws_security_group.ep
}

output "security_group-cache" {
  value = aws_security_group.cache
}