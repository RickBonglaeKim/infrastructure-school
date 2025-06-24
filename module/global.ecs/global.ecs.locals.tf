locals {
  ecs-cluster-name = "${var.prefix}-global-${var.environment}"

  ecs-service = {
    client = {
      name = "${var.prefix}-global-client-${var.environment}"
      container-name =  "${var.prefix}-global-client-container-${var.environment}"
      log-name = "${var.prefix}-global-client-${var.environment}"
    }
    teacher = {
      name = "${var.prefix}-global-teacher-${var.environment}"
      container-name =  "${var.prefix}-global-teacher-container-${var.environment}"
      log-name = "${var.prefix}-global-teacher-${var.environment}"
    }
    student = {
      name = "${var.prefix}-global-student-${var.environment}"
      container-name =  "${var.prefix}-global-student-container-${var.environment}"
      log-name = "${var.prefix}-global-student-${var.environment}"
    }
    scheduler = {
      name = "${var.prefix}-global-scheduler-${var.environment}"
      container-name =  "${var.prefix}-global-scheduler-container-${var.environment}"
      log-name = "${var.prefix}-global-scheduler-${var.environment}"
    }
  }

  ecs-repository = {
    client-name = "school/v3/global/client-${var.environment}"
    scheduler-name = "school/v3/global/scheduler-${var.environment}"
    student-name = "school/v3/global/student-${var.environment}"
    teacher-name = "school/v3/global/teacher-${var.environment}"
  }

  ecs-image-path = "021738694739.dkr.ecr.ap-northeast-2.amazonaws.com"
  ecs-role-ecs_task_execution_role-arn = "arn:aws:iam::021738694739:role/ecsTaskExecutionRole"
}