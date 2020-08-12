resource "aws_alb" "webapp_alb" {
  subnets         = var.public_subnets
  security_groups = [aws_security_group.alb_sg.id]
}

resource "aws_alb_target_group" "webapp_tg" {
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    interval = 60
    path     = "/index.html"
    port     = 80
    protocol = "HTTP"
    timeout  = 30
    matcher  = "200-302,404"
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_alb.webapp_alb]
}

# Redirect all traffic from ALB to Target Group
resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.webapp_alb.id
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.webapp_tg.id
    type             = "forward"
  }
}

# We are creating route53 hosted zone on the console
# as it is best to have a set of NS records to configure
# our domain name in freenom
resource "aws_route53_record" "wp_route53" {
  zone_id = var.hosted_zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_alb.webapp_alb.dns_name
    zone_id                = aws_alb.webapp_alb.zone_id
    evaluate_target_health = true
  }
}