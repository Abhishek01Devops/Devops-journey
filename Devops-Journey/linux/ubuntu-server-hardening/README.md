Ubuntu Server Hardening (Production Style)
📌 Server Overview

OS: Ubuntu 24.04 LTS

Access: SSH (Key-based authentication)

User: engineer

Architecture: ARM64

🔐 SSH Security Configuration
1️⃣ Created Non-Root User
sudo adduser engineer
sudo usermod -aG sudo engineer

2️⃣ Generated SSH Key (Local Machine)
ssh-keygen -t ed25519 -C "engineer@ubuntu-server"

3️⃣ Copied Public Key to Server
ssh-copy-id engineer@<server-ip>

4️⃣ Disabled Root Login

Edited:

/etc/ssh/sshd_config


Set:

PermitRootLogin no

5️⃣ Disabled Password Authentication
PasswordAuthentication no

6️⃣ Restarted SSH Service
sudo systemctl restart ssh

🔥 Firewall (Next Phase)
sudo ufw allow OpenSSH
sudo ufw enable

🛡 Current Security Status

Root login disabled

Password authentication disabled

Key-only SSH access enabled

Sudo user configured
