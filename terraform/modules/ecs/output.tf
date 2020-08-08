output "ecs_cluster" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.webapp_ecs.arn
}

output "ecs_cluster_service" {
  description = "ECS Cluster Service Name"
  value       = aws_ecs_service.webapp_ecs_service
}

output "ecs_task_definitions" {
  description = "ECS Cluster Task Definition"
  value       = aws_ecs_task_definition.webapp_ecs_taskdef
}
