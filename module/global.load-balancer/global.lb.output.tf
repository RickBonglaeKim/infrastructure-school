output "alb-school-ver3-global" {
  value = aws_lb.school-ver3
}

output "target_group-school-ver3-global-client" {
  value = aws_lb_target_group.school-ver3-client
}

output "target_group-school-ver3-global-scheduler" {
  value = aws_lb_target_group.school-ver3-scheduler
}

output "target_group-school-ver3-global-student" {
  value = aws_lb_target_group.school-ver3-student
}

output "target_group-school-ver3-global-teacher" {
  value = aws_lb_target_group.school-ver3-teacher
}