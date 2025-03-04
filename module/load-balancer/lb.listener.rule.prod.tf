
resource "aws_lb_listener_rule" "school-ver3-client-prod" {
  count = var.environment == "prod" ? 1 : 0    // Will be configured in prod environment.

  listener_arn = aws_lb_listener.school-ver3-https.arn
  priority = 101

  condition {
    host_header {
      values = [ "school-server-bonbon.com" ]
    }
  }
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.school-ver3-client.arn
  }
}


resource "aws_lb_listener_rule" "school-ver3-teacher-preview-prod" {
  count = var.environment == "prod" ? 1 : 0    // Will be configured in prod environment.

  listener_arn = aws_lb_listener.school-ver3-https.arn
  priority = 901

  condition {
    host_header {
      values = [ "school-teacher-preview.art-bonbon.com" ]
    }
  }

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.school-ver3-teacher.arn
  }
}


resource "aws_lb_listener_rule" "school-ver3-teacher-prod" {
  count = var.environment == "prod" ? 1 : 0    // Will be configured in prod environment.

  listener_arn = aws_lb_listener.school-ver3-https.arn
  priority = 201

  condition {
    host_header {
      values = [ "school-teacher.art-bonbon.com" ]
    }
  }

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.school-ver3-teacher.arn
  }
}


resource "aws_lb_listener_rule" "school-ver3-student-prod" {
  count = var.environment == "prod" ? 1 : 0    // Will be configured in prod environment.

  listener_arn = aws_lb_listener.school-ver3-https.arn
  priority = 202

  condition {
    host_header {
      values = ["school-student.art-bonbon.com"]
    }
  }

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.school-ver3-student.arn
  }
}
