resource "aws_ecs_task_definition" "scheduler" {
  family = local.ecs-service.scheduler.name
  execution_role_arn = local.ecs-role-ecs_task_execution_role-arn
  
  requires_compatibilities = ["FARGATE"]
  cpu = var.environment == "prod" ? 512 : 256
  memory = var.environment == "prod" ? 1024 : 512
  network_mode = "awsvpc"
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name = "${local.ecs-service.scheduler.container-name}"
      image = "${local.ecs-image-path}/${local.ecs-repository.scheduler-name}"
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
          awslogs-group = "/ecs/${local.ecs-service.scheduler.log-name}"
          mode = "non-blocking"
          awslogs-create-group = "true"
          max-buffer-size = "25m"
          awslogs-region = "ap-northeast-2"
          awslogs-stream-prefix = "ecs"
        }
      }
      
    }
  ])

  tags = {
    Name = local.ecs-service.scheduler.name
    Environment = var.environment
    Project = var.prefix
  }

  lifecycle {
    ignore_changes = all
  }
} 