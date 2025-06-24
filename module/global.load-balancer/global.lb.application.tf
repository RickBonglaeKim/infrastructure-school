resource "aws_lb" "school-ver3" {
  name = local.alb-name
  internal = false
  load_balancer_type = local.alb-type
  enable_cross_zone_load_balancing = true
  security_groups = [data.terraform_remote_state.network.outputs.security_group-alb.id]
  subnets = [for subnet in data.terraform_remote_state.network.outputs.subnet-public : subnet.id]
  
  tags = {
    Name = local.alb-name
    Environment = var.environment
  }
}


resource "aws_lb_listener" "school-ver3-http" {
  load_balancer_arn = aws_lb.school-ver3.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


resource "aws_lb_listener" "school-ver3-https" {
  load_balancer_arn = aws_lb.school-ver3.arn
  port = "443"
  protocol = "HTTPS"
  ssl_policy = local.ssl-policy
  certificate_arn = local.certificate-arn
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code = "401"
    }
  }
} 