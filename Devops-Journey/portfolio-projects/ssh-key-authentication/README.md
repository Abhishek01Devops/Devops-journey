# SSH Key Authentication

A practical Linux security project demonstrating how to replace password-based SSH login with cryptographic key pair authentication — the standard method used in production servers and cloud environments.

## What This Project Does

SSH key authentication eliminates the need for passwords when connecting to a remote server. Instead, a cryptographic key pair (private + public) is used to verify identity. The private key stays on your local machine; the public key is placed on the server.

```
Your Mac                          Ubuntu Server
─────────────────                 ─────────────────────
~/.ssh/id_ed25519_lab  ─── SSH ──▶  ~/.ssh/authorized_keys
(private key, stays here)           (public key, stored here)
```

## Why This Matters in DevOps

- Password login is vulnerable to brute-force attacks
- Key-based auth is required for automated CI/CD pipelines
- Cloud providers (AWS, GCP, Azure) use key pairs by default
- Disabling password auth is a baseline server hardening step

---

## Environment

| Component | Detail |
|---|---|
| Local machine | macOS |
| Remote server | Ubuntu Linux VM (UTM) |
| SSH port | 2222 |
| Server IP | 192.168.64.2 |
| User | devops |
| Key type | Ed25519 (modern, more secure than RSA) |

---

## Steps Performed

### 1. Generate SSH Key Pair on Local Machine

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_lab
```

This creates two files:
- `~/.ssh/id_ed25519_lab` — private key (never share this)
- `~/.ssh/id_ed25519_lab.pub` — public key (copied to server)

Ed25519 is chosen over RSA because it is faster, shorter, and considered more secure.

### 2. Copy Public Key to the Server

```bash
ssh-copy-id -i ~/.ssh/id_ed25519_lab.pub -p 2222 devops@192.168.64.2
```

This appends the public key to `~/.ssh/authorized_keys` on the server, authorising that key for login.

### 3. Harden SSH Configuration on the Server

Edit the SSH daemon config:

```bash
sudo nano /etc/ssh/sshd_config
```

Changes made:

```
PasswordAuthentication no
PubkeyAuthentication yes
```

- `PasswordAuthentication no` — disables password login entirely, blocking brute-force attacks
- `PubkeyAuthentication yes` — explicitly enables key-based authentication

### 4. Restart SSH Service to Apply Changes

```bash
sudo systemctl restart ssh
```

### 5. Test Passwordless Login from Mac

```bash
ssh -p 2222 devops@192.168.64.2
```

Result: logged in successfully without being prompted for a password, confirming SSH key authentication is working correctly.

---

## Security Impact

| Before | After |
|---|---|
| Password login enabled | Password login disabled |
| Vulnerable to brute-force | Brute-force not possible |
| Manual password entry required | Passwordless, automated login |

---

## Key Concepts Learned

- How asymmetric cryptography works in SSH (public/private key pairs)
- Why Ed25519 is preferred over RSA for new key generation
- How `authorized_keys` works on the server side
- The critical sshd_config settings for hardening SSH access
- How to safely test changes before fully disabling password auth

---

## Project Status

✅ Ed25519 key pair generated on local Mac  
✅ Public key copied to Ubuntu server  
✅ Password authentication disabled in sshd_config  
✅ Passwordless SSH login tested and confirmed working  
