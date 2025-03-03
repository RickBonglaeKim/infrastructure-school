
resource "aws_lb_listener_rule" "school-ver3-client" {
  count = var.environment == "prod" ? 1 : 0    // Will be configured in dev environment.

  listener_arn = aws_lb_listener.school-ver3-https.arn
  priority = 101

  condition {
    host_header {
      values = [ "school-server.art-bonbon.com" ]
    }
  }  
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.school-ver3-client.arn
  }
}


resource "aws_lb_listener_rule" "school-ver3-teacher" {
  count = var.environment == "prod" ? 1 : 0    // Will be configured in dev environment.

  listener_arn = aws_lb_listener.school-ver3-https.arn
  priority = 102

  condition {
    host_header {
      values = [ "school-teacher.dev.art-bonbon.com" ]
    }
  }

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.school-ver3-teacher.arn
  }
}


resource "aws_lb_listener_rule" "school-ver3-student" {
  count = var.environment == "prod" ? 1 : 0    // Will be configured in dev environment.

  listener_arn = aws_lb_listener.school-ver3-https.arn
  priority = 201

  condition {
    host_header {
      values = ["school-student.dev.art-bonbon.com"]
    }
  }

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.school-ver3-student.arn
  }
}
