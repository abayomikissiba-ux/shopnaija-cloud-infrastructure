# Project Information
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

output "vpc_id" {
  description = "VPC ID"

  value = module.vpc.vpc_id
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = module.alb.alb_dns_name
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = module.alb.target_group_arn
}

output "instance_profile_name" {
  value = module.iam.instance_profile_name
}

output "lambda_role_arn" {
  value = module.iam.lambda_role_arn
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3.bucket_name
}