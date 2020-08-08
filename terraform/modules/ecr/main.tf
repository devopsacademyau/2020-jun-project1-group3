resource "aws_ecr_repository" "project3_ecr" {
  name                 = var.repository_name
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "project3 ecr"
  }

}

