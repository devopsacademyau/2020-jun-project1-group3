output "efs_dns_name" {
  description = "EFS DNS endpoint"
  value       = aws_efs_file_system.efs.dns_name
}

output "efs_id" {
  description = "EFS ID"
  value       = aws_efs_file_system.efs.id
}

output "efs_access_point_id" {
  description = "EFS access point ID"
  value       = aws_efs_access_point.efs_access_point.id
}