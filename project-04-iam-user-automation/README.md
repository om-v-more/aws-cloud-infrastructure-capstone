# Project 04: IAM User Automation with Terraform

## Overview

This project demonstrates AWS Identity and Access Management (IAM) user automation using Terraform.

The objective is to create an IAM user with controlled, read-only access to a specific Amazon S3 bucket. Terraform is used to define the IAM user, configure an inline policy, and manage permissions through variables.

## Technologies Used

- AWS IAM
- Amazon S3
- Terraform
- AWS CLI
- PowerShell

## Architecture

The project creates the following resources:

1. **IAM User:** `omm-s3-read-user`
2. **IAM Inline Policy:** `omm-s3-read-only-policy`
3. **Existing S3 Bucket:** `omm-s3-static-website-373ee59a`

The IAM user receives read-only permissions for the specified S3 bucket.

## IAM Permissions

The policy follows the principle of least privilege by granting only the permissions required to read data from the target bucket.

| Permission | Description |
|---|---|
| `s3:ListBucket` | List objects in the specified bucket |
| `s3:GetObject` | Read or download objects from the bucket |

The policy does not grant permissions for uploading, modifying, or deleting objects.

Examples of permissions not granted:

- `s3:PutObject`
- `s3:DeleteObject`
- `s3:CreateBucket`
- `s3:DeleteBucket`
- `s3:PutBucketPolicy`

**Resource scope:**

- Bucket ARN: `arn:aws:s3:::omm-s3-static-website-373ee59a`
- Object ARN: `arn:aws:s3:::omm-s3-static-website-373ee59a/*`

## Project Structure

```text
project-04-iam-user-automation/
│
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── .terraform.lock.hcl
├── .gitignore
├── README.md
│
└── screenshots/
    ├── terraform-outputs.png
    ├── iam-user-created.png
    ├── iam-policy-attached.png
    ├── s3-bucket-verified.png
    └── policy-simulation.png
```

## Terraform Configuration

### 1. providers.tf

Configures the AWS provider and Terraform version requirements.

### 2. variables.tf

Defines configurable variables:

- AWS region
- IAM username
- S3 bucket name
- S3 read policy actions

The policy actions are stored in a Terraform object variable, making the permissions configurable without hardcoding them in the resource definition.

### 3. main.tf

Defines:

- AWS IAM user
- IAM inline policy
- S3 bucket-level and object-level permissions

The policy is generated using Terraform's `jsonencode()` function.

### 4. outputs.tf

Displays:

- IAM username
- IAM user ARN
- S3 bucket name
- Inline policy name

## Deployment Steps

### Prerequisites

- AWS CLI installed and configured
- Terraform installed
- AWS credentials configured through the `project1` CLI profile
- Appropriate IAM permissions to create IAM users and attach inline policies

### Step 1: Initialize Terraform

```powershell
terraform init
```

### Step 2: Format Configuration

```powershell
terraform fmt
```

### Step 3: Validate Configuration

```powershell
terraform validate
```

### Step 4: Review Execution Plan

```powershell
terraform plan -out=project4.tfplan
```

### Step 5: Apply Configuration

```powershell
terraform apply "project4.tfplan"
```

### Step 6: Verify Terraform Outputs

```powershell
terraform output
```

## Verification and Testing

The following AWS CLI commands were executed to verify the deployment.

**Verify IAM user:**

```powershell
aws iam get-user --user-name omm-s3-read-user --profile project1
```

**Verify attached inline policy:**

```powershell
aws iam get-user-policy --user-name omm-s3-read-user --policy-name omm-s3-read-only-policy --profile project1
```

**Verify S3 bucket:**

```powershell
aws s3api head-bucket --bucket omm-s3-static-website-373ee59a --profile project1
```

**Simulate IAM permissions:**

```powershell
aws iam simulate-principal-policy `
  --policy-source-arn arn:aws:iam::590507089733:user/omm-s3-read-user `
  --action-names s3:ListBucket `
  --resource-arns arn:aws:s3:::omm-s3-static-website-373ee59a `
  --profile project1
```

### Verification Results

| Verification | Result |
|---|---|
| Terraform initialization | Successful |
| Terraform validation | Successful |
| IAM user creation | Successful |
| Inline policy attachment | Successful |
| Terraform outputs | Verified |
| S3 bucket existence | Verified |
| Permission simulation | Blocked by AWS Organizations SCP |

**Note:** The IAM policy was successfully created with `s3:ListBucket` and `s3:GetObject` permissions. However, the IAM policy simulator returned `AllowedByOrganizations: false` for the read actions. This indicates an organization-level restriction. Effective read access must be retested after the AWS administrator reviews the applicable Service Control Policy (SCP).

## Deployment Summary

| Resource | Value |
|---|---|
| IAM User | `omm-s3-read-user` |
| IAM Policy | `omm-s3-read-only-policy` |
| S3 Bucket | `omm-s3-static-website-373ee59a` |
| AWS Region | `eu-west-3` |
| Terraform Resources Created | 2 |

## Key Learnings

- Automating IAM user creation using Terraform.
- Managing IAM inline policies through Terraform variables.
- Applying the principle of least privilege.
- Configuring bucket-level and object-level S3 permissions.
- Using AWS CLI to inspect IAM resources.
- Simulating IAM permissions and understanding AWS Organizations SCP restrictions.

## Author

Developed as part of an AWS and Terraform infrastructure automation capstone project.