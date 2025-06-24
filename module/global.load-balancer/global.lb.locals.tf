locals {
  alb-name = replace(replace("${var.prefix}-global-${var.environment}", ".", ""), "_", "-")

  alb-target_group-client-name = replace(replace("${var.prefix}-global-client-${var.environment}", ".", ""), "_", "-")
  alb-target_group-scheduler-name = replace(replace("${var.prefix}-global-scheduler-${var.environment}", ".", ""), "_", "-")
  alb-target_group-student-name = replace(replace("${var.prefix}-global-student-${var.environment}", ".", ""), "_", "-")
  alb-target_group-teacher-name = replace(replace("${var.prefix}-global-teacher-${var.environment}", ".", ""), "_", "-")
  
  alb-type = "application"
  ssl-policy = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate-arn = var.environment == "dev" ? "arn:aws:acm:ap-northeast-2:021738694739:certificate/0df8f8c1-a6bb-4440-800a-b9a5136da744" : "arn:aws:acm:ap-northeast-2:021738694739:certificate/f2b5bdaf-6061-4f09-aab4-1d29cc76e5e9"
}