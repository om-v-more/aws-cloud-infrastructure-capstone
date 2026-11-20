
terraform {
  required_version = ">= 1.5.0"
}

resource "terraform_data" "ci_demo" {
  input = {
    project     = "Project 12"
    environment = "CI"
    purpose     = "Terraform plan validation"
  }
}

output "project_name" {
  value = terraform_data.ci_demo.output.project
}

output "environment" {
  value = terraform_data.ci_demo.output.environment
}
