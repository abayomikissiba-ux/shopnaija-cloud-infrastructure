output "db_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.this.address
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.this.db_name
}

output "database_endpoint" {
  description = "Database endpoint"
  value       = module.rds.db_endpoint
}

output "db_identifier" {
  description = "RDS instance identifier"
  value       = aws_db_instance.this.identifier
}