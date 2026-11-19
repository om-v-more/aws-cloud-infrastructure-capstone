@'
# AWS EC2 Web Server Deployment using Terraform

## Project Overview

This project provisions a publicly accessible Linux web server on AWS using Terraform.

The infrastructure is deployed in the **Europe (Paris) region (`eu-west-3`)**. Terraform provisions the networking components, security group, IAM role, and Amazon EC2 instance. A user-data script installs and configures Apache automatically.

## Architecture

- **Cloud Provider:** AWS
- **Infrastructure as Code:** Terraform
- **Region:** eu-west-3 (Paris)
- **Operating System:** Amazon Linux 2023
- **Instance Type:** t3.micro
- **Web Server:** Apache HTTP Server
- **Administration:** AWS Systems Manager Session Manager

## AWS Resources Created

| Resource | Configuration |
|---|---|
| VPC | 10.1.0.0/16 |
| Public Subnet | 10.1.1.0/24 |
| Internet Gateway | Attached to the VPC |
| Route Table | Default route to Internet Gateway |
| Security Group | HTTP port 80 inbound |
| EC2 Instance | Amazon Linux 2023, t3.micro |
| IAM Role | AmazonSSMManagedInstanceCore |
| Instance Profile | Attached to EC2 |

## Security Configuration

- HTTP traffic is allowed on TCP port 80 from the internet.
- Outbound traffic is allowed for package installation and Systems Manager connectivity.
- No inbound SSH access is configured.
- EC2 administration uses AWS Systems Manager Session Manager.
- Terraform state files and plan files are excluded from Git.

## Project Structure

```text
project-01-ec2-webserver-eu-west-3/
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── user_data.sh
├── .terraform.lock.hcl
├── .gitignore
└── README.md