# EC2 Assume Role Policy

data "aws_iam_policy_document" "ec2_assume_role" {

  statement {

    effect = "Allow"

    principals {

      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]

    }

    actions = [
      "sts:AssumeRole"
    ]

  }

}


# EC2 IAM Role

resource "aws_iam_role" "ec2" {

  name = "${var.project_name}-ec2-role"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = {
    Name        = "${var.project_name}-ec2-role"
    Environment = var.environment
  }

}

############################################
# SSM Access
############################################

resource "aws_iam_role_policy_attachment" "ssm" {

  role = aws_iam_role.ec2.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

}

# CloudWatch Agent

resource "aws_iam_role_policy_attachment" "cloudwatch" {

  role = aws_iam_role.ec2.name

  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"

}

# EC2 Instance Profile

resource "aws_iam_instance_profile" "ec2" {

  name = "${var.project_name}-instance-profile"

  role = aws_iam_role.ec2.name

}

# Lambda Assume Role

data "aws_iam_policy_document" "lambda_assume_role" {

  statement {

    effect = "Allow"

    principals {

      type = "Service"

      identifiers = [
        "lambda.amazonaws.com"
      ]

    }

    actions = [
      "sts:AssumeRole"
    ]

  }

}


# Lambda Role

resource "aws_iam_role" "lambda" {

  name = "${var.project_name}-lambda-role"

  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json

  tags = {
    Name        = "${var.project_name}-lambda-role"
    Environment = var.environment
  }

}

# Lambda CloudWatch Logs

resource "aws_iam_role_policy_attachment" "lambda_logs" {

  role = aws_iam_role.lambda.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"

}