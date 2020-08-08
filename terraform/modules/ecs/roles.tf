# ECS task execution role data
data "aws_iam_policy_document" "generate_assume_policy_doc" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "generate_access_policy_doc" {
  statement {
    sid       = "AllAccess"
    actions   = ["*"]
    resources = ["*"]
  }
}


resource "aws_iam_policy" "webapp_task_policy" {
  name   = "webapp-task-policy"
  policy = data.aws_iam_policy_document.generate_access_policy_doc.json
}


# ECS task execution role
resource "aws_iam_role" "webapp_ecs_task_execution_role" {
  name               = var.ecs_task_execution_role_name
  assume_role_policy = data.aws_iam_policy_document.generate_assume_policy_doc.json
}

# ECS task execution role policy attachment
resource "aws_iam_role_policy_attachment" "attach_ecs_task_execution_role" {
  role       = aws_iam_role.webapp_ecs_task_execution_role.name
  policy_arn = aws_iam_policy.webapp_task_policy.arn
}

resource "aws_iam_role" "webapp_ecs_task_role" {
  name               = var.ecs_task_role_name
  assume_role_policy = data.aws_iam_policy_document.generate_assume_policy_doc.json
}

# ECS task role policy attachment
resource "aws_iam_role_policy_attachment" "attach_ecs_task_role" {
  role       = aws_iam_role.webapp_ecs_task_role.name
  policy_arn = aws_iam_policy.webapp_task_policy.arn
}
