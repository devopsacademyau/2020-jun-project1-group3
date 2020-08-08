output "rds_endpoint" {
  description = "The cluster endpoint parameter value"
  value       = aws_rds_cluster.aurora_mysql_serverless.endpoint
}

output "rds_database_name" {
  description = "The DB name parameter value"
  value       = aws_rds_cluster.aurora_mysql_serverless.database_name
}

output "rds_database_username" {
  description = "The DB user parameter value"
  value       = aws_rds_cluster.aurora_mysql_serverless.master_username
}

output "rds_database_password" {
  description = "The DB user password parameter name"
  value       = aws_rds_cluster.aurora_mysql_serverless.master_password
}

output "rds_cluster_identifier" {
  value = aws_rds_cluster.aurora_mysql_serverless.cluster_identifier
}

output "rds_database_port" {
  description = "RDS cluster port"
  value       = aws_rds_cluster.aurora_mysql_serverless.port
}

output "rds_database_engine" {
  description = "RDS cluster DB engine"
  value       = aws_rds_cluster.aurora_mysql_serverless.engine
}

output "rds_database_engine_mode" {
  description = "RDS cluster DB engine mode"
  value       = aws_rds_cluster.aurora_mysql_serverless.engine_mode
}

output "rds_database_engine_version" {
  description = "RDS cluster DB engine version"
  value       = aws_rds_cluster.aurora_mysql_serverless.engine_version
}

output "rds_security_group" {
  description = "The security group for the RDS cluster"
  value       = aws_security_group.aurora_sg.id
}