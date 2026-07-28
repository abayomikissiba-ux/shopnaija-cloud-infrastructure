# DB Subnet Group

resource "aws_db_subnet_group" "this" {

  name = "${var.project_name}-db-subnet-group"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.project_name}-db-subnet-group"
    Environment = var.environment
  }

}

# Amazon RDS

resource "aws_db_instance" "this" {

  identifier = "${var.project_name}-database"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = [
    var.rds_security_group_id
  ]

  publicly_accessible = false

  backup_retention_period = 7

  skip_final_snapshot = true

  deletion_protection = false

  multi_az = false

  storage_encrypted = true

  auto_minor_version_upgrade = true

  tags = {
    Name        = "${var.project_name}-rds"
    Environment = var.environment
  }

}