

resource "aws_ecs_task_definition" "teacher" {
  family = local.ecs-service.teacher.name
  execution_role_arn = local.ecs-role-ecs_task_execution_role-arn
  
  requires_compatibilities = ["FARGATE"]
  cpu = var.environment == "prod" ? 1024 : 256
  memory = var.environment == "prod" ? 2048 : 512
  network_mode = "awsvpc"
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name = "${local.ecs-service.teacher.container-name}"
      image = "${local.ecs-image-path}/${local.ecs-repository.teacher-name}"
      essential = true
      
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
          protocol = "tcp"
          appProtocol = "http"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group = "/ecs/${local.ecs-service.teacher.log-name}"
          mode = "non-blocking"
          awslogs-create-group = "true"
          max-buffer-size = "25m"
          awslogs-region = "ap-northeast-2"
          awslogs-stream-prefix = "ecs"
        }
      }
      
    }
  ])

  lifecycle {
    ignore_changes = all
  }
}