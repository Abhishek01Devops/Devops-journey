## SSh Hardening

## Objective
- Secure SSH access on the Ubuntu server by:
- Backing up SSH configuration
- Verifying SSH key login
- Disabling root login
- Disabling password authentication

## ssh devops@<server-ip>:- login to server

## sudo systemctl status ssh (" Verify SSH Service Status")

## sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak (" Backup SSH Configuration ")

## ls /etc/ssh/ ("Verify backup")

## ssh devops@<server-ip> ("Confirm SSH Key Authentication Works, From a new termina")
- Login should happen without asking for password.
- If password still prompts → do NOT continue hardening.

## sudo nano /etc/ssh/sshd_config ("Edit SSH Configuration")
# Modify or add these lines:
- PermitRootLogin no
- PasswordAuthentication no
- PermitEmptyPasswords no
- PubkeyAuthentication yes

# Explanation
- ermitRootLogin no
* Prevents direct root login.
- PasswordAuthentication no
* Disables password-based login.
- PermitEmptyPasswords no
* Prevents login with blank passwords.
- PubkeyAuthentication yes
* Ensures SSH key login is enabled.

## sudo systemctl restart ssh ("Restart SSH Service")
Always keep one SSH session open while restarting.

## ssh root@<server-ip> ("Root Login Test")
Expected:- Permission denied " Root login successfully blocked."

## ssh devops@<server-ip> ("Login should succeed using SSH key.")

## Security Improvements Achieved
- Root login disabled
- Password authentication disabled
- Only SSH key-based login allowed
- Backup created for safe rollback
- SSH service validated after changes

## Key Learning
- Never modify SSH without backup.
- Always test in a new terminal before closing current session.
- SSH key authentication is mandatory for production servers.
- Root login should always be disabled in secure environments.

## sudo nano /etc/ssh/sshd_config ("Edit SSH Configuration")
Find this line: #Port 22 Change to:Port 2222

## sudo ufw allow 2222/tcp
## sudo ufw reload
( Configure Firewall (Very Important))

## sudo systemctl restart ssh (" Restart SSH Service")

## ssh -p 2222 devops@<server-ip> ("Test New SSH Port ")

## ssh devops@<server-ip> ("Test Blocked Scenarios")

## ssh -p 2222 engineer@192.168.62.2("Test other user (should fail)")

## Security Improvements Achieved
- Default SSH port changed
- SSH brute-force noise reduced
- Only authorized user allowed
- Firewall updated properly
- SSH tested safely