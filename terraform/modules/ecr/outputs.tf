output "ecr" {
  description = "Get AWS ECR URL"
  value = {
    repository_url = aws_ecr_repository.project3_ecr.repository_url
  }
}