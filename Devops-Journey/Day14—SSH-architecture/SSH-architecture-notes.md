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

