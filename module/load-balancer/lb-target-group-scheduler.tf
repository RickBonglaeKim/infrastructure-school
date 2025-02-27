
resource "aws_lb_target_group" "school-ver3-scheduler" {
  name = local.alb-target_group-scheduler-name
  target_type = "ip"
  port = 80
  protocol = "HTTP"
  vpc_id = data.terraform_remote_state.network.outputs.vpc.id

  health_check {
    path = "/v3/alive"
  }
}