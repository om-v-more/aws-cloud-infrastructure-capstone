# Project 12: Infrastructure CI Trigger (Terraform Plan)

## Objective
Automate Terraform configuration checks and execution-plan generation using GitHub Actions.

## Tools Used
- Terraform
- GitHub Actions
- Git and GitHub

## Workflow
Workflow file: `.github/workflows/terraform-plan-ci.yml`

The pipeline runs on:
- Push to `main`
- Pull requests targeting `main`
- Manual workflow dispatch

## Pipeline Steps
1. Checkout repository.
2. Set up Terraform.
3. Check Terraform formatting.
4. Initialize Terraform with the local backend.
5. Validate Terraform configuration.
6. Generate an execution plan.
7. Generate a readable plan summary.
8. Upload the binary plan as `terraform-plans`.
9. Upload the readable summary as `plan-summaries`.

## Terraform Configuration
A standalone Terraform configuration uses the built-in `terraform_data` resource.

This allows plan generation without AWS credentials or changes to actual AWS infrastructure.

## Execution Results
- Terraform formatting: Passed
- Terraform initialization: Passed
- Terraform validation: Passed
- Terraform plan generation: Passed
- Plan artifacts: Uploaded successfully

### Terraform Plan Summary

| Action | Count |
|---|---:|
| Resources to add | 1 |
| Resources to change | 0 |
| Resources to destroy | 0 |

## GitHub Actions
- Workflow: Terraform Plan CI
- Run ID: `44740983982`
- Result: Successful
- Artifacts: `terraform-plans`, `plan-summaries`

## Important Note
This project generates an offline Terraform plan using local state. It does not refresh AWS infrastructure or verify live AWS resource changes.

## Skills Demonstrated
- Terraform automation
- Infrastructure CI pipelines
- GitHub Actions
- Terraform plan generation
- Artifact management
- Infrastructure validation

## Status
Completed successfully.