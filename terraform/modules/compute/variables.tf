# Project Information

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

# Networking

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

# Security

variable "ec2_security_group_id" {
  type = string
}

# IAM

variable "instance_profile_name" {
  type = string
}

# Load Balancer

variable "target_group_arn" {
  type = string
}