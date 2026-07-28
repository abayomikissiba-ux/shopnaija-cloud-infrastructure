output "db_identifier" {
  description = "RDS Instance Identifier"
  value       = aws_db_instance.this.id
}

output "db_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.this.endpoint
}

output "db_name" {
  description = "Database Name"
  value       = aws_db_instance.this.db_name
}

output "db_subnet_group" {
  description = "DB Subnet Group"
  value       = aws_db_subnet_group.this.name
}