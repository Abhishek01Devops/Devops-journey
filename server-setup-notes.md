# Server Setup Notes

## Ubuntu VM Setup (UTM on Mac)
- OS: Ubuntu ARM64
- Virtualisation: UTM on MacBook Air
- SSH port: 2222
- User: devops

## Packages Installed
- nginx
- git
- curl
- ufw

## Firewall Rules Applied
- ufw allow OpenSSH
- ufw allow 'Nginx Full'
- ufw enable

## SSH Hardening Applied
- PasswordAuthentication no
- PubkeyAuthentication yes
- Port 2222
- Key type: Ed25519

## Services Enabled on Boot
- nginx (systemctl enable nginx)
- ssh

## Useful Commands
# Check nginx status
sudo systemctl status nginx

# Check firewall rules
sudo ufw status verbose

# Check listening ports
ss -tlnp

# Check system health
df -h && free -h && uptime
