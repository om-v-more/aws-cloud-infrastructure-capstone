# Project 18: GitOps Infrastructure Deployment

## Objective
Automate Terraform infrastructure deployment through GitHub Actions, with deployment approval controls.

## Architecture
1. Changes are pushed to the main branch after a Pull Request is merged.
2. GitHub Actions triggers the GitOps deployment workflow.
3. Terraform initializes, checks formatting, and validates the configuration.
4. The deployment waits for approval through the GitHub production environment.
5. After approval, Terraform Apply executes automatically.

## Technologies
- AWS (capstone environment)
- Terraform
- GitHub Actions
- GitHub Environments
- YAML

## Workflow
File: `.github/workflows/gitops-terraform-apply.yml`

## Terraform Configuration
The demonstration uses the `terraform_data` resource to represent a Terraform-managed change.

It exposes:
- project_name: Project 12
- environment: CI

No AWS infrastructure resources are created by this demonstration.

## Approval
The GitHub `production` environment is configured with a required reviewer.

## Validation
- Terraform initialization
- Terraform format check
- Terraform validation
- Manual deployment approval
- Terraform Apply

## Deliverables
- GitHub Actions workflow
- Production approval configuration
- Successful workflow execution screenshot

## Screenshot
See the `screenshots` directory.

## Result
Successfully demonstrated an approval-gated GitOps deployment using GitHub Actions and Terraform.
