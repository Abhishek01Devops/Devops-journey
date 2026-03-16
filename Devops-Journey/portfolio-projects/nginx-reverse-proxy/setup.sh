#!/bin/bash

# NGINX Reverse Proxy Setup Script
# Author: Abhishek

echo "Updating system..."
sudo apt update

echo "Installing NGINX..."
sudo apt install nginx -y

echo "Starting NGINX..."
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Checking NGINX version..."
nginx -v

echo "Setup complete!"
