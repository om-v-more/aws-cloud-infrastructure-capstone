#!/bin/bash

dnf update -y
dnf install -y stress-ng

systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent
