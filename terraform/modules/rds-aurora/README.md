#RDS Module 

## Parameters
### Inputs
```
-vpc_id
-rds_aurora_subnets
-engine
-engine_mode
-engine_version
-db_name
-db_user
-backup_retention_period
-skip_final_snapshot
-aurora_port
-auto_pause
-max_capacity
-min_capacity
-seconds_until_auto_pause
-timeout_action
-db_parameter_name
-db_host_parameter_name
-db_user_parameter_name
-db_pw_parameter_name
```

### Outputs
```
-rds_cluster_endpoint_param
-rds_cluster_database_name_param
-rds_cluster_database_user_param
-rds_cluster_database_user_pw_param
-rds_cluster_identifier
-rds_database_port
-rds_database_engine
-rds_database_engine_mode
-rds_database_engine_version
-rds_security_group
```

## Objectives:

- Create a RDS Aurora MySQL (5.7+) database to be used by Wordpress. Aurora can be Serverless.

## Acceptance Criteria:

- All resources to be created using Terraform
- RDS Aurora Mysql (version 5.7+)
- Serverless version is recommended due to costs
- No need for aurora replica
- Use a random generated password and upload to SSM Parameter Store for future use
- Use custom VPC from network stack (private subnets)
- Backup just for one day retention is fine
- Encryption enabled
- No need for performance insights, enhanced monitoring and IAM authentication
- Disable deletion protection
- Database need to be accessible from public EC2 running on public subnets
- GitHub can't have any secrets commited.

