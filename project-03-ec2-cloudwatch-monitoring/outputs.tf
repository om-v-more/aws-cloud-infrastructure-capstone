
output "ec2_instance_id" {
  description = "ID of the monitoring EC2 instance"
  value       = aws_instance.monitoring_ec2.id
}

output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.monitoring_ec2.public_ip
}

output "cloudwatch_alarm_name" {
  description = "Name of the CloudWatch CPU alarm"
  value       = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}

output "cpu_threshold" {
  description = "Configured CPU utilization threshold"
  value       = var.cpu_threshold
}

output "aws_region" {
  description = "AWS deployment region"
  value       = var.aws_region
}
