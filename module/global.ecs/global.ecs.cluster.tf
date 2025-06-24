resource "aws_ecs_cluster" "this" {
  name = local.ecs-cluster-name
  
  tags = {
    Name = local.ecs-cluster-name
    Environment = var.environment
    Project = var.prefix
  }
}