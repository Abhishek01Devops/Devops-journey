# Linux Server Setup

An automated Linux server provisioning project using a Bash script to configure a fresh Ubuntu server to a production-ready baseline — installing essential tools, configuring Nginx, and hardening the firewall.

## What This Project Does

Manually setting up a server is error-prone and slow. This project automates the entire baseline setup with a single script, ensuring every server is configured consistently and correctly from day one.

```
Fresh Ubuntu Server
        │
        ▼
  ./setup.sh
        │
        ├── System packages updated
        ├── Nginx installed & enabled
        ├── Git and curl installed
        ├── UFW firewall configured
        └── Server health verified
```

## Why This Matters in DevOps

- Automation eliminates human error in server setup
- Repeatable script means every server is identical
- Foundation for Infrastructure as Code (Ansible, Terraform)
- UFW firewall configuration is a baseline security requirement

---

## Technologies Used

| Tool | Purpose |
|---|---|
| Ubuntu Linux | Server OS |
| Bash | Automation scripting |
| Nginx | Web server |
| UFW | Firewall |
| Git | Version control |
| curl | HTTP testing and transfers |
| systemctl | Service lifecycle management |

---

## Quick Start

```bash
# Clone the repo
git clone https://github.com/Abhishek01Devops/Devops-journey.git

# Navigate to the project
cd Devops-journey/Devops-Journey/portfolio-projects/linux-server-setup

# Make the script executable
chmod +x setup.sh

# Run the setup
./setup.sh
```

---

## What the Script Does

```bash
#!/bin/bash
# Linux Server Setup Script
# Author: Abhishek

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing essential packages..."
sudo apt install -y nginx git curl ufw

echo "Starting and enabling nginx..."
sudo systemctl start nginx
sudo systemctl enable nginx        # auto-starts on every reboot

echo "Configuring firewall..."
sudo ufw allow OpenSSH             # allow SSH so you don't lock yourself out
sudo ufw allow 'Nginx Full'        # allow HTTP (80) and HTTPS (443)
sudo ufw enable

echo "Checking nginx status..."
sudo systemctl status nginx

echo "Server setup completed successfully."
```

### Step-by-step breakdown

| Step | Command | Why |
|---|---|---|
| Update packages | `apt update && apt upgrade -y` | Ensures latest security patches |
| Install Nginx | `apt install nginx` | Web server for serving content |
| Install Git | `apt install git` | Version control for deployments |
| Install curl | `apt install curl` | Test HTTP endpoints from terminal |
| Enable Nginx | `systemctl enable nginx` | Auto-starts after reboot |
| Allow OpenSSH | `ufw allow OpenSSH` | Keep SSH access open before enabling firewall |
| Allow Nginx Full | `ufw allow 'Nginx Full'` | Opens ports 80 (HTTP) and 443 (HTTPS) |
| Enable UFW | `ufw enable` | Activates the firewall |

---

## Verification Steps

After running the script, verify everything is working:

```bash
# Check Nginx is running
sudo systemctl status nginx

# Test local web server response
curl http://localhost

# Check firewall rules are active
sudo ufw status verbose

# Check system health
top
df -h
free -h
```

---

## Key Concepts Learned

- Writing and executing Bash automation scripts
- Using `systemctl` to manage and enable services
- UFW firewall rules — why OpenSSH must be allowed before enabling the firewall
- Difference between `systemctl start` (run now) and `systemctl enable` (run on boot)
- How to verify a server is correctly configured after setup

---

## Project Status

✅ System packages updated  
✅ Nginx installed and running  
✅ Git and curl installed  
✅ UFW firewall configured with correct rules  
✅ Server health verified  
✅ Script tested on Ubuntu (UTM VM on Mac)  

