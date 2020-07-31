output "load_balancer" {
  description = "the details of the load balancer created { arn, arn_suffix, dns_name, zone_id }"
  value = {
    arn        = aws_lb.this.arn
    arn_suffix = aws_lb.this.arn_suffix
    dns_name   = aws_lb.this.dns_name
    zone_id    = aws_lb.this.zone_id
  }
}