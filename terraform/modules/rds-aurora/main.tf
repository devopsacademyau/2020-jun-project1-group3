# Expects master user name and password to be stored in secrets manager
data "aws_secretsmanager_secret" "master_username" {
  name = "prod/doa/aurora/admin/username"
}

data "aws_secretsmanager_secret" "master_password" {
  name = "prod/doa/aurora/admin/password"
}

# Subnets for RDS to be present
resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "aurora-subnets"
  for_each   = toset(var.rds_aurora_subnets)
  subnet_ids = [each.value]
}

# Deploys a RDS Aurora serverless cluster
resource "aws_rds_cluster" "aurora_mysql_serverless" {
  engine                  = "aurora-mysql"
  engine_mode             = "serverless"
  engine_version          = var.engine_version
  database_name           = var.database_name
  master_username         = data.aws_secretsmanager_secret.master_username.id
  master_password         = data.aws_secretsmanager_secret.master_password.id
  backup_retention_period = var.backup_retention_period
  for_each                = toset(var.vpc_security_group_ids)
  vpc_security_group_ids  = [each.value]
  availability_zones      = [for az in var.availability_zones: az]
  storage_encrypted       = true

  scaling_configuration {
    auto_pause               = true
    max_capacity             = 2
    min_capacity             = 1
    seconds_until_auto_pause = 300
    timeout_action           = "ForceApplyCapacityChange"
  }
}
