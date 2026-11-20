# Project 17: Log Forwarding to CloudWatch

## Objective
Configure centralized log collection on an Amazon EC2 instance using the Amazon CloudWatch Agent.

## Architecture
- **Cloud Provider:** AWS
- **Region:** eu-west-3 (Paris)
- **Compute:** Amazon EC2
- **Operating System:** Amazon Linux 2023
- **Log Agent:** Amazon CloudWatch Agent
- **Log Forwarding:** rsyslog and systemd-journald
- **Management:** AWS Systems Manager Session Manager

## Implementation

### 1. CloudWatch Agent Installation
Installed the Amazon CloudWatch Agent on the EC2 instance using the DNF package manager.

```bash
sudo dnf install -y amazon-cloudwatch-agent
```

### 2. Log Collection Configuration
Configured the CloudWatch Agent to collect system and security logs.

Configured log groups:

| Log File | CloudWatch Log Group |
|---|---|
| `/var/log/messages` | `/omm/project17/system` |
| `/var/log/secure` | `/omm/project17/security` |

Log streams were configured using the EC2 instance ID.

### 3. rsyslog Configuration
Amazon Linux 2023 uses systemd-journald for system logging. Installed and enabled rsyslog to forward system messages into `/var/log/messages`.

```bash
sudo dnf install -y rsyslog
sudo systemctl enable --now rsyslog
```

Validated the configuration and tested log generation using:

```bash
sudo logger -t OMM_PROJECT17 -p user.notice "CloudWatch forwarding test"
```

Verified that the generated message appeared in `/var/log/messages`.

### 4. CloudWatch Agent Service
Started and verified the CloudWatch Agent service.

```bash
sudo systemctl status amazon-cloudwatch-agent
```

The service was successfully installed and running, with the configured log collection pipelines initialized.

## IAM Permissions Limitation

The EC2 instance uses the IAM role:

`omm-ec2-cloudwatch-ssm-role`

The role currently has the `AmazonSSMManagedInstanceCore` policy attached but does not have the required CloudWatch Logs permissions.

The agent encountered `AccessDeniedException` errors when attempting to upload log events using `logs:PutLogEvents`.

CloudWatch log delivery therefore remains incomplete.

To finish the implementation, an AWS administrator must grant the EC2 role the required CloudWatch Logs permissions, preferably scoped to the `/omm/project17/*` log groups in `eu-west-3`.

## Screenshots

The `screenshots/` directory contains:

1. `01-agent-running.png` – CloudWatch Agent service status.
2. `02-rsyslog-running.png` – rsyslog service status.
3. `03-test-log.png` – Successful local log generation and verification.
4. `04-agent-configuration.png` – CloudWatch Agent configuration.
5. `05-cloudwatch-access-denied.png` – IAM permission error during log delivery.

## Project Status

**Partially implemented**

- [x] Install Amazon CloudWatch Agent.
- [x] Configure system and security log collection.
- [x] Configure rsyslog on Amazon Linux 2023.
- [x] Verify local log generation.
- [x] Start and verify the CloudWatch Agent.
- [ ] Successfully forward logs to CloudWatch.
- [ ] Create a CloudWatch dashboard.

## Key Learnings

- Installing and configuring the Amazon CloudWatch Agent.
- Understanding log collection on Amazon Linux 2023.
- Working with systemd-journald and rsyslog.
- Managing EC2 instances through AWS Systems Manager.
- Understanding IAM instance roles and CloudWatch Logs permissions.
- Troubleshooting `AccessDeniedException` errors during log delivery.
