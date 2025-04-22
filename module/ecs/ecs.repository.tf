
resource "aws_ecr_repository" "client" {
  name = local.ecs-repository.client-name
  
  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    name = local.ecs-repository.client-name
    environment = var.environment
  }
}


resource "aws_ecr_repository" "scheduler" {
  name = local.ecs-repository.scheduler-name
  
  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    name = local.ecs-repository.scheduler-name
    environment = var.environment
  }
}



resource "aws_ecr_repository" "teacher" {
  name = local.ecs-repository.teacher-name
  
  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    name = local.ecs-repository.teacher-name
    environment = var.environment
  }
}


resource "aws_ecr_repository" "student" {
  name = local.ecs-repository.student-name
  
  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    name = local.ecs-repository.student-name
    environment = var.environment
  }
}


resource "aws_ecr_repository" "scheduler" {
  name = local.ecs-repository.scheduler-name
  
  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    name = local.ecs-repository.scheduler-name
    environment = var.environment
  }
}