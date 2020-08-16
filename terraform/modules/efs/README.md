## EFS Module

## Parameters

### Inputs

- vpc_id
- private_subnet_cidr
- private_subnet_ids
- efs_unique_name
- efs_encrypted
- efs_performance_mode
- efs_throughput_mode
- efs_access_point_path
- efs_access_point_name

### Outputs

- efs_dns_name
- efs_id
- efs_access_point_id


## Objectives:

- Use vpc from network stack
- Available in both AZs
- Security group allowing only ECS instances to access it
- No lifecycle policy
- Throughput mode bursting
- Performance mode general purpose
- No need for encryption
- No need for IAM authentication
- Add one access point:
- Name wordpress
- Path /wordpress

## Acceptance Criteria:

- EFS is available in at least two AZ
- I can mount efs volume on an ec2 instance running on private subnet following instructions https://docs.aws.amazon.com/efs/latest/ug/mounting-fs.html
- I CAN'T mount efs volume from instance on public subnet
