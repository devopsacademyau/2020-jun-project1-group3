# Store RDS info in parameter store
resource "aws_ssm_parameter" "aurora_cluster_endpoint" {
  name        = var.db_host_parameter_name
  description = "RDS aurora cluster endpoint"
  type        = "SecureString"
  value       = var.rds_endpoint
  overwrite   = true
}

resource "aws_ssm_parameter" "aurora_db_name" {
  name        = var.db_parameter_name
  description = "RDS aurora db name"
  type        = "SecureString"
  value       = var.rds_database_name
  overwrite   = true
}

resource "aws_ssm_parameter" "aurora_username" {
  name        = var.db_user_parameter_name
  description = "RDS aurora username"
  type        = "SecureString"
  value       = var.rds_database_username
  overwrite   = true
}

resource "aws_ssm_parameter" "aurora_password" {
  name        = var.db_pw_parameter_name
  description = "RDS aurora password"
  type        = "SecureString"
  value       = var.rds_database_password
  overwrite   = true
}

