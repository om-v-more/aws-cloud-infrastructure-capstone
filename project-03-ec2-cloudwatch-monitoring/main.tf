
# --------------------------------------------------
# Get default VPC and subnet
# --------------------------------------------------

data "aws_vpc" "existing" {
  id = "vpc-0097e2c9a1f7be21a"
}

data "aws_subnet" "existing" {
  id = "subnet-02e27201e6d6af7cb"
}

# --------------------------------------------------
# Get latest Amazon Linux 2023 AMI
# --------------------------------------------------

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# --------------------------------------------------
# Security Group
# --------------------------------------------------

resource "aws_security_group" "ec2_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow HTTP traffic"
  vpc_id      = data.aws_vpc.existing.id



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "${var.project_name}-sg"
    ManagedBy = "Terraform"
  }
}

# --------------------------------------------------
# IAM Role for Systems Manager
# --------------------------------------------------

resource "aws_iam_role" "ec2_ssm_role" {
  name = "${var.project_name}-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })

  tags = {
    Name      = "${var.project_name}-ssm-role"
    ManagedBy = "Terraform"
  }
}

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-profile"
  role = aws_iam_role.ec2_ssm_role.name
}

# --------------------------------------------------
# EC2 Instance
# --------------------------------------------------

resource "aws_instance" "monitoring_ec2" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  monitoring             = true
  subnet_id              = data.aws_subnet.existing.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  user_data = file("${path.module}/user_data.sh")

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.project_name}-instance"
    Environment = "Capstone"
    ManagedBy   = "Terraform"
  }

  depends_on = [
    aws_iam_role_policy_attachment.ssm_policy
  ]
}

# --------------------------------------------------
# CloudWatch CPU Alarm
# --------------------------------------------------

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "${var.project_name}-cpu-high"
  alarm_description   = "Triggers when EC2 CPU utilization exceeds the configured threshold."
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.cpu_threshold
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.monitoring_ec2.id
  }

  tags = {
    Name      = "${var.project_name}-cpu-alarm"
    ManagedBy = "Terraform"
  }
}
