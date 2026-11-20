# Project 8: Build and Run Docker App Locally

## Objective
Build and run a web application inside a Docker container.

## Technologies
- Docker
- Nginx (Alpine)
- HTML

## Files
- `index.html` - Sample web application
- `Dockerfile` - Instructions to build the Docker image
- `screenshots/` - Project execution evidence

## Build Docker Image
```bash
docker build -t omm-project-08-webapp:1.0 .




```

## Run Container
```bash
docker run -d --name omm-project-08-container -p 8080:80 omm-project-08-webapp:1.0
```

## Verify
```bash
docker ps
curl http://localhost:8080
```

## Result
Successfully built a Docker image and deployed the sample web application in a running Nginx container.
