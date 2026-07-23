variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "lambda_function_arn" {
  description = "Lambda Function ARN"
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda Function Name"
  type        = string
}