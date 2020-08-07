output "ecs_cluster" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.webapp-ecs.arn
}

output "ecs_cluster_service" {
  description = "ECS Cluster Service Name"
  value       = aws_ecs_service.webapp-ecs-service
}

output "ecs_task_definitions" {
  description = "ECS Cluster Task Definition"
  value       = aws_ecs_task_definition.webapp-ecs-taskdef
}
