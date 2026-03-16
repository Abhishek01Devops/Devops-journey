#!/bin/bash

# SSH Key Authentication Setup Script
# Author: Abhishek
# Description: Configures SSH key authentication and disables password login

echo "Creating .ssh directory..."
mkdir -p ~/.ssh

echo "Setting correct permissions..."
chmod 700 ~/.ssh

echo "Setting permissions for authorized_keys..."
chmod 600 ~/.ssh/authorized_keys

echo "Backing up sshd_config..."
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

echo "Disabling password authentication..."
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

echo "Restarting SSH service..."
sudo systemctl restart ssh

echo "SSH key authentication setup completed."
