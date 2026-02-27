## sudo systemctl status ssh :- SSH Service (sshd)
# What We Learned
- SSH runs as a system service.
- Service name: ssh.service
- Status should be: Active: active (running)

## ss -tulnp | grep 22 :- SSH Listening Port
staus :-  LISTEN 0 4096 0.0.0.0:22
# Concept
- Port 22 is the default SSH port.
- LISTEN means server is waiting for connections.
- Network ports act like doors to services.

## ps aux | grep sshd :- SSH services
# We Saw
- Root SSH daemon process
- User session process

# Concept
- One main sshd process
- New process created for every login session

## who :- devops pts/0 192.168.64.1
This confirms remote login.

## dpkg -l | grep openssh :- SSH Package Verification
# Packages Found
- openssh-server
- openssh-client

# Concept
- Server handles incoming connections.
- Client initiates connections.

## Key Concepts Learned
- SSH = Secure remote login protocol
- sshd = background service handling connections
- Port 22 = SSH communication port
- Each login creates a session
- Remote administration is core DevOps practice

## sudo tail -f /var/log/auth.log :-Monitoring SSH Logs in Real Time
# Purpose
- Watches authentication logs live.
- Displays login activity instantly.
- Commonly used for security monitoring and troubleshooting.

# SSH Login Flow (Architecture)
Mac (SSH Client)
        ↓
Network Connection (Port 22)
        ↓
sshd (SSH Daemon)
        ↓
Authentication Check
        ↓
Session Creation
        ↓
Log Entry Written

## grep sshd /var/log/auth.log :- Filter SSH Entries

## Key Concepts Learned
- SSH login activity is always logged.
- Every authentication attempt leaves evidence.
- Logs help detect unauthorized access.
- DevOps engineers use logs for troubleshooting and security auditing.

# SSH is not just remote login — it is a tracked and auditable access system.


# Why SSH Keys?

Password authentication problems:

- Vulnerable to brute-force attacks
- Less secure
- Manual login required

SSH Key Authentication provides:

- Secure login
- Faster access
- Industry standard server security
- Used in AWS, Azure, GCP servers

# SSH Authentication Types

## Password Authentication
Client → Server → Password verification

## Key-Based Authentication
Client → Public Key Match → Login Approved

No password required.

# SSH Key Components
Two files are created:
Private Key (Keep Secret)

# Cloud servers disable password login and use SSH keys only.
This improves:
- Security
- Automation
- Infrastructure access control

