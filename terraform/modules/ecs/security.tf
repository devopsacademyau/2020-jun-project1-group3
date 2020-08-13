# ALB Security Group

resource "aws_security_group" "alb_sg" {
  name   = "webapp_alb_sg"
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = var.app_port_secure
    to_port     = var.app_port_secure
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# TRAFFIC FROM ALB TO ECS
resource "aws_security_group" "fargate_sg" {
  name        = "webapp_ecs_sg"
  description = "Allow access only from ALB"
  vpc_id      = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = var.app_port
    to_port         = var.app_port
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
