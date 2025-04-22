locals {
  ecs-cluster-name = "${var.prefix}-${var.environment}"

  ecs-service = {
    client = {
      name = "${var.prefix}-client-${var.environment}"
      container-name =  "${var.prefix}-client-container-${var.environment}"
      log-name = "${var.prefix}-client-${var.environment}"
    }
    teacher = {
      name = "${var.prefix}-teacher-${var.environment}"
      container-name =  "${var.prefix}-teacher-container-${var.environment}"
      log-name = "${var.prefix}-teacher-${var.environment}"
    }
    student = {
      name = "${var.prefix}-student-${var.environment}"
      container-name =  "${var.prefix}-student-container-${var.environment}"
      log-name = "${var.prefix}-student-${var.environment}"
    }
    scheduler = {
      name = "${var.prefix}-scheduler-${var.environment}"
      container-name =  "${var.prefix}-scheduler-container-${var.environment}"
      log-name = "${var.prefix}-scheduler-${var.environment}"
    }
  }

  ecs-repository = {
    client-name = "school/v3/client-${var.environment}"
    scheduler-name = "school/v3/scheduler-${var.environment}"
    student-name = "school/v3/student-${var.environment}"
    teacher-name = "school/v3/teacher-${var.environment}"
  }

  ecs-image-path = "021738694739.dkr.ecr.ap-northeast-2.amazonaws.com"
  ecs-role-ecs_task_execution_role-arn = "arn:aws:iam::021738694739:role/ecsTaskExecutionRole"
}