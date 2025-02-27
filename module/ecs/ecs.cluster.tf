
resource "aws_ecs_cluster" "this" {
  name = local.ecs-cluster-name
  
}