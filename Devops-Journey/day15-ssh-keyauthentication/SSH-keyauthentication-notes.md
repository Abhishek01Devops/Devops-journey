## What is SSH?
SSH (Secure Shell) is a protocol used to securely connect to another server over a network.
# Used for:
- Remote server login
- Managing cloud servers
- DevOps automation
- Secure file transfer
	
* Private Key → stays on your local machine (secret)
* Public Key → copied to the remote server

## ls -la ~/.ssh :- SSH Key Files (Client Side)
Important Files :-
File             ->        Purpose
id_ed25519       ->     Private key (secret, stays on client)
id_ed25519.pub   ->     Public key (shared with server)
known_hosts      ->     Stores trusted server fingerprints

Key Concept:
Private key must never be shared.

## cat ~/.ssh/id_ed25519.pub :- Viewing Public Key

## ssh-keygen -lf ~/.ssh/id_ed25519.pub :-  SSH Key Fingerprint
# Purpose
- Unique identity of SSH key
- Used to verify authenticity
- Prevents impersonation attacks

## ssh -v devops@192.168.64.2 :- Debugging SSH Authentication
- Offering public key
- Server accepts key
- Authentication succeeded

# SSH Authentication Flow
- Client connects to server
- Client offers public key identity
- Server checks authorized_keys
- Server sends cryptographic challenge
- Client proves ownership using private key
- Access granted

# Why SSH Keys Are Secure
- Password is never transmitted
- Uses cryptographic verification
- Resistant to brute-force attacks
- Industry standard for DevOps and cloud servers


## ~/.ssh/config :- Create SSH Host Alias (devops-lab) Configured in:
* Example:
Host devops-lab
HostName 192.168.64.2
User devops
IdentityFile ~/.ssh/id_ed25519_lab

