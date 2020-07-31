# Expects master user name and password to be stored in secrets manager
data "aws_secretsmanager_secret" "master_username" {
  name = "doa-rds-aurora-serverless-master-username"
}

data "aws_secretsmanager_secret" "master_password" {
  name = "doa-rds-aurora-serverless-master-pw"
}

# Subnets for RDS to be present
resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "aurora-subnets"
  subnet_ids = [var.rds_aurora_subnets]
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
  replica_scale_enabled   = var.replica_scale_enabled
  vpc_id                  = var.vpc_id
  instance_type           = var.instance_type
  vpc_security_group_ids  = [var.vpc_security_group_ids]
  storage_encrypted       = true

  scaling_configuration {
    auto_pause               = true
    max_capacity             = 2
    min_capacity             = 1
    seconds_until_auto_pause = 300
    timeout_action           = "ForceApplyCapacityChange"
  }
}
