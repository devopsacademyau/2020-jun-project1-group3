resource "aws_ecs_cluster" "webapp-ecs" {
  name = "webapp-cluster"
}

data "template_file" "webapp-template" {
  template = file("./modules/ecs/webapp-tpl.json")

  vars = {
    app_image      = var.app_image
    app_port       = var.app_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region
  }
}

resource "aws_ecs_task_definition" "webapp-ecs-taskdef" {
  family                   = "webapp-taskdef"
  execution_role_arn       = aws_iam_role.webapp-ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = data.template_file.webapp-template.rendered
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory

  #  # EFS Mounts
  #  volume {
  #    name      = "webapp-efs"
  #    efs_volume_configuration {
  #      file_system_id = aws_efs_file_system.efs.id
  #      root_directory = var.efs_access_point_path
  #    }
  #   }
}

resource "aws_ecs_service" "webapp-ecs-service" {
  name             = "webapp-ecs-service"
  cluster          = aws_ecs_cluster.webapp-ecs.id
  task_definition  = aws_ecs_task_definition.webapp-ecs-taskdef.arn
  desired_count    = var.app_count
  launch_type      = "FARGATE"
  platform_version = "1.4.0"

  network_configuration {
    security_groups  = [aws_security_group.fargate-sg.id]
    subnets          = [for subnet in var.subnets : subnet]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.webapp-tg.id
    container_name   = "webapp"
    container_port   = var.app_port
  }

  depends_on = [aws_alb_listener.front_end, aws_iam_role_policy_attachment.webapp-ecs_task_execution_role]
}
