data "aws_ssm_parameter" "db_host" {
  name = "/wordpress/WORDPRESS_DB_HOST"
}

data "aws_ssm_parameter" "db_name" {
  name = "/wordpress/WORDPRESS_DB_NAME"
}

data "aws_ssm_parameter" "db_user" {
  name = "/wordpress/WORDPRESS_DB_USER"
}

data "aws_ssm_parameter" "db_password" {
  name = "/wordpress/WORDPRESS_DB_PASSWORD"
}

resource "aws_ecs_cluster" "webapp_ecs" {
  name = "webapp-cluster"
}

resource "aws_ecs_task_definition" "webapp_ecs_taskdef" {
  family                   = "webapp_tasks_family"
  execution_role_arn       = aws_iam_role.webapp_ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.webapp_ecs_task_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory

  volume {
    name = "webapp_efs"
    efs_volume_configuration {
      file_system_id = var.efs_id
    }
  }

  container_definitions = jsonencode([
    {
      name      = "webapp"
      image     = var.app_image
      essential = true
      mountPoints = [
        {
          sourceVolume  = "webapp_efs"
          containerPath = "/var/www/html"
        }
      ]
      portMappings = [
        {
          containerPort = var.app_port
          hostPort      = var.app_port
        }
      ]
      "logConfiguration" : {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-group" : "/ecs/webapp",
          "awslogs-region" : var.aws_region,
          "awslogs-stream-prefix" : "ecs"
        }
      }
      "environment" : [
        {
          "name" : "WORDPRESS_DB_HOST",
          "value" : data.aws_ssm_parameter.db_host.value
        },
        {
          "name" : "WORDPRESS_DB_USER",
          "value" : data.aws_ssm_parameter.db_user.value
        },
        {
          "name" : "WORDPRESS_DB_PASSWORD",
          "value" : data.aws_ssm_parameter.db_password.value
        },
        {
          "name" : "WORDPRESS_DB_NAME",
          "value" : data.aws_ssm_parameter.db_name.value
        }
      ]
    }
  ])

}

resource "aws_ecs_service" "webapp_ecs_service" {
  name                 = "webapp-ecs-service"
  cluster              = aws_ecs_cluster.webapp_ecs.id
  task_definition      = aws_ecs_task_definition.webapp_ecs_taskdef.arn
  desired_count        = var.app_count
  launch_type          = "FARGATE"
  platform_version     = "1.4.0"
  force_new_deployment = true
  scheduling_strategy  = "REPLICA"

  network_configuration {
    security_groups  = [aws_security_group.fargate_sg.id]
    subnets          = [for id in var.private_subnets : id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.webapp_tg.id
    container_name   = "webapp"
    container_port   = var.app_port
  }

  depends_on = [aws_alb_listener.front_end, aws_iam_role_policy_attachment.attach_ecs_task_execution_role, aws_iam_role_policy_attachment.attach_ecs_task_role]
}
