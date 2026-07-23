# Project Information

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

# Compute

variable "autoscaling_group_name" {
  description = "Auto Scaling Group Name"
  type        = string
}

# Database

variable "db_identifier" {
  description = "RDS DB Instance Identifier"
  type        = string
}
