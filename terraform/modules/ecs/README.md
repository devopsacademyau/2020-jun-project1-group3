## ECS Module

### ECS CLUSTER CREATION
 ECS FARGATE Cluster is created with the image(wordpress:php7.4) from Elastic Container Registry. Refer [ECR Module](../ecr/README.md)

## Paramaters
## Inputs
- aws_region
- vpc_id
- private_subnets
- public_subnets
- ecs_task_execution_role_name
- ecs_task_role_name
- az_count
- app_image
- app_port
- app_port_secure
- app_count
- health_check_path
- fargate_cpu
- fargate_memory
- efs_access_point
- efs_id
- rds_endpoint
- rds_database_name
- rds_database_username
- rds_database_password
- domain_name
- hosted_zone_id
- acm_cert_arn


## Outputs
- ecs_cluster
- ecs_cluster_service
- ecs_task_definitions

### MORE INFORMATION:

Below are the terraform files for creating ECS FARGATE Cluster
- Application Load Balancer - [alb.tf](./alb.tf)
- ECS FARGATE Cluster - [FARGATE](./main.tf)
- IAM Roles for FARGATE - [IAM Role](./roles.tf)
- ALB and FARGATE Security Group - [Security Group](./security.tf)
- Enable Cloudwatch Logs - [Logging](./logs.tf)
- ECS Autoscaling - [ECS AutoScaling](./auto_scaling.tf)


Logging and Alarming are enabled for ECS for monitoring and Notifying health of FARGATE containers. Refer [Logging & Alarming](../../../docs/LoggingandAlarming.md)

AutoScaling is enabled based on the below configuration Criteria.
Desired Capacity = 2
Minimum Capacity = 2
Maximum Capacity = 4

Scale-up: Scale up will happen when the CPU is 85%
Scale-Down: Scale down will happen when the CPU is 10%


