
output "ec2_instance_id" {
  description = "ID of the new EC2 instance"
  value       = aws_instance.web.id
}

output "ec2_public_ip" {
  description = "Public IP address of the web server"
  value       = aws_instance.web.public_ip
}

output "website_url" {
  description = "URL of the deployed website"
  value       = "http://${aws_instance.web.public_ip}"
}

output "vpc_id" {
  description = "ID of the newly created VPC"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "ID of the newly created public subnet"
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "ID of the newly created security group"
  value       = aws_security_group.web.id
}
