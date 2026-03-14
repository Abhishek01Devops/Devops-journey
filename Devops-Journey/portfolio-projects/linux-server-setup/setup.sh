#!/bin/bash

echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

echo "Installing required tools..."
sudo apt install -y git curl nginx ufw

echo "Checking installed versions..."
git --version
nginx -v

echo "Starting Nginx service..."
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Configuring firewall..."
sudo ufw allow 80/tcp
sudo ufw allow 2222/tcp
sudo ufw enable

echo "Firewall status:"
sudo ufw status

echo "Testing web server..."
curl localhost

echo "System setup completed successfully."
