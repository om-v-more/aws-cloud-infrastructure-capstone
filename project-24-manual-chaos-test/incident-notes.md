# Project 24: Manual Chaos Test

## Objective
Simulate an application outage, restore the application, and verify recovery.

## Environment
- Platform: Kubernetes (k3s)
- Namespace: omm-project-14
- Deployment: omm-webapp
- Service: omm-webapp-service
- Service type: NodePort
- NodePort: 30080
- Original replicas: 2

## 1. Initial Health Check
- Both application pods were running and ready.
- Service had two healthy endpoints.
- HTTP request to http://localhost:30080 returned HTTP 200 OK.

## 2. Incident Simulation
- Scaled the Deployment from 2 replicas to 0.
- Verified that no application pods remained.
- HTTP request failed with connection error.
- Impact: Application became unavailable through the NodePort.

## 3. Recovery
- Scaled the Deployment back from 0 to 2 replicas.
- Kubernetes automatically created two replacement pods.
- Both replacement pods reached 1/1 Running.

## 4. Recovery Verification
- Both application pods were healthy.
- HTTP request to http://localhost:30080 returned HTTP 200 OK.
- Original replica count and application availability were restored.

## 5. Conclusion
The manual chaos test passed. The application became unavailable when all replicas were stopped and recovered successfully after restoring the Deployment to two replicas.

## Additional Observation
Before the deliberate test, the existing pods had an expired Amazon ECR authentication token, causing ImagePullBackOff errors. The ECR credentials were refreshed, and replacement pods started successfully before the chaos test began.
