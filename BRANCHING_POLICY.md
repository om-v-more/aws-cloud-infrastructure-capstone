# Git Branching Policy

## Branch Strategy

- `main`: Stable branch containing reviewed and approved changes.
- `feature/*`: Used for new features and infrastructure changes.
- `fix/*`: Used for bug fixes.

## Workflow

1. Create a feature branch from `main`.
2. Make and test the required changes.
3. Commit changes with a descriptive message.
4. Push the feature branch to GitHub.
5. Open a Pull Request targeting `main`.
6. Review the changes before merging.
7. Delete the feature branch after merging.

## Pull Request Guidelines

- Every feature must be merged through a Pull Request.
- PRs must have a meaningful title and description.
- Changes must be reviewed before merging.
- Direct commits to `main` should be avoided.