## Day 8 – Virtualization & ARM Lab Setup (M2 Mac)

## Objective
Set up a Linux lab environment for DevOps practice using UTM on Apple Silicon.

## System Details :
Host Machine: MacBook Air M2
Host Architecture: arm64
Virtualization Tool: UTM
OS Installed: Ubuntu Server 24.04 ARM64

## What I Learned Today
Architecture Matters (Very Important)
VirtualBox standard version does not support Apple Silicon properly.
M2 Mac uses ARM architecture.
Ubuntu ISO must match architecture.
Correct ISO: ubuntu-24.04-live-server-arm64.iso
Wrong architecture caused: “Unsupported architecture” error

## Difference Between x86_64 and ARM64
x86_64 → Intel/AMD systems
arm64 / aarch64 → Apple Silicon & ARM systems

## Key Learning:
Architecture mismatch = VM boot failure

## UTM Configuration
Successfully configured VM with:
Emulate → Linux
Architecture: ARM64 (aarch64)
RAM: 4 GB
CPU: 4 cores
Storage: 40 GB
Boot from Ubuntu ARM64 ISO


## Ubuntu Server Installation
Used entire disk for storage
Created user account
Installed OpenSSH server
Prepared system for DevOps practice

## Major Concepts Understood
Virtualization vs Emulation
Apple Silicon limitations
Bootloader (UEFI)
Disk attachment configuration
VM storage mapping



