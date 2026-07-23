output "cpu_alarm_name" {
  value = aws_cloudwatch_metric_alarm.ec2_cpu_high.alarm_name
}