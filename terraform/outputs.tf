############################################
# Project Information
############################################

output "project_name" {
  description = "Project name"
  value       = var.project_name
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}

output "aws_region" {
  description = "AWS deployment region"
  value       = var.aws_region
}

############################################
# Networking
############################################

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

############################################
# Security Groups
############################################

output "alb_security_group_id" {
  description = "ALB Security Group ID"
  value       = module.security_groups.alb_security_group_id
}

output "ec2_security_group_id" {
  description = "EC2 Security Group ID"
  value       = module.security_groups.ec2_security_group_id
}

output "rds_security_group_id" {
  description = "RDS Security Group ID"
  value       = module.security_groups.rds_security_group_id
}

############################################
# Load Balancer
############################################

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = module.alb.alb_dns_name
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = module.alb.target_group_arn
}

############################################
# IAM
############################################

output "instance_profile_name" {
  description = "EC2 Instance Profile Name"
  value       = module.iam.instance_profile_name
}

output "lambda_role_arn" {
  description = "Lambda IAM Role ARN"
  value       = module.iam.lambda_role_arn
}

############################################
# Compute
############################################

output "autoscaling_group_name" {
  description = "Auto Scaling Group Name"
  value       = module.compute.autoscaling_group_name
}

############################################
# Database
############################################

output "db_identifier" {
  description = "RDS Database Identifier"
  value       = module.rds.db_identifier
}

output "db_endpoint" {
  description = "RDS Database Endpoint"
  value       = module.rds.db_endpoint
}

############################################
# Storage
############################################

output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = module.s3.bucket_name
}

############################################
# Serverless
############################################

output "lambda_function_name" {
  description = "Lambda Function Name"
  value       = module.lambda.lambda_function_name
}

output "lambda_function_arn" {
  description = "Lambda Function ARN"
  value       = module.lambda.lambda_function_arn
}

output "api_gateway_endpoint" {
  description = "API Gateway Endpoint"
  value       = module.api_gateway.api_endpoint
}

############################################
# Monitoring
############################################

output "cpu_alarm_name" {
  description = "CloudWatch CPU Alarm Name"
  value       = module.cloudwatch.cpu_alarm_name
}

output "lambda_log_group" {
  description = "Lambda CloudWatch Log Group"
  value       = module.cloudwatch.lambda_log_group
}