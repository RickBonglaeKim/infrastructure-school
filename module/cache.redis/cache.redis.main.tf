
# resource "aws_elasticache_serverless_cache" "valkey" {
#   engine = local.engine
#   name = replace(replace(local.name, ".", ""), "_", "-")
  
#   major_engine_version = local.major-version
#   subnet_ids = [for subnet in data.terraform_remote_state.network.outputs.subnet-private : subnet.id]
#   security_group_ids = [data.terraform_remote_state.network.outputs.security_group-valkey.id]
  
# }


locals {
  subnet-group-name = replace(replace(local.redis-subnet_group-name, ".", ""), "_", "-")
}

resource "aws_elasticache_subnet_group" "redis" {
  name = local.subnet-group-name
  subnet_ids = [for subnet in data.terraform_remote_state.network.outputs.subnet-private : subnet.id]
}


resource "aws_elasticache_cluster" "redis" {
  cluster_id = replace(replace(local.cluster-id, ".", ""), "_", "-")
  engine = "redis"
  node_type = var.node_type
  num_cache_nodes = var.cache_node_number
  engine_version = "7.1"
  port = 6379
  parameter_group_name = "default.redis7"

  subnet_group_name = aws_elasticache_subnet_group.redis.name
  security_group_ids = [data.terraform_remote_state.network.outputs.security_group-cache.id]

  apply_immediately = true

  tags = {
    Name = local.cluster-id
    Environment = var.environment
  }
}