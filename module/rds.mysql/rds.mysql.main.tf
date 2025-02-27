

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

  skip_final_snapshot = true
  
  allow_major_version_upgrade = true
  storage_encrypted = true
  
  apply_immediately = true

}