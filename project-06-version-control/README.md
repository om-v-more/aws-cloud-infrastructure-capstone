# Project 6: Git-Based Terraform Version Control

## Overview

This project demonstrates how Git and GitHub can be used to manage Terraform infrastructure code, track configuration changes, and collaborate through feature branches and Pull Requests.

## Objectives

- Manage infrastructure code using Git.
- Track Terraform configuration changes through commits.
- Use feature branches to isolate changes.
- Push changes to GitHub.
- Create Pull Requests for code review.
- Maintain a clean and organized repository.

## Tools Used

- Git
- GitHub
- Terraform
- AWS CLI
- Visual Studio Code
- PowerShell

## Repository Structure

The main repository contains six projects:

1. EC2 Web Server
2. S3 Static Website
3. CloudWatch Monitoring
4. IAM User Automation
5. Secure Linux Permissions
6. Git-Based Terraform Version Control

## Workflow Demonstrated

1. Initialize and configure a Git repository.
2. Add project files and commit them.
3. Push the main branch to GitHub.
4. Create a separate feature branch.
5. Make and commit a Terraform configuration change.
6. Push the feature branch.
7. Create a Pull Request targeting main.
8. Review changes before merging.

## Terraform Validation

Terraform commands used during the project:

```powershell
terraform fmt
terraform validate
terraform plan