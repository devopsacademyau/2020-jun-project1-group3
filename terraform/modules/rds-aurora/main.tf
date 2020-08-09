# Read availability zones
data "aws_availability_zones" "aws_az" {
  state = "available"
}

resource "random_password" "password" {
  length  = 16
  special = false
}

# Extract cidr from VPC
data "aws_vpc" "main_vpc_info" {
  id = var.vpc_id
}

# Security group for RDS
resource "aws_security_group" "aurora_sg" {
  name   = "aurora-sg"
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = var.aurora_port
    to_port     = var.aurora_port
    cidr_blocks = [data.aws_vpc.main_vpc_info.cidr_block]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = [data.aws_vpc.main_vpc_info.cidr_block]
  }
}

# Subnets for RDS to be present
resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "aurora-subnet-group"
  subnet_ids = [for subnet in var.rds_aurora_subnets : subnet]
}

# Deploys a RDS Aurora serverless cluster
resource "aws_rds_cluster" "aurora_mysql_serverless" {
  engine                  = var.engine
  engine_mode             = var.engine_mode
  engine_version          = var.engine_version
  database_name           = var.db_name
  master_username         = var.db_user
  master_password         = random_password.password.result
  backup_retention_period = var.backup_retention_period
  vpc_security_group_ids  = [aws_security_group.aurora_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.id
  availability_zones      = [for az in data.aws_availability_zones.aws_az.names : az]
  storage_encrypted       = true
  skip_final_snapshot     = var.skip_final_snapshot

  scaling_configuration {
    auto_pause               = var.auto_pause
    max_capacity             = var.max_capacity
    min_capacity             = var.min_capacity
    seconds_until_auto_pause = var.seconds_until_auto_pause
    timeout_action           = var.timeout_action
  }
}

# # Store RDS info in parameter store
# resource "aws_ssm_parameter" "aurora_cluster_endpoint" {
#   name        = var.db_host_parameter_name
#   description = "RDS aurora cluster endpoint"
#   type        = "SecureString"
#   value       = aws_rds_cluster.aurora_mysql_serverless.endpoint
#   overwrite   = true
# }

# resource "aws_ssm_parameter" "aurora_username" {
#   name        = var.db_user_parameter_name
#   description = "RDS aurora username"
#   type        = "SecureString"
#   value       = var.db_user
#   overwrite   = true
# }

# resource "aws_ssm_parameter" "aurora_password" {
#   name        = var.db_pw_parameter_name
#   description = "RDS aurora password"
#   type        = "SecureString"
#   value       = random_password.password.result
#   overwrite   = true
# }

# resource "aws_ssm_parameter" "aurora_db_name" {
#   name        = var.db_parameter_name
#   description = "RDS aurora db name"
#   type        = "SecureString"
#   value       = var.db_name
#   overwrite   = true
# }
