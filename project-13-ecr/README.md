# Project 13: Build Docker Image and Push to Amazon ECR

## Objective
Build a Docker image for the web application developed in Project 8 and publish it to Amazon Elastic Container Registry (ECR), a private Docker image registry.

## Tools and Technologies
- Docker
- Amazon Elastic Container Registry (ECR)
- AWS CLI
- Ubuntu 24.04
- PowerShell
- AWS IAM

## AWS Configuration

| Configuration | Value |
|---|---|
| AWS Account ID | `590507089733` |
| AWS Region | `eu-west-3` (Paris) |
| ECR Repository | `omm-project-13-webapp` |
| Image Tag | `1.0` |
| Registry Type | Private |
| Encryption | AES256 |

## Implementation

### 1. Create ECR Repository

Created a private ECR repository using AWS CLI:

```bash
aws ecr create-repository \
  --repository-name omm-project-13-webapp \
  --region eu-west-3
```

### 2. Authenticate Docker with ECR

Authenticated Docker using the AWS ECR login token:

```bash
docker login --username AWS \
  590507089733.dkr.ecr.eu-west-3.amazonaws.com
```

Authentication completed successfully.

### 3. Build Docker Image

Reused the Dockerfile and web application from Project 8.

```bash
docker build -t omm-project-13-webapp:1.0 .
```

### 4. Tag Docker Image

Tagged the local image with the ECR repository URI:

```bash
docker tag omm-project-13-webapp:1.0 \
  590507089733.dkr.ecr.eu-west-3.amazonaws.com/omm-project-13-webapp:1.0
```

### 5. Push Image to ECR

Uploaded the Docker image to the private ECR repository:

```bash
docker push \
  590507089733.dkr.ecr.eu-west-3.amazonaws.com/omm-project-13-webapp:1.0
```

### 6. Verify Image Upload

Verified the uploaded image using AWS CLI:

```bash
aws ecr describe-images \
  --repository-name omm-project-13-webapp \
  --region eu-west-3
```

## Verification Results

| Property | Result |
|---|---|
| Repository created | Successful |
| Docker authentication | Successful |
| Docker image build | Successful |
| Image tagging | Successful |
| Image pushed to ECR | Successful |
| Image status | ACTIVE |
| Image tag | `1.0` |
| Image size | Approximately 26.3 MB |

**Image URI:**

```text
590507089733.dkr.ecr.eu-west-3.amazonaws.com/omm-project-13-webapp:1.0
```

**Image digest:**

```text
sha256:2eeff8546e4a083a57cdb71a553833e399b9502a60d2a6fd30bc73d16ce31da6
```

## Evidence

Screenshot evidence is stored in the `screenshots/` directory.

- `01-ecr-image-pushed.png` – AWS CLI verification showing the ECR repository, image tag, digest, image status, and upload timestamp.

Note: AWS Management Console access was restricted for the configured IAM identity. Image publication and verification were therefore performed successfully using AWS CLI.

## Outcome

Successfully built a Docker image from the Project 8 application, tagged it, and pushed it to a private Amazon ECR repository.

The image is available for use in subsequent container deployment projects.
