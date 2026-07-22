# Project Variables

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}


# AWS Configuration

variable "aws_region" {
  description = "AWS Region where resources will be deployed"
  type        = string
}


# Networking
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

#########################################
# Public Subnets
#########################################

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}


# Private Subnets
variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}