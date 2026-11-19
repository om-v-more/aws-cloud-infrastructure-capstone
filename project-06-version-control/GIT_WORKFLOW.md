# Git Workflow Proof

## Repository
https://github.com/om-v-more/aws-cloud-infrastructure-capstone

## Workflow Completed

1. Initialized the Git repository.
2. Added and committed AWS capstone project files.
3. Connected the local repository to GitHub.
4. Pushed the main branch to GitHub.
5. Created a feature branch: `feature/project-06-version-control`.
6. Made and committed a Terraform configuration change.
7. Pushed the feature branch to GitHub.
8. Created Pull Request #1 targeting `main`.

## Git Commands Demonstrated

```powershell
git init
git status
git add .
git commit -m "Add AWS infrastructure capstone projects"
git remote -v
git push -u origin main
git switch -c feature/project-06-version-control
git diff
git commit -m "Demonstrate Terraform change tracking"
git push -u origin feature/project-06-version-control