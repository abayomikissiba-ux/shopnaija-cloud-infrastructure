module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr

  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr

  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
}

module "security_groups" {

  source = "./modules/security_groups"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

}

module "alb" {

  source = "./modules/alb"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

  public_subnet_ids = module.vpc.public_subnet_ids

  alb_security_group_id = module.security_groups.alb_security_group_id

}

module "iam" {

  source = "./modules/iam"

  project_name = var.project_name
  environment  = var.environment

}

module "compute" {

  source = "./modules/compute"

  project_name = var.project_name
  environment  = var.environment

  private_subnet_ids = module.vpc.private_subnet_ids

  ec2_security_group_id = module.security_groups.ec2_security_group_id

  instance_profile_name = module.iam.instance_profile_name

  target_group_arn = module.alb.target_group_arn

}

module "rds" {

  source = "./modules/rds"

  project_name = var.project_name
  environment  = var.environment

  private_subnet_ids = module.vpc.private_subnet_ids

  rds_security_group_id = module.security_groups.rds_security_group_id

  db_username = var.db_username
  db_password = var.db_password

}

module "s3" {

  source = "./modules/s3"

  project_name = var.project_name
  environment  = var.environment

}

module "api_gateway" {

  source = "./modules/api_gateway"

  project_name = var.project_name
  environment  = var.environment

  lambda_function_arn  = module.lambda.lambda_function_arn
  lambda_function_name = module.lambda.lambda_function_name

}