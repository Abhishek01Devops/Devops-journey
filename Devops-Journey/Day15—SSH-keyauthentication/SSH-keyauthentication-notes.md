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
