

resource "aws_db_instance" "mysql" {
  
  engine = local.mysql.engin
  engine_version = local.mysql.version
  identifier =  local.mysql.identifier

  username = var.user-name
  password =var.user-password
  instance_class = var.instance-class
  allocated_storage = var.storage-size
  storage_type = var.storage-type
  
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.security_group-mysql.id]
  db_subnet_group_name = aws_db_subnet_group.mysql.name

  allow_major_version_upgrade = false
  skip_final_snapshot = var.environment == "dev" ? true : false
  apply_immediately = var.environment == "dev" ? true : false

  storage_encrypted = true
  max_allocated_storage = 1000

  backup_retention_period = var.environment == "dev" ? 5 : 30
  backup_window = "20:00-21:00" // UTC
  maintenance_window = "sat:15:00-sat:19:00"  // UTC

  tags = {
    Name = local.mysql.identifier
    Environment = var.environment
  }
}