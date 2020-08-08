resource "aws_appautoscaling_target" "target" {
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_cluster.webapp_ecs.name}/${aws_ecs_service.webapp_ecs_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = 2
  max_capacity       = 4
}

# Automatically scale capacity up by one
resource "aws_appautoscaling_policy" "up" {
  name               = "webapp_scale_up"
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_cluster.webapp_ecs.name}/${aws_ecs_service.webapp_ecs_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }
  depends_on = [aws_appautoscaling_target.target]
}


# Automatically scale capacity down by one
resource "aws_appautoscaling_policy" "down" {
  name               = "webapp_scale_down"
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_cluster.webapp_ecs.name}/${aws_ecs_service.webapp_ecs_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -1
    }
  }
  depends_on = [aws_appautoscaling_target.target]
}

# CloudWatch alarm that triggers the autoscaling up policy
resource "aws_cloudwatch_metric_alarm" "service_cpu_high" {
  alarm_name          = "webapp_cpu_utilisation_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilisation"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "85"

  dimensions = {
    ClusterName = aws_ecs_cluster.webapp_ecs.name
    ServiceName = aws_ecs_service.webapp_ecs_service.name
  }
  alarm_actions = [aws_appautoscaling_policy.up.arn]
}

# CloudWatch alarm that triggers the autoscaling down policy
resource "aws_cloudwatch_metric_alarm" "service_cpu_low" {
  alarm_name          = "webapp-cpu-utilisation-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilisation"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    ClusterName = aws_ecs_cluster.webapp_ecs.name
    ServiceName = aws_ecs_service.webapp_ecs_service.name
  }
  alarm_actions = [aws_appautoscaling_policy.down.arn]
}
