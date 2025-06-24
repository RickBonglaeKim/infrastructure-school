resource "aws_lb_listener_rule" "school-ver3-client-prod" {
  count = var.environment == "prod" ? 1 : 0    // Will be configured in prod environment.
  listener_arn = aws_lb_listener.school-ver3-https.arn
  priority = 101
  condition {
    host_header {
      values = [ "school-global-server.art-bonbon.com" ]
    }
  }
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.school-ver3-client.arn
  }
}


resource "aws_lb_listener_rule" "school-ver3-api-prod" {
  count = var.environment == "prod" ? 1 : 0    // Will be configured in prod environment.
  listener_arn = aws_lb_listener.school-ver3-https.arn
  priority = 102
  condition {
    host_header {
      values = ["school-global-api.art-bonbon.com"]
    }
  }
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.school-ver3-client.arn
  }
}



resource "aws_lb_listener_rule" "school-ver3-teacher-prod" {
  count = var.environment == "prod" ? 1 : 0    // Will be configured in prod environment.
  listener_arn = aws_lb_listener.school-ver3-https.arn
  priority = 201
  condition {
    host_header {
      values = [ "school-global-teacher.art-bonbon.com" ]
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
  priority = 301
  condition {
    host_header {
      values = ["school-global-student.art-bonbon.com"]
    }
  }
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.school-ver3-student.arn
  }
}


# resource "aws_lb_listener_rule" "school-ver3-app-prod" {
#   count = var.environment == "prod" ? 1 : 0    // Will be configured in prod environment.

#   listener_arn = aws_lb_listener.school-ver3-https.arn
#   priority = 901

#   condition {
#     host_header {
#       values = ["school-app.art-bonbon.com", "school.art-bonbon.com"]
#     }
#   }
#   action {
#     type = "redirect"
#     redirect {
#       protocol = "HTTPS"
#       host = "school-global-student.art-bonbon.com"
#       path = "/signin"
#       status_code = "HTTP_302"
#     }
#   }
# }