# Project 11: Infrastructure Changes with Branching Policy

## Overview

This project demonstrates a Git branching strategy for managing infrastructure-related changes through feature branches and GitHub Pull Requests.

The objective was to practice creating a feature branch, documenting a branching policy, submitting a Pull Request, performing a self-review, and merging the changes into the main branch.

## Objectives

- Follow a structured Git branching strategy.
- Create and work on a feature branch.
- Push changes to GitHub.
- Create and review a Pull Request.
- Merge approved changes into the main branch.

## Branching Strategy

The following branch naming conventions were documented:

| Branch | Purpose |
|---|---|
| `main` | Stable branch containing reviewed changes |
| `feature/*` | New features and infrastructure changes |
| `fix/*` | Bug fixes |

## Implementation

### 1. Create Feature Branch

Created the following feature branch from `main`:

```bash
git switch -c feature/project-11-branching-policy
```

### 2. Document Branching Policy

Created `BRANCHING_POLICY.md` containing:

- Branch naming conventions.
- Feature development workflow.
- Commit and push guidelines.
- Pull Request review and merge guidelines.

### 3. Commit Changes

```bash
git add BRANCHING_POLICY.md
git commit -m "Add Git branching policy documentation"
```

### 4. Push Feature Branch

```bash
git push -u origin feature/project-11-branching-policy
```

### 5. Create Pull Request

Created [Pull Request #3](https://github.com/om-v-more/aws-cloud-infrastructure-capstone/pull/3).

- **Source:** `feature/project-11-branching-policy`
- **Target:** `main`
- **Title:** Add Git Branching Policy Documentation

### 6. Review and Merge

Performed a self-review of the changes and verified the branching conventions and workflow documentation.

The Pull Request was subsequently merged into `main`.

**Note:** This was a self-review; no independent reviewer approval was obtained.

## Verification

After merging, synchronized the local repository:

```bash
git switch main
git pull origin main
git status
git log -1 --oneline
```

Verification results:

- Pull Request #3 successfully merged.
- `BRANCHING_POLICY.md` available on `main`.
- Local branch synchronized with `origin/main`.
- Working tree clean.

**Merge commit:**

```text
f34e4f3
```

## Deliverables

The following screenshots provide evidence of the completed workflow:

| Screenshot | Description |
|---|---|
| `01-feature-branch.png` | Feature branch creation |
| `02-pull-request.png` | GitHub Pull Request |
| `03-self-review.png` | Self-review comment |
| `04-merged-pull-request.png` | Successfully merged PR |
| `05-merge-verification.png` | Local Git verification |

Store screenshots in:

```text
project-11-branching-policy/screenshots/
```

## Skills Practiced

- Git branching and version control.
- Feature branch workflow.
- Git commits and remote pushes.
- GitHub Pull Requests.
- Code/documentation review.
- Merge verification.

## Project Status

**Completed** — Feature branch created, changes pushed, Pull Request reviewed through self-review, and merged into `main`.