# Project 19: Scheduled S3 Log Backup

## Objective
Automate log-file backups and upload them to an Amazon S3 bucket on a scheduled basis.

## Architecture
- Scheduler: Cron running in Ubuntu WSL
- Source log: `/var/log/alternatives.log`
- Backup script: `scripts/backup.sh`
- AWS CLI: Windows AWS CLI, invoked from WSL
- AWS credentials: Existing Windows AWS CLI profile `project1`
- S3 bucket: `omm-project-19-log-backups-590507089733-eu-west-3`
- S3 destination: `s3://omm-project-19-log-backups-590507089733-eu-west-3/logs/`
- AWS Region: `eu-west-3`

## How It Works
1. Cron executes the backup script daily.
2. The script copies the source log to a temporary Windows staging directory.
3. The Windows AWS CLI uploads the timestamped file to the S3 bucket.
4. Execution output is recorded in `/tmp/omm-project19-cron.log`.

## Schedule
- Cron expression: `0 2 * * *`
- Execution: Daily at 02:00 UTC (07:30 AM IST).

## Verification
- Manually executed the backup script successfully.
- Verified uploaded objects using `aws s3 ls`.
- Tested cron with an every-minute schedule.
- Confirmed successful scheduled uploads in the cron log and verified the resulting S3 objects.
- Changed the final schedule to daily execution.

## Scope
Cron runs in local Ubuntu WSL and uses the existing Windows AWS CLI profile to upload backups to S3. The scheduler is not hosted on an EC2 instance.

## Files
- `scripts/backup.sh` — Backup and S3 upload script.
- `README.md` — Project documentation.
