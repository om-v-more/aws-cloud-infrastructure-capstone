# Project 14: Kubernetes Deployment

## Objective
Deploy a containerized Nginx web application on a local K3s Kubernetes cluster.

## Architecture
- Kubernetes: K3s on WSL2 Ubuntu
- Container runtime: Docker
- Application: Nginx on Alpine Linux
- Container registry: AWS ECR
- Namespace: omm-project-14
- Deployment: omm-webapp
- Replicas: 2
- Service: omm-webapp-service
- Service type: NodePort
- NodePort: 30080
- Reverse proxy: Nginx on localhost:80

## Docker Image
590507089733.dkr.ecr.eu-west-3.amazonaws.com/omm-project-13-webapp:2.0

## Deployment Commands

Apply manifests:

```bash
sudo k3s kubectl apply -f deployment.yaml
sudo k3s kubectl apply -f service.yaml
