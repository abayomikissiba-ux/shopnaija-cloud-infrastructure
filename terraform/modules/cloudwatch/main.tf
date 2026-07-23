resource "aws_cloudwatch_metric_alarm" "ec2_cpu_high" {

  alarm_name = "${var.project_name}-ec2-cpu-high"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 80

  alarm_description = "High CPU Utilization"

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }

}

resource "aws_cloudwatch_metric_alarm" "rds_cpu_high" {

  alarm_name = "${var.project_name}-rds-cpu-high"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/RDS"

  period = 300

  statistic = "Average"

  threshold = 80

  alarm_description = "High RDS CPU"

  dimensions = {
    DBInstanceIdentifier = var.db_identifier
  }

}

resource "aws_cloudwatch_metric_alarm" "instance_health" {

  alarm_name = "${var.project_name}-instance-health"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "StatusCheckFailed"

  namespace = "AWS/EC2"

  period = 60

  statistic = "Maximum"

  threshold = 0

  alarm_description = "EC2 Instance Health Check Failed"

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }

}

resource "aws_cloudwatch_metric_alarm" "disk_space" {

  alarm_name = "${var.project_name}-disk-space"

  comparison_operator = "LessThanThreshold"

  evaluation_periods = 2

  metric_name = "disk_used_percent"

  namespace = "CWAgent"

  period = 300

  statistic = "Average"

  threshold = 80

  alarm_description = "Disk usage is high"

}