# Project 02: Host a Static Website on Amazon S3 using Terraform

## Overview
This project demonstrates how to host a static website on Amazon S3 using Infrastructure as Code (Terraform).

Terraform provisions the S3 bucket, configures static website hosting, applies the required bucket policy, and uploads the website's HTML file.

## AWS Services and Tools
- Amazon S3
- Terraform
- AWS CLI

## Configuration
- AWS Region: `eu-west-3` (Paris)
- S3 Bucket: `omm-s3-static-website-373ee59a`
- Website File: `index.html`
- Hosting: Amazon S3 Static Website Hosting
- Access: Public read access through an S3 bucket policy

## Website URL
http://omm-s3-static-website-373ee59a.s3-website.eu-west-3.amazonaws.com

## Project Structure
- `main.tf` – S3 bucket, website configuration, public access settings, bucket policy and object upload
- `providers.tf` – Terraform and AWS provider configuration
- `variables.tf` – Input variables
- `outputs.tf` – Website endpoint and bucket outputs
- `index.html` – Static website content
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

Generate the execution plan:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

## Website Verification
The website was successfully deployed and accessed through its Amazon S3 website endpoint.

The bucket policy grants public read access to website objects. Public ACLs remain blocked.

## Screenshot
Add the captured website screenshot to a `screenshots` folder in this project.

## Cleanup
When the project is no longer required, review the resources and use:

```bash
terraform destroy
```

Only run this after confirming the resources can be deleted.

## Author
AWS Terraform Capstone Project