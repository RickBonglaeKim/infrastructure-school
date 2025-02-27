
output "alb-school-ver3" {
  value = aws_lb.school-ver3
}

output "target_group-school-ver3-client" {
  value = aws_lb_target_group.school-ver3-client
}

output "target_group-school-ver3-scheduler" {
  value = aws_lb_target_group.school-ver3-scheduler
}

output "target_group-school-ver3-student" {
  value = aws_lb_target_group.school-ver3-student
}

output "target_group-school-ver3-teacher" {
  value = aws_lb_target_group.school-ver3-teacher
}