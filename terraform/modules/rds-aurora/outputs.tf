output "rds_cluster_endpoint_param" {
  description = "The cluster endpoint parameter name"
  value       = aws_ssm_parameter.aurora_cluster_endpoint.name
}

output "rds_cluster_database_name_param" {
  description = "The DB name parameter name"
  value       = aws_ssm_parameter.aurora_db_name.name
}

output "rds_cluster_database_user_param" {
  description = "The DB user parameter name"
  value       = aws_ssm_parameter.aurora_username.name
}

output "rds_cluster_database_user_pw_param" {
  description = "The DB user password parameter name"
  value       = aws_ssm_parameter.aurora_password.name
}

output "rds_cluster_database_port" {
  description = "RDS cluster port"
  value       = aws_rds_cluster.aurora_mysql_serverless.port
}

output "rds_cluster_database_engine" {
  description = "RDS cluster DB engine"
  value       = aws_rds_cluster.aurora_mysql_serverless.engine
}

output "rds_cluster_database_engine_mode" {
  description = "RDS cluster DB engine mode"
  value       = aws_rds_cluster.aurora_mysql_serverless.engine_mode
}

output "rds_cluster_database_engine_version" {
  description = "RDS cluster DB engine version"
  value       = aws_rds_cluster.aurora_mysql_serverless.engine_version
}

output "rds_cluster_security_group" {
  description = "The security group for the RDS cluster"
  value       = aws_security_group.aurora_sg.id
}