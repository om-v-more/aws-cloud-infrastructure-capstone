# Project 05: Secure Linux Server Permissions

## Overview

This project demonstrates Linux user and group management, file ownership, and access control on an Amazon Linux 2023 EC2 instance.

The objective was to implement user-based access restrictions so that users can access only the files assigned to their respective groups.

The existing AWS EC2 instance was accessed securely using AWS Systems Manager (SSM).

## Technologies Used

- Amazon Linux 2023
- AWS EC2
- AWS Systems Manager (SSM)
- Linux user and group management
- Linux file permissions

## Implementation

### 1. Linux Groups Created

| Group | Purpose |
|---|---|
| `omm-developers` | Development file access |
| `omm-testers` | Testing file access |

### 2. Linux Users Created

| User | Assigned Group |
|---|---|
| `omm-dev` | `omm-developers` |
| `omm-test` | `omm-testers` |

Both users were assigned separate home directories and Bash shells.

### 3. Directories and Files

The following directories and sample files were created:

```text
/opt/omm-project/
├── development/
│   └── dev.txt
└── testing/
    └── test.txt
```

### 4. Ownership and Permissions

Directory ownership and permissions:

| Directory | Owner | Group | Permission |
|---|---|---|---|
| development | root | omm-developers | 2770 |
| testing | root | omm-testers | 2770 |

File ownership and permissions:

| File | Owner | Group | Permission |
|---|---|---|---|
| dev.txt | root | omm-developers | 640 |
| test.txt | root | omm-testers | 640 |

The setgid bit was enabled on both directories to ensure newly created files inherit the directory's group.

## Access Testing

The following tests were performed using `sudo -u` to execute commands as individual Linux users.

| Test | Expected Result | Actual Result |
|---|---|---|
| Developer reads development file | Allowed | Passed |
| Developer reads testing file | Denied | Passed |
| Tester reads testing file | Allowed | Passed |
| Tester reads development file | Denied | Passed |

Denied operations returned `Permission denied`, confirming that unauthorized users cannot access restricted files.

## Key Learnings

- Creating and managing Linux users and groups.
- Assigning users to supplementary groups.
- Managing file ownership using `chown`.
- Configuring directory and file permissions using `chmod`.
- Understanding Linux permission bits and the setgid bit.
- Testing allowed and denied access.
- Securely accessing EC2 instances through AWS Systems Manager.

## Result

Successfully implemented and verified user-based access restrictions on an Amazon Linux 2023 server.

Both users can access their assigned team's files while being denied access to the other team's files.

## Author

Developed as part of an AWS and Linux infrastructure security capstone project.