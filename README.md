# 🚀 DevOps Journey

![DevOps](https://img.shields.io/badge/DevOps-Learning-blue?style=flat-square)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange?style=flat-square&logo=ubuntu)
![Shell](https://img.shields.io/badge/Shell-Bash-green?style=flat-square&logo=gnu-bash)
![Progress](https://img.shields.io/badge/Progress-Day%2024%2F100-purple?style=flat-square)
![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square)

A structured, hands-on documentation of my journey to becoming a DevOps Engineer — one day at a time. Every folder contains real commands, real configs, and real output from working on an Ubuntu Linux VM.

---

## 👨‍💻 About Me

- 🎯 Goal: Become a DevOps Engineer in 8 months
- 🖥️ Environment: MacBook Air + Ubuntu VM (UTM)
- 📍 Location: Bengaluru, India
- 💼 Open to: Junior DevOps / Cloud / Platform Engineer roles

---

## 🛠️ Portfolio Projects

> Real projects built during this journey — each in its own repository

| Project | Description | Tech Stack |
|---|---|---|
| [🔐 SSH Key Authentication](https://github.com/Abhishek01Devops/ssh-key-authentication) | Replaced password SSH login with Ed25519 key pair auth, hardened sshd_config | Linux, SSH, UFW |
| [🌐 Nginx Reverse Proxy](https://github.com/Abhishek01Devops/nginx-reverse-proxy) | Configured Nginx to forward port 80 traffic to a Python backend on port 5000 | Nginx, Python, Linux |
| [⚙️ Linux Server Setup](https://github.com/Abhishek01Devops/linux-server-setup) | Automated full server provisioning with a single Bash script | Bash, Nginx, UFW, systemctl |

---

## 🗺️ Roadmap

```
Phase 1 — Linux & Bash (Current)     ████████████░░░░  Day 24/30
Phase 2 — Docker & Containers         ░░░░░░░░░░░░░░░░  Not started
Phase 3 — CI/CD Pipelines             ░░░░░░░░░░░░░░░░  Not started
Phase 4 — Cloud (AWS)                 ░░░░░░░░░░░░░░░░  Not started
Phase 5 — Infrastructure as Code      ░░░░░░░░░░░░░░░░  Not started
Phase 6 — Kubernetes                  ░░░░░░░░░░░░░░░░  Not started
Phase 7 — Monitoring + Job Hunt       ░░░░░░░░░░░░░░░░  Not started
```

---

## 📚 Daily Learning Log

### Phase 1 — Linux Fundamentals (Days 1–10)

| Day | Topic | Key Concepts |
|---|---|---|
| Day 01 | [DevOps Basics & Linux Commands](./Devops-Journey/day1-linux-basics/) | ls, cd, pwd, touch, echo, cat, less |
| Day 02 | [Linux Permissions](./Devops-Journey/day2-permissions/) | rwx, chmod +x, 755/644, shell scripts |
| Day 03 | [Users, Groups & Security](./Devops-Journey/day3-users-groups/) | chown, chmod, secret protection, attack simulation |
| Day 04 | [Users, Sudo & Processes](./Devops-Journey/day4-users-sudo-processes/) | sudo, root vs user, real attack logic |
| Day 05 | [Process Monitoring](./Devops-Journey/day5-processes-monitoring/) | ps, kill, job control, signals |
| Day 06 | [Search, Disk & Logs](./Devops-Journey/day6-search-disk-logs/) | find, df, du, log compression, outage simulation |
| Day 07 | [Networking](./Devops-Journey/day7-networking/) | ifconfig, ping, DNS, routing table, traceroute |
| Day 08 | [Firewall & Ports](./Devops-Journey/day8-Firewall/) | UFW, stealth mode, SSH status |
| Day 09 | [Ports, Sockets & Processes](./Devops-Journey/day9-ports-sockets/) | netstat, ss, lsof, service lifecycle |
| Day 10 | [Linux + Web Server](./Devops-Journey/day10-linux-webserver/) | Nginx, curl localhost, logs, break/fix |

### Phase 1 — System Administration (Days 11–17)

| Day | Topic | Key Concepts |
|---|---|---|
| Day 11 | [systemd & systemctl](./Devops-Journey/day11-system-systemctl/) | start vs enable, restart vs reload, boot services |
| Day 12 | [journalctl & Logs](./Devops-Journey/day12-journalctl-logs/) | log filtering, real troubleshooting workflow |
| Day 13 | [Service Troubleshooting](./Devops-Journey/day13-service-troubleshooting/) | structured debugging, network vs service issues |
| Day 14 | [SSH Architecture](./Devops-Journey/day14-ssh-architecture/) | how SSH works, auth methods, key components |
| Day 15 | [SSH Key Authentication](./Devops-Journey/day15-ssh-keyauthentication/) | key pairs, authorized_keys, SSH client config |
| Day 16 | [SSH Hardening](./Devops-Journey/day16-ssh-hardening/) | disable root login, change port, restrict users |
| Day 17 | [UFW Advanced Rules](./Devops-Journey/day17-ufw-advanced-rules/) | allow/deny IP, subnet rules, brute-force limiting |

### Phase 1 — Advanced Linux (Days 18–24)

| Day | Topic | Key Concepts |
|---|---|---|
| Day 18 | [Package Management](./Devops-Journey/day18-package-management/) | apt install/remove/purge, search, clean |
| Day 19 | [Environment Variables](./Devops-Journey/day19-environment-variables/) | export, .bashrc, permanent vs temporary vars |
| Day 20 | [Linux File Hierarchy](./Devops-Journey/day20-linux-file-hierarchy/) | /etc, /var, /usr, /home, /proc structure |
| Day 21 | [Find Command](./Devops-Journey/day21-find-command-mastery/) | find by name/size/time, exec, cleanup automation |
| Day 22 | [Grep Deep Dive](./Devops-Journey/day22-grep-deep-dive/) | regex, log analysis, pipes, real-time monitoring |
| Day 23 | [Sed Basics](./Devops-Journey/day23-sed-basics/) | text replacement, in-place editing, line deletion |
| Day 24 | [Awk Basics](./Devops-Journey/day24-awk-basics/) | field extraction, conditions, log analysis, counting |
| Day 25 | [Text Processing Practice](./Devops-Journey/day25-text-processing/) | grep, awk, sed combined usage, pipelines, log analysis, real-time monitoring |
---

## 🧰 Skills Acquired

```
Linux Administration    ████████████░░░░  Strong
Bash Scripting          ████████░░░░░░░░  Intermediate
SSH & Security          ████████████░░░░  Strong
Nginx                   ████████░░░░░░░░  Intermediate
Networking              ██████░░░░░░░░░░  Basic-Intermediate
Git & GitHub            ██████░░░░░░░░░░  Basic-Intermediate
Docker                  ░░░░░░░░░░░░░░░░  Coming next
CI/CD                   ░░░░░░░░░░░░░░░░  Coming soon
AWS                     ░░░░░░░░░░░░░░░░  Planned
Terraform               ░░░░░░░░░░░░░░░░  Planned
Kubernetes              ░░░░░░░░░░░░░░░░  Planned
```

---

## 🖥️ Environment Setup

| Component | Details |
|---|---|
| Local Machine | MacBook Air |
| VM Software | UTM |
| Server OS | Ubuntu (ARM64) |
| Shell | Bash |
| Editor | VS Code |
| Version Control | Git + GitHub |

---

## 📈 Stats

- 🔥 90+ commits and counting
- 📁 24 day-folders with real notes and commands
- 🛠️ 3 portfolio projects shipped
- 📅 Started: February 2026
- 🎯 Target: DevOps Engineer by October 2026





