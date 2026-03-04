# Day 17 – Hour 1

## Concepts Learned:
- Default deny incoming
- Allow specific IP
- Deny specific IP
- Allow subnet
- Rule order importance

## Commands Practiced:
- sudo ufw status verbose
- sudo ufw default deny incoming
- sudo ufw allow from 192.168.64.1 to any port 22 proto tcp
- sudo ufw deny from 192.168.64.100
- sudo ufw allow from 192.168.64.0/24
s- udo ufw status numbered

## Key Learning:
- Firewall reads rules top to bottom.
- Always test before closing SSH session.

## Final Secure UFW Configuration
- Denied malicious IP: 192.168.64.100
- SSH allowed only from trusted IP: 192.168.64.1 on port 2222
- HTTP (80) open to public
- Removed unsafe subnet-wide allow rule

## Lesson:
- Firewall rules must be least-privilege based.
- Never use broad ALLOW rules unless required.

## Ubuntu 24.04 SSH Port Change Issue

Issue:
SSH did not move to new port after editing sshd_config.

Root Cause:
Ubuntu 24.04 uses systemd socket activation (ssh.socket).

Fix:
Restarted ssh.socket and daemon-reload.
Verified using:
sudo ss -tulnp | grep ssh

Lesson:
In modern Ubuntu, ssh.socket controls port binding.

## SSH Debugging Deep Dive

Issues Faced:
- Connection refused
- Wrong port binding due to ssh.socket
- Key mismatch in authorized_keys
- Engineer account locked
- PasswordAuthentication disabled

Commands Used:
- ssh -v
- ss -tulnp | grep ssh
- sudo passwd -S engineer
- sudo systemctl restart ssh.socket
- sudo grep AllowUsers /etc/ssh/sshd_config

Lesson:
SSH problems must be debugged layer by layer:
Network → Firewall → Service → Config → Account → Keys

