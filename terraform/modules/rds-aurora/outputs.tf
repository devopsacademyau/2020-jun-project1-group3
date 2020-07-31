output "rds_cluster_endpoint" {
  description = "The cluster endpoint"
  value       = aws_rds_cluster.aurora_mysql_serverless.endpoint
}

output "rds_cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = aws_rds_cluster.aurora_mysql_serverless.database_name
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

