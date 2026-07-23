# Project Information

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

# Networking

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "Security Group for RDS"
  type        = string
}

# Database Configuration

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "shopnaija"
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}