# Project 21: CloudWatch Monitoring Dashboard

## Objective
Create an AWS CloudWatch dashboard to visualize EC2 instance performance metrics.

## AWS Configuration
- AWS Service: Amazon CloudWatch
- Region: eu-west-3
- Dashboard Name: omm-project-21-dashboard
- EC2 Instance ID: i-02ec715db35d51f36
- Instance Type: t3.micro

## Dashboard Metrics
The dashboard contains six metric widgets:

1. CPU Utilization
2. Network In
3. Network Out
4. EBS Read Bytes
5. EBS Write Bytes
6. EC2 Status Check Failed

## Implementation
- Retrieved available EC2 metrics using AWS CLI.
- Created a CloudWatch dashboard configuration using JSON.
- Validated the dashboard configuration.
- Created the dashboard using the CloudWatch PutDashboard API.
- Verified successful dashboard creation.
- Confirmed that metric graphs display performance data.

## Files
- `omm-project-21-dashboard.json`: CloudWatch dashboard configuration.
- `screenshots/01-cloudwatch-dashboard.png`: Dashboard screenshot.

## Result
Successfully created and verified an AWS CloudWatch dashboard displaying EC2 performance metrics.

## Screenshot
See the `screenshots` directory.
