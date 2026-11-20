# Project 15: Automate Server Configuration with Ansible

## Objective
Automate remote Linux server configuration using Ansible. Configure a managed Linux node, install the Nginx web server using an Ansible playbook, and verify successful deployment.

## Architecture

- **Controller:** Ubuntu 24.04 on WSL2
- **Configuration Management:** Ansible Core 2.16.3
- **Managed Node:** Debian 12 Docker container
- **Remote Connection:** SSH with ED25519 key authentication
- **Web Server:** Nginx 1.22.1
- **SSH Port:** 2222
- **HTTP Port:** 8080

### Architecture Flow

```text
Ubuntu WSL2
(Ansible Controller)
       |
       | Ansible over SSH
       | localhost:2222
       |
       v
Docker Container
(omm-project-15-node)
       |
       | Ansible Playbook
       v
Nginx Web Server
       |
       | HTTP :80
       v
Host Port 8080
http://localhost:8080
```

## Project Structure

```text
project-15-ansible/
├── inventory/
│   └── hosts.ini
├── playbooks/
│   └── install_webserver.yml
├── screenshots/
└── README.md
```

## Implementation

### 1. Ansible Controller Setup

Installed Ansible on Ubuntu WSL2.

```bash
sudo apt update
sudo apt install ansible -y
ansible --version
```

### 2. Managed Node Setup

Created a Debian 12 Docker container with SSH and HTTP port mappings.

```bash
docker run -d \
  --name omm-project-15-node \
  --hostname omm-managed-node \
  --privileged \
  --cgroupns=host \
  -p 2222:22 \
  -p 8080:80 \
  --restart unless-stopped \
  debian:12 \
  sleep infinity
```

Installed OpenSSH Server and Python 3 inside the container.

Created a dedicated `ansible` user and configured SSH public-key authentication.

### 3. Ansible Inventory

The `inventory/hosts.ini` file defines the managed node:

```ini
[managed]
omm-managed-node ansible_host=127.0.0.1 ansible_port=2222 ansible_user=ansible ansible_ssh_private_key_file=~/.ssh/omm-project-15-docker ansible_python_interpreter=/usr/bin/python3
```

### 4. Ansible Playbook

The `playbooks/install_webserver.yml` playbook performs the following tasks:

- Updates the Debian package cache.
- Installs Nginx.
- Starts the Nginx web server.

The playbook uses Ansible's built-in `apt` module for package management.

### 5. Execute the Playbook

```bash
ansible-playbook -i inventory/hosts.ini playbooks/install_webserver.yml
```

### 6. Verify Deployment

Test Ansible connectivity:

```bash
ansible managed -i inventory/hosts.ini -m ping
```

Check Nginx processes:

```bash
docker exec omm-project-15-node pgrep -a nginx
```

Verify HTTP access:

```bash
curl -I http://localhost:8080
```

Expected response:

```text
HTTP/1.1 200 OK
Server: nginx/1.22.1
```

Open the web server:

```text
http://localhost:8080
```

## Idempotency Verification

Executed the same Ansible playbook a second time.

The second execution reported:

```text
changed=0
unreachable=0
failed=0
```

This demonstrates that Ansible does not make unnecessary changes when the desired configuration is already present.

## Screenshots

Store project evidence in the `screenshots/` directory.

1. `01-ansible-connectivity.png` – Successful Ansible ping.
2. `02-ansible-playbook-execution.png` – Nginx installation and startup.
3. `03-nginx-webpage.png` – Nginx welcome page in browser.
4. `04-ansible-idempotency.png` – Second playbook execution.
5. `05-managed-node-verification.png` – Docker node, Nginx processes, HTTP response and inventory.

## Outcome

Successfully configured a Debian Linux managed node remotely using Ansible over SSH. Automated Nginx installation and startup through a playbook, verified HTTP availability, and demonstrated idempotent execution.

## Scope and Limitations

- The Ansible controller runs on Ubuntu WSL2.
- The managed node is a Docker container running locally, not an AWS EC2 instance.
- AWS EC2 remote configuration was not completed because AWS Organizations policies denied the required SSH access and EC2 Instance Connect permissions.
- This project demonstrates actual SSH-based Ansible remote configuration, but not configuration of a production or cloud-hosted server.

