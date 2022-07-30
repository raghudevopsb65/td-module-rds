resource "aws_db_instance" "main" {
  allocated_storage      = 10
  engine                 = var.ENGINE
  engine_version         = var.ENGINE_VERSION
  instance_class         = var.RDS_INSTANCE_CLASS
  username               = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["RDS_MYSQL_USER"]
  password               = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["RDS_MYSQL_PASS"]
  parameter_group_name   = aws_db_parameter_group.main.name
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.main.id]
  identifier             = local.TAG_PREFIX
}
