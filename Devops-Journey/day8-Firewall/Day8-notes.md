# 🚀 Day 8 – Firewalls & Port Security

## 🎯 Objective
Understand:
- What a firewall is
- How ports are blocked/allowed
- Host-based firewall vs Cloud firewall
- How DevOps secure production servers

---

# 🔥 1️⃣ What is a Firewall?

A firewall controls:

Who can access which port on your machine.

Think of:
- IP = House
- Port = Door
- Firewall = Security Guard

If firewall blocks port 22 → SSH not accessible  
If firewall allows port 80 → Website accessible  

---

# 🧠 2️⃣ Types of Firewalls

## 1. Host-Based Firewall
Runs on the server itself.

Examples:
- ufw (Linux)
- iptables (Linux)
- pf (macOS)
- Windows Defender Firewall

---

## 2. Network Firewall
Sits between machines (router / enterprise firewall).

---

## 3. Cloud Firewall (Most Important for DevOps)

Examples:
- AWS Security Groups
- Azure NSG
- Google Cloud VPC Firewall

These control traffic to cloud virtual machines.

---

# 🔐 3️⃣ macOS Firewall Commands

Check firewall status:
