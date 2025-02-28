
output "vpc" {
  value = module.vpc.this
}

# output "alb-school-ver3" {
#   value = module.load_balancer.alb-school-ver3
# }

# output "target_group-school-ver3-client" {
#   value = module.load_balancer.target_group-school-ver3-client
# }

# output "target_group-school-ver3-scheduler" {
#   value = module.load_balancer.target_group-school-ver3-scheduler
# }

# output "target_group-school-ver3-student" {
#   value = module.load_balancer.target_group-school-ver3-student
# }

# output "target_group-school-ver3-teacher" {
#   value = module.load_balancer.target_group-school-ver3-teacher
# }

output "subnet-database" {
  value = module.vpc.subnet-database
}

output "subnet-private" {
  value = module.vpc.subnet-private
}

output "subnet-public" {
  value = module.vpc.subnet-public
}

output "security_group-mysql" {
  value = module.vpc.security_group-mysql
}

output "security_group-ec2-ssm" {
  value = module.vpc.security_group-ec2-ssm
}

output "security_group-alb" {
  value = module.vpc.security_group-alb
}

output "security_group-ecs" {
  value = module.vpc.security_group-ecs
}

output "security_group-ep" {
  value = module.vpc.security_group-ep
}

output "security_group-cache" {
  value = module.vpc.security_group-cache
}