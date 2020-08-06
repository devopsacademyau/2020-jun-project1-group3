locals {
  #  Waiting for a valid acm certificate
  #  targetPort     = 443
  #  targetProtocol = "HTTPS"
  #  Let's test with http only
  targetPort     = 80
  targetProtocol = "HTTP"
}

resource "aws_lb" "this" {
  name                       = "wordpress-lb"
  internal                   = false
  load_balancer_type         = "application"
  subnets                    = var.subnets
  enable_deletion_protection = false

  tags = {
    Name = "wordpress-lb"
  }
}

resource "aws_lb_target_group" "this" {
  name     = "wordpress-lb-tg"
  port     = local.targetPort
  protocol = local.targetProtocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = local.targetPort
  protocol          = local.targetProtocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_security_group" "sg_wp" {
  name   = "wordpress web access"
  vpc_id = var.vpc_id
  ingress {
    from_port   = local.targetPort
    to_port     = local.targetPort
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # TODO: restrict the egress, probably it would only need access to EC2 instances SG
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wordpress-allow-web-access-sg"
  }
}