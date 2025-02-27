locals {
  alb-name = replace(replace("${var.prefix}-${var.environment}", ".", ""), "_", "-")

  alb-target_group-client-name = replace(replace("${var.prefix}-client-${var.environment}", ".", ""), "_", "-")
  alb-target_group-scheduler-name = replace(replace("${var.prefix}-scheduler-${var.environment}", ".", ""), "_", "-")
  alb-target_group-student-name = replace(replace("${var.prefix}-student-${var.environment}", ".", ""), "_", "-")
  alb-target_group-teacher-name = replace(replace("${var.prefix}-teacher-${var.environment}", ".", ""), "_", "-")
  
  alb-type = "application"
  ssl-policy = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate-arn = "arn:aws:acm:ap-northeast-2:021738694739:certificate/0df8f8c1-a6bb-4440-800a-b9a5136da744"
}