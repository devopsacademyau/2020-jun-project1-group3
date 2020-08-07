# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "webapp_log_group" {
  name              = "/ecs/webapp1"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_stream" "webapp_log_stream" {
  name           = "webapp1-log-stream"
  log_group_name = aws_cloudwatch_log_group.webapp_log_group.name
}