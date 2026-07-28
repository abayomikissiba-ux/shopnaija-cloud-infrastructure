resource "aws_lambda_function" "this" {

  function_name = "${var.project_name}-lambda"

  filename = "${path.root}/lambda/lambda.zip"

  source_code_hash = filebase64sha256("${path.root}/lambda/lambda.zip")

  role = var.lambda_role_arn

  handler = "index.lambda_handler"

  runtime = "python3.12"

  timeout = 30

  memory_size = 128

  tags = {
    Name        = "${var.project_name}-lambda"
    Environment = var.environment
  }
}