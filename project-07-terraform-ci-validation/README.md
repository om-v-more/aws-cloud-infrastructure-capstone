[![Terraform CI Validation](https://github.com/om-v-more/aws-cloud-infrastructure-capstone/actions/workflows/terraform-validation.yml/badge.svg)](https://github.com/om-v-more/aws-cloud-infrastructure-capstone/actions/workflows/terraform-validation.yml)

# Project 7: CI Validation for Terraform

## Overview
This project implements Continuous Integration (CI) for Terraform configurations using GitHub Actions.

The pipeline automatically checks Terraform formatting and validates configurations whenever code is pushed or a pull request is opened against the main branch.

## Objectives
- Automate Terraform formatting checks.
- Initialize Terraform without accessing a remote backend.
- Validate Terraform configurations.
- Run checks independently for each Terraform project.
- Display CI pipeline status through a GitHub Actions badge.

## Tools Used
- Terraform
- Git and GitHub
- GitHub Actions
- HashiCorp Terraform Setup Action

## Projects Covered
1. Project 1: EC2 Web Server
2. Project 2: S3 Static Website
3. Project 3: CloudWatch Monitoring
4. Project 4: IAM User Automation

## Pipeline Workflow
1. Checkout repository.
2. Set up Terraform.
3. Run `terraform fmt -check -recursive`.
4. Run `terraform init -backend=false -input=false`.
5. Run `terraform validate -no-color`.

## Security
- No AWS credentials are required.
- No Terraform apply or destroy commands are executed.
- No AWS infrastructure is modified by this pipeline.
- GitHub Actions has read-only repository content permissions.

## Validation Results
All four Terraform project configurations passed local formatting and validation checks.

## Evidence
Pipeline execution screenshots are stored in the `screenshots/` directory.

## Outcome
Successfully implemented automated Terraform CI validation using GitHub Actions.
