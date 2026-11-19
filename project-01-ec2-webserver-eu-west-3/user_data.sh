#!/bin/bash

# Update system packages
dnf update -y

# Install Apache web server
dnf install -y httpd

# Start Apache automatically
systemctl enable httpd
systemctl start httpd

# Create website homepage
cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>AWS Terraform Web Server</title>
</head>
<body>
    <h1>Hello from AWS EC2!</h1>
    <p>Successfully deployed using Terraform.</p>
    <p>Managed through AWS Systems Manager.</p>
</body>
</html>
EOF
