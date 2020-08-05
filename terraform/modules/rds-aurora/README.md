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

