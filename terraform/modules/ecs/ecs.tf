resource "aws_ecs_cluster" "webapp-ecs" {
   name = "webapp-cluster"
}

data "template_file" "webapp-template" {
   template = file("/Users/vanithak/Terraform/devops-project-group3/webapp-tpl.json")

  vars = {
    app_image      = var.app_image
    app_port       = var.app_port
    fargate_cpu    = 256
    fargate_memory = 512
    aws_region     = var.aws_region
  }
}

resource "aws_ecs_task_definition" "ecs-taskdef" {
  family                   = "service"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = data.template_file.webapp-template.rendered
  cpu = 256
  memory = 512
}

resource "aws_ecs_service" "ecs-service" {
  name            = "webapp-ecs-service"
  cluster         = aws_ecs_cluster.webapp-ecs.id
  task_definition = aws_ecs_task_definition.ecs-taskdef.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"
 
  network_configuration {
    subnets = ["subnet-06fff67528f013a07","subnet-0754238dbee62ef2f"]
    assign_public_ip = true
  }

  depends_on = [ aws_iam_role_policy_attachment.ecs_task_execution_role]
}
