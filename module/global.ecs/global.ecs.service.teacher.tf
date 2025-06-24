resource "aws_ecs_service" "teacher" {
  
  name = local.ecs-service.teacher.name
  cluster = aws_ecs_cluster.this.id
  
  availability_zone_rebalancing = "ENABLED"
  desired_count = 0
  launch_type = "FARGATE"
  enable_ecs_managed_tags = true

  deployment_circuit_breaker {
    enable = true
    rollback = true
  }

  load_balancer {
    target_group_arn = data.terraform_remote_state.network.outputs.target_group-school-ver3-teacher.arn
    container_name = local.ecs-service.teacher.container-name
    container_port = 3000
  }
  network_configuration {
    subnets = [for subnet in data.terraform_remote_state.network.outputs.subnet-private : subnet.id]
    security_groups = [data.terraform_remote_state.network.outputs.security_group-ecs.id]
  }

  task_definition = aws_ecs_task_definition.teacher.arn

  tags = {
    Name = local.ecs-service.teacher.name
    Environment = var.environment
    Project = var.prefix
  }

  lifecycle {
    ignore_changes = all
  }
} 