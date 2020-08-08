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
