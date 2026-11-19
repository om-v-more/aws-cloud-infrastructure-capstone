# Project 03: EC2 State Monitoring with CloudWatch Alarm

## Overview
This project deploys an Amazon EC2 instance using Terraform and monitors its CPU utilization through Amazon CloudWatch.

A CloudWatch alarm is configured to trigger when average CPU utilization exceeds 70% for two consecutive one-minute evaluation periods.

## AWS Services Used
- Amazon EC2
- Amazon CloudWatch
- AWS IAM
- AWS Systems Manager (SSM)
- Terraform

## Architecture
- EC2 instance: t3.micro
- Operating System: Amazon Linux 2023
- AWS Region: eu-west-3 (Paris)
- Monitoring: Detailed monitoring enabled
- CPU Threshold: 70%
- Alarm Period: 60 seconds
- Evaluation Periods: 2
- Instance access: AWS Systems Manager Session Manager

The project reuses an existing VPC and subnet from Project 01.

## Project Structure
- `main.tf` – AWS resources and CloudWatch alarm
- `providers.tf` – Terraform and AWS provider configuration
- `variables.tf` – Input variables
- `outputs.tf` – Deployment outputs
- `user_data.sh` – EC2 initialization script
- `.terraform.lock.hcl` – Provider dependency lock file

## Deployment

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Review the deployment plan:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

## CPU Load Testing

Connected to the EC2 instance using AWS Systems Manager and generated CPU load with `stress-ng`:

```bash
cd /tmp
stress-ng --cpu 2 --cpu-load 100 --timeout 300s --metrics-brief
```

## Test Results

Successfully generated high CPU utilization and triggered the CloudWatch alarm.

| Parameter | Result |
|---|---|
| CPU Threshold | 70% |
| Alarm Period | 60 seconds |
| Evaluation Periods | 2 |
| First High CPU Datapoint | 78.96% |
| Second High CPU Datapoint | 100% |
| Alarm State | ALARM |

## Evidence

The `screenshots` folder contains the CloudWatch alarm screenshot showing the successful CPU threshold breach.

## Cleanup

When the project is no longer required, review the Terraform resources and use:

```bash
terraform destroy
```

Only run this command after confirming that the resources managed by this project can be deleted.

## Author
AWS Terraform Capstone Project