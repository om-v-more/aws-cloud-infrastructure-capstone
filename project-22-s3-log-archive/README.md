# Project 22: S3 Log Archive with Lifecycle

## Objective
Store application logs in Amazon S3 and reduce storage costs through automatic object expiration.

## AWS Configuration
- Service: Amazon S3
- Region: eu-west-3
- Bucket: omm-project-22-log-archive-590507089733-eu-west-3
- AWS CLI Profile: project1

## Implementation
1. Created a dedicated S3 bucket.
2. Generated a sample application log.
3. Uploaded the log to the `logs/` prefix.
4. Created and validated an S3 lifecycle configuration.
5. Applied an enabled lifecycle expiration rule.
6. Verified the lifecycle configuration using AWS CLI.

## Lifecycle Rule
- Rule ID: omm-project-22-log-expiration
- Status: Enabled
- Prefix: logs/
- Expiration: 30 days

Objects under the `logs/` prefix become eligible for expiration after 30 days. S3 performs the actual deletion asynchronously.

## Project Files
- `logs/application.log`: Sample application log
- `lifecycle.json`: S3 lifecycle configuration
- `screenshots/01-s3-lifecycle-rule.png`: Lifecycle rule screenshot

## Result
Successfully uploaded application logs to S3 and configured automatic 30-day expiration.
