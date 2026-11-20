# Project 16: Enable HTTPS Using SSL/TLS

## Objective
Secure web access using HTTPS and block unencrypted HTTP traffic.

## Architecture
- Docker: Container runtime
- Nginx: Web server and TLS termination
- OpenSSL: Self-signed certificate generation
- HTTPS: Host port 8443 mapped to container port 443
- HTTP: Host port 8081 mapped to container port 80

## Implementation
1. Generated a self-signed RSA 2048-bit certificate using OpenSSL.
2. Configured Nginx to serve HTTPS on port 443.
3. Configured HTTP on port 80 to return HTTP 403 Forbidden.
4. Deployed Nginx in Docker.

## Verification

HTTPS:
```bash
curl -k -I https://localhost:8443
