# Project 14: Kubernetes Deployment

## Objective

Deploy a containerized Nginx web application on a local K3s Kubernetes cluster, manage application replicas, and expose the application through a NodePort service.

## Architecture

| Component | Configuration |
|---|---|
| Kubernetes | K3s on WSL2 Ubuntu |
| Container Runtime | Docker |
| Application | Nginx on Alpine Linux |
| Container Registry | AWS ECR |
| AWS Region | eu-west-3 |
| Namespace | `omm-project-14` |
| Deployment | `omm-webapp` |
| Replicas | 2 |
| Service | `omm-webapp-service` |
| Service Type | NodePort |
| NodePort | `30080` |
| Reverse Proxy | Nginx on `localhost:80` |

## Architecture Flow

```text
                 AWS ECR
                    |
                    | Pull Container Image
                    |
              Local K3s Cluster
                    |
             Namespace: omm-project-14
                    |
              Deployment
               omm-webapp
                    |
             +------+------+
             |             |
          Pod 1          Pod 2
          Nginx          Nginx
             |             |
             +------+------+
                    |
              NodePort Service
                 Port 30080
                    |
             Nginx Reverse Proxy
               localhost:80
                    |
              Web Application
```

## Docker Image

The application image was built and pushed to AWS ECR.

**Image:**

```text
590507089733.dkr.ecr.eu-west-3.amazonaws.com/omm-project-13-webapp:2.0
```

## Project Structure

```text
project-14-kubernetes-deployment/
│
├── app/
│   ├── Dockerfile
│   └── index.html
│
├── deployment.yaml
├── service.yaml
├── README.md
│
└── screenshots/
    ├── 01-kubernetes-resources.png
    ├── 02-kubernetes-deployment-details.png
    ├── 03-project-14-webapp.png
    ├── 04-kubernetes-nodeport-service.png
    └── 05-ecr-project-14-image.png
```

## Deployment Steps

### 1. Apply Kubernetes Deployment

```bash
sudo k3s kubectl apply -f deployment.yaml
```

### 2. Create Kubernetes Service

```bash
sudo k3s kubectl apply -f service.yaml
```

### 3. Verify Deployment

```bash
sudo k3s kubectl get deployments -n omm-project-14
```

### 4. Check Running Pods

```bash
sudo k3s kubectl get pods -n omm-project-14 -o wide
```

### 5. Check Kubernetes Service

```bash
sudo k3s kubectl get services -n omm-project-14
```

### 6. Verify All Kubernetes Resources

```bash
sudo k3s kubectl get all -n omm-project-14
```

## Application Access

The application is accessible locally through the NodePort service:

```text
http://localhost:30080
```

It is also accessible through the local Nginx reverse proxy:

```text
http://localhost
```

The application displays:

- Hello from Kubernetes!
- Project 14: Deploy a Containerized Application using Kubernetes.
- Running on K3s with two application replicas.

## Nginx Reverse Proxy

A local Nginx reverse proxy forwards requests from port 80 to the Kubernetes NodePort service on port 30080.

```nginx
server {
    listen 80;
    listen [::]:80;
    server_name localhost;

    location / {
        proxy_pass http://127.0.0.1:30080;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

## Screenshots

The `screenshots/` directory contains evidence of:

1. Kubernetes resources and running pods.
2. Deployment configuration and replica details.
3. Running Project 14 web application.
4. NodePort service configuration.
5. Docker image stored in AWS ECR.

## Limitations and Notes

- The Kubernetes cluster runs locally using K3s on WSL2 Ubuntu.
- AWS ECR is used as the container image registry.
- The application is accessible locally through NodePort and the Nginx reverse proxy.
- AWS EKS provisioning was not completed because the AWS account's organization-level permissions restrict the required EKS and related infrastructure operations.
- Public internet access was not established.

This implementation demonstrates containerized application deployment, Kubernetes namespaces, deployments, replicas, services, container registry integration, and reverse proxy configuration.

## Technologies Used

- AWS ECR
- Docker
- Kubernetes
- K3s
- Nginx
- Linux / Ubuntu
- YAML
