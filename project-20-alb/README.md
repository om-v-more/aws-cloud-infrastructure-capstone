# Project 20 – Application Load Balancer with EC2

## Overview

This project demonstrates how to deploy and configure an **AWS Application Load Balancer (ALB)** to distribute incoming HTTP traffic across two EC2 instances.

The ALB receives requests from users and forwards them to registered EC2 targets using a target group. Health checks continuously monitor the availability of backend instances.

## Architecture

```text
                 Internet
                    |
                    |
          Application Load Balancer
             (HTTP - Port 80)
                    |
             Target Group
                    |
          ---------------------
          |                   |
       EC2 Instance 1      EC2 Instance 2
       10.1.1.68           10.1.1.148
       eu-west-3a          eu-west-3a
          |                   |
       Apache HTTP         Apache HTTP
          |                   |
       Healthy              Healthy
```

## AWS Resources

| Resource | Configuration |
|---|---|
| AWS Region | Europe (Paris) – eu-west-3 |
| VPC | omm-terraform-webserver-eu-west-3-vpc |
| Load Balancer | omm-project-20-alb |
| Load Balancer Type | Application Load Balancer |
| Scheme | Internet-facing |
| Listener | HTTP – Port 80 |
| Target Group | omm-project-20-tg |
| Target Protocol | HTTP |
| Target Port | 80 |
| Target Type | Instance |
| Health Check Path | / |
| Health Check Success Code | 200 |

## EC2 Backend Instances

Two existing EC2 instances were reused as ALB targets.

| Instance ID | Private IP | Availability Zone |
|---|---|---|
| i-0b2c89871918e5d16 | 10.1.1.68 | eu-west-3a |
| i-02ec715db35d51f36 | 10.1.1.148 | eu-west-3a |

Apache HTTP Server was installed and configured on the second instance to ensure that both targets could respond to HTTP health checks.

## Implementation Steps

1. Selected two existing EC2 instances in the Paris region.
2. Created a second public subnet in eu-west-3b for the ALB's multi-AZ configuration.
3. Created a security group for the ALB allowing inbound HTTP traffic on port 80.
4. Configured the EC2 security groups to allow HTTP traffic from the ALB security group.
5. Created a target group named `omm-project-20-tg`.
6. Registered both EC2 instances with the target group.
7. Created an internet-facing Application Load Balancer named `omm-project-20-alb`.
8. Configured an HTTP listener on port 80 to forward requests to the target group.
9. Configured HTTP health checks using the `/` endpoint.
10. Verified that both registered EC2 instances reached a healthy state.

## Health Check Configuration

| Setting | Value |
|---|---|
| Protocol | HTTP |
| Path | / |
| Port | Traffic port |
| Interval | 30 seconds |
| Healthy Threshold | 2 |
| Unhealthy Threshold | 2 |
| Success Codes | 200 |

## Testing and Verification

### 1. Check Load Balancer

```powershell
aws elbv2 describe-load-balancers --names omm-project-20-alb --region eu-west-3 --profile project1
```

### 2. Check Target Health

```powershell
aws elbv2 describe-target-health --target-group-arn arn:aws:elasticloadbalancing:eu-west-3:590507089733:targetgroup/omm-project-20-tg/02c29077b96dd517 --region eu-west-3 --profile project1
```

**Result:** Both EC2 instances successfully registered and reported `healthy`.

### 3. Test Load Balancing

Access the ALB DNS endpoint:

```text
http://omm-project-20-alb-1112132519.eu-west-3.elb.amazonaws.com
```

Send multiple HTTP requests:

```powershell
1..10 | ForEach-Object {
    Write-Output "Request $_"
    curl.exe -s http://omm-project-20-alb-1112132519.eu-west-3.elb.amazonaws.com
    Write-Output "`n-------------------------"
}
```

**Observed Results:**

- Backend 1 returned the existing Terraform web server page.
- Backend 2 returned the OMM Project 20 backend server page.
- Requests successfully reached both registered EC2 instances through the ALB.

## Challenges Faced

- One EC2 target initially failed health checks because Apache HTTP Server was not installed.
- Used AWS Systems Manager (SSM) to remotely inspect the instance.
- Installed Apache, enabled the service, and configured an HTML response page.
- Verified that the local endpoint returned HTTP 200.
- Rechecked the target group and confirmed both instances were healthy.

## Key Learnings

- Creating and configuring an Application Load Balancer.
- Configuring listeners and target groups.
- Registering EC2 instances as ALB targets.
- Configuring security groups for controlled backend access.
- Understanding ALB health checks and target health states.
- Using AWS Systems Manager for remote EC2 administration.
- Testing HTTP traffic distribution through an ALB.

## Project Outcome

Successfully deployed an internet-facing Application Load Balancer in the Paris AWS region, configured HTTP traffic forwarding, and verified that both EC2 backend instances were healthy and receiving requests.

**Project Status: Completed**

## Screenshots

Add the following screenshots to this section:

1. ALB details showing active state and DNS name.
2. Target group showing both healthy EC2 instances.
3. PowerShell output demonstrating responses from both backend servers.
