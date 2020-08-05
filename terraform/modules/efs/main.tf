# Extract cidr from VPC
data "aws_vpc" "main_vpc_info" {
  id = var.vpc_id
}

# Security group for the EFS with allowed ingress only from private subnets
resource "aws_security_group" "efs_sg" {
  description = "EFS security group with allowed ingress only from private subnets"

  vpc_id = var.vpc_id
  name   = "doa-project1-efs-sg"

  ingress {
    protocol    = "tcp"
    from_port   = 2049
    to_port     = 2049
    cidr_blocks = [for cidr in var.private_subnet_cidr : cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [data.aws_vpc.main_vpc_info.cidr_block]
  }
}

resource "aws_efs_file_system" "efs" {
  creation_token   = var.efs_unique_name
  encrypted        = var.efs_encrypted
  performance_mode = var.efs_performance_mode
  throughput_mode  = var.efs_throughput_mode
}

resource "aws_efs_mount_target" "efs_mount_target" {
  count           = length(var.private_subnet_ids)
  subnet_id       = var.private_subnet_ids[count.index]
  file_system_id  = aws_efs_file_system.efs.id
  security_groups = [aws_security_group.efs_sg.id]
}

resource "aws_efs_access_point" "efs_access_point" {
  file_system_id = aws_efs_file_system.efs.id
  root_directory {
    path = var.efs_access_point_path
  }
  tags = {
    Name = var.efs_access_point_name
  }
}