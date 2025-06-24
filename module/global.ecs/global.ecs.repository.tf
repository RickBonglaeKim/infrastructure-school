resource "aws_ecr_repository" "client" {
  name = local.ecs-repository.client-name
  
  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    Name = local.ecs-repository.client-name
    Environment = var.environment
    Project = var.prefix
  }
}


resource "aws_ecr_repository" "scheduler" {
  name = local.ecs-repository.scheduler-name
  
  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    Name = local.ecs-repository.scheduler-name
    Environment = var.environment
    Project = var.prefix
  }
}



resource "aws_ecr_repository" "teacher" {
  name = local.ecs-repository.teacher-name
  
  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    Name = local.ecs-repository.teacher-name
    Environment = var.environment
    Project = var.prefix
  }
}


resource "aws_ecr_repository" "student" {
  name = local.ecs-repository.student-name
  
  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    Name = local.ecs-repository.student-name
    Environment = var.environment
    Project = var.prefix
  }
} 