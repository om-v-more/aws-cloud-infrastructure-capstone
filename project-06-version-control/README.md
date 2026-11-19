# Project 06: Git and GitHub Version Control

## Objective

Track Terraform infrastructure code changes using Git and GitHub, maintain version history, push code to a remote repository, and raise Pull Requests for reviewing changes.

## Tools Used

- Git
- GitHub
- Terraform
- PowerShell

## Implementation

### 1. Repository Setup
- Initialized a Git repository for the AWS infrastructure capstone.
- Created a root `.gitignore` to exclude Terraform state files, plan files, credentials, and local configuration files.
- Organized projects into separate directories.

### 2. Initial Commit and GitHub Push
- Added Projects 1–5 to the central repository.
- Committed the project files on the `main` branch.
- Connected the local repository to GitHub.
- Pushed the code to the remote repository.

### 3. Terraform Change Tracking
- Created a feature branch named `feature/project-06-version-control`.
- Modified Project 1's `main.tf` with a documentation-only comment.
- Reviewed the change using `git diff`.
- Committed the change with Git.
- Pushed the feature branch to GitHub.

### 4. Pull Request
- Created a Pull Request from the feature branch into `main`.
- Used the PR to demonstrate code review and change-tracking workflow.

## Git Commands Practiced

```bash
git init
git add .
git status
git commit -m "Commit message"
git branch
git switch -c feature-branch
git diff
git remote add origin <repository-url>
git push -u origin main
git push -u origin feature-branch