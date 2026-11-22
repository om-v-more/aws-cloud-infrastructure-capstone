#!/bin/bash
set -e

AWS_EXE="/mnt/c/Program Files/Amazon/AWSCLIV2/aws.exe"
BUCKET="omm-project-19-log-backups-590507089733-eu-west-3"
SOURCE="/var/log/alternatives.log"
STAGING="/mnt/c/Users/om.v.more/AppData/Local/Temp/omm-project19-backups"

TIMESTAMP=$(date -u +"%Y%m%dT%H%M%SZ")
FILENAME="alternatives-${TIMESTAMP}.log"

mkdir -p "$STAGING"
cp "$SOURCE" "$STAGING/$FILENAME"

WINDOWS_FILE=$(wslpath -w "$STAGING/$FILENAME")

echo "Starting backup: $FILENAME"

"$AWS_EXE" s3 cp "$WINDOWS_FILE" \
"s3://$BUCKET/logs/$FILENAME" \
--region eu-west-3 \
--profile project1

echo "Backup completed successfully."
