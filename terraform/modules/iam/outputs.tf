output "ec2_role_name" {
  value = aws_iam_role.ec2.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2.name
}

output "lambda_role_arn" {
  value = aws_iam_role.lambda.arn
}