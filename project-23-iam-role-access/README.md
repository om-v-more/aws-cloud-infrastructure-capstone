# Project 23: IAM Role-Based Access to Amazon S3

## Objective
Securely allow an Amazon EC2 instance to access a specific Amazon S3 bucket using an IAM role, without storing AWS access keys on the instance.

## Architecture

1. An EC2 instance runs Amazon Linux 2023.
2. An IAM role is created with EC2 as its trusted service.
3. An instance profile attaches the IAM role to the EC2 instance.
4. The role has a custom IAM policy granting limited access to one S3 bucket.
5. The EC2 instance uses temporary credentials provided through the instance role to perform S3 operations.

## AWS Resources

| Resource | Name |
|---|---|
| Region | eu-west-3 |
| S3 bucket | `omm-project-23-iam-access-590507089733-eu-west-3` |
| IAM policy | `omm-project-23-s3-access-policy` |
| IAM role | `omm-project-23-ec2-s3-role` |
| Instance profile | `omm-project-23-ec2-instance-profile` |
| EC2 instance | Amazon Linux 2023 |

## IAM Permissions

The custom policy grants:

- `s3:ListBucket` on the project bucket.
- `s3:PutObject` on objects in the bucket.
- `s3:GetObject` on objects in the bucket.
- `s3:DeleteObject` on objects in the bucket.

Access is restricted to the project bucket and its objects.

## Implementation Steps

1. Created a dedicated S3 bucket with S3 Block Public Access enabled.
2. Created a custom IAM policy with bucket-specific permissions.
3. Created an IAM role with EC2 as its trusted service.
4. Attached the custom policy to the IAM role.
5. Created an instance profile and associated the IAM role with it.
6. Created the VPC, public subnet, internet gateway, route table, and security group.
7. Launched an Amazon Linux 2023 EC2 instance with the instance profile.
8. Connected to the EC2 instance using SSH.
9. Verified the assumed IAM role and tested S3 operations using the AWS CLI.

## CLI Verification

Run these commands from the EC2 instance:

```bash
aws sts get-caller-identity

echo "Project 23 IAM Role Test" > iam-test.txt

aws s3 cp iam-test.txt s3://omm-project-23-iam-access-590507089733-eu-west-3/test/iam-test.txt --region eu-west-3

aws s3 ls s3://omm-project-23-iam-access-590507089733-eu-west-3/test/ --region eu-west-3

aws s3 cp s3://omm-project-23-iam-access-590507089733-eu-west-3/test/iam-test.txt downloaded.txt --region eu-west-3

cat downloaded.txt

aws s3 rm s3://omm-project-23-iam-access-590507089733-eu-west-3/test/iam-test.txt --region eu-west-3