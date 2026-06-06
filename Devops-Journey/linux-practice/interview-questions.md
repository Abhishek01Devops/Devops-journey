# Linux Interview Questions and Answers

## 1. What is Linux?

Linux is an open-source, Unix-like operating system kernel developed by Linus Torvalds in 1991.

---

## 2. What is the difference between Linux and Unix?

| Linux | Unix |
|--------|------|
| Open Source | Mostly Proprietary |
| Free to use | Commercial Licenses |
| Multiple Distributions | Vendor-Specific Versions |
| Community Driven | Vendor Supported |

---

## 3. What is a Linux Distribution?

A Linux distribution is a complete operating system built on the Linux kernel.

### Examples:
- Ubuntu
- Debian
- Red Hat Enterprise Linux (RHEL)
- CentOS
- Fedora

---

## 4. What is the Root User?

The root user is the superuser with unrestricted access to all files, commands, and system configurations.

---

## 5. What is the difference between Absolute and Relative Paths?

### Absolute Path

Starts from the root directory:

```bash
/home/user/file.txt
```

### Relative Path

Starts from the current directory:

```bash
documents/file.txt
```

---

## 6. Difference Between cp, mv, and rm

### Copy Files

```bash
cp source.txt destination.txt
```

### Move or Rename Files

```bash
mv oldname.txt newname.txt
```

### Remove Files

```bash
rm file.txt
```

---

## 7. How Do You Find a File?

Using `find`:

```bash
find /home -name "file.txt"
```

Using `locate`:

```bash
locate file.txt
```

---

## 8. What is grep?

Used to search text using patterns.

```bash
grep "error" logfile.txt
```

---

## 9. What is chmod?

Changes file permissions.

```bash
chmod 755 script.sh
```

### Meaning of 755

- 7 = rwx (Read, Write, Execute)
- 5 = r-x (Read, Execute)
- 5 = r-x (Read, Execute)

---

## 10. What is chown?

Changes file ownership.

```bash
chown user:group file.txt
```

---

## 11. How Do You View Running Processes?

```bash
ps -ef
```

```bash
top
```

```bash
htop
```

---

## 12. How Do You Kill a Process?

```bash
kill PID
```

Force Kill:

```bash
kill -9 PID
```

---

## 13. Difference Between Process and Thread

| Process | Thread |
|----------|---------|
| Independent Execution Unit | Lightweight Execution Unit |
| Separate Memory | Shared Memory |
| More Overhead | Less Overhead |

---

## 14. What is a Daemon Process?

A background service process.

### Examples

- sshd
- httpd
- crond

---

## 15. Linux Directory Structure

```text
/
├── bin
├── boot
├── dev
├── etc
├── home
├── var
├── tmp
├── usr
└── opt
```

### Important Directories

| Directory | Purpose |
|------------|----------|
| /bin | Essential commands |
| /boot | Boot files |
| /dev | Device files |
| /etc | Configuration files |
| /home | User home directories |
| /var | Logs and variable data |
| /tmp | Temporary files |
| /usr | User applications |
| /opt | Optional software |

---

## 16. What is /etc?

Stores system configuration files.

Examples:

```bash
/etc/passwd
/etc/hosts
/etc/fstab
```

---

## 17. Difference Between Hard Link and Soft Link

| Hard Link | Soft Link |
|------------|------------|
| Same inode | Different inode |
| Cannot cross filesystems | Can cross filesystems |
| Survives source deletion | Breaks if source deleted |

### Create Hard Link

```bash
ln file1 hardlink
```

### Create Soft Link

```bash
ln -s file1 softlink
```

---

## 18. How Do You Check Disk Usage?

```bash
df -h
```

Directory Size:

```bash
du -sh directory_name
```

---

## 19. How Do You Check IP Address?

```bash
ip addr show
```

OR

```bash
hostname -I
```

---

## 20. Difference Between ping, traceroute and netstat

### ping

Checks network connectivity.

```bash
ping google.com
```

### traceroute

Shows packet path.

```bash
traceroute google.com
```

### netstat

Displays network connections.

```bash
netstat -tulnp
```

---

## 21. How Do You Check Open Ports?

```bash
ss -tulnp
```

OR

```bash
netstat -tulnp
```

---

## 22. How Do You Test Connectivity to a Port?

Using Telnet:

```bash
telnet hostname 80
```

Using Netcat:

```bash
nc -zv hostname 80
```

---

## 23. What is a Shell Script?

A file containing Linux commands executed by a shell.

### Example

```bash
#!/bin/bash

echo "Hello World"
```

Run:

```bash
chmod +x script.sh
./script.sh
```

---

## 24. Difference Between $? and $$

### $?

Exit status of previous command.

```bash
echo $?
```

### $$

Current shell process ID.

```bash
echo $$
```

---

## 25. How Do You Pass Arguments to a Script?

Run Script:

```bash
./script.sh arg1 arg2
```

Inside Script:

```bash
echo $1
echo $2
echo $#
echo $@
```

---

## 26. What is systemd?

systemd is the init system and service manager used by modern Linux distributions.

---

## 27. How Do You Manage Services?

Start Service:

```bash
systemctl start nginx
```

Stop Service:

```bash
systemctl stop nginx
```

Restart Service:

```bash
systemctl restart nginx
```

Check Status:

```bash
systemctl status nginx
```

Enable at Boot:

```bash
systemctl enable nginx
```

---

## 28. How Do You Check Logs?

System Logs:

```bash
journalctl
```

Service Logs:

```bash
journalctl -u nginx
```

Live Logs:

```bash
journalctl -f
```

---

## 29. What is Cron?

Cron is used to schedule tasks automatically.

Edit Cron Jobs:

```bash
crontab -e
```

### Example

```bash
0 2 * * * /backup.sh
```

Runs every day at 2:00 AM.

---

## 30. Explain Linux Boot Process

1. BIOS/UEFI
2. GRUB Bootloader
3. Linux Kernel
4. Init/Systemd
5. Services Start
6. User Login

---

## 31. What is Load Average?

Average number of runnable or waiting processes during:

- 1 Minute
- 5 Minutes
- 15 Minutes

Check:

```bash
uptime
```

---

## 32. What is an Inode?

An inode stores metadata about a file.

### Includes

- Owner
- Permissions
- File Size
- Timestamps
- Disk Block Locations

Check Inode:

```bash
ls -i
```

---

## 33. RAID Levels

### RAID 0

- Striping
- High Performance
- No Redundancy

### RAID 1

- Mirroring
- Fault Tolerance

### RAID 5

- Striping + Parity
- Better Storage Efficiency

---

## 34. How Do You Troubleshoot a Slow Linux Server?

### Check CPU

```bash
top
```

### Check Memory

```bash
free -h
```

### Check Disk

```bash
df -h
```

### Check High CPU Processes

```bash
ps aux --sort=-%cpu
```

### Check Logs

```bash
journalctl -xe
```

---

## 35. Scenario: Disk is Full

Check Disk Usage:

```bash
df -h
```

Find Large Files:

```bash
du -ah / | sort -rh | head
```

Actions:

- Delete unnecessary files
- Rotate logs
- Clear temp files
- Extend storage

---

## 36. Scenario: Service Not Starting

Check Status:

```bash
systemctl status service_name
```

Check Logs:

```bash
journalctl -u service_name
```

Common Causes:

- Configuration errors
- Port conflicts
- Permission issues
- Missing dependencies

---

## 37. Scenario: Process Consuming 100% CPU

Find Process:

```bash
top
```

OR

```bash
ps aux --sort=-%cpu
```

Kill Process:

```bash
kill PID
```

Force Kill:

```bash
kill -9 PID
```

Investigate logs before restarting.

---

# Advanced Linux Interview Topics

## Kernel Space vs User Space

- Kernel Space has full hardware access.
- User Space has restricted access.

---

## What is Swap Memory?

Swap is disk space used when RAM is full.

Check Swap:

```bash
swapon --show
free -h
```

---

## What is LVM?

LVM (Logical Volume Manager) provides flexible disk management.

Benefits:

- Resize volumes
- Snapshots
- Easy storage expansion

---

## What is SELinux?

Security-Enhanced Linux provides mandatory access control.

Check Status:

```bash
getenforce
```

---

## Difference Between TCP and UDP

| TCP | UDP |
|------|------|
| Connection Oriented | Connectionless |
| Reliable | Faster |
| Error Checking | No Guarantee |

---

## What are Zombie Processes?

Processes that have completed execution but still have an entry in the process table.

---

## What are Orphan Processes?

Processes whose parent process has terminated.

---

## What is DNS Resolution?

DNS converts domain names into IP addresses.

Example:

```bash
nslookup google.com
```

---

## What are File Descriptors?

Numbers used by Linux to identify open files.

Standard File Descriptors:

| Descriptor | Purpose |
|------------|----------|
| 0 | Standard Input |
| 1 | Standard Output |
| 2 | Standard Error |

---

## What is fork()?

fork() creates a new child process.

---

## What is Context Switching?

The CPU switches from one process/thread to another.

---

## What are Namespaces and cgroups?

### Namespaces

Provide process isolation.

### cgroups

Control CPU, memory, and resource usage.

Used heavily in Docker and Kubernetes.

---

# Top Linux Commands Every DevOps Engineer Should Know

```bash
ls
pwd
cd
mkdir
rm
cp
mv
cat
less
head
tail
grep
find
locate
chmod
chown
ps
top
htop
kill
df
du
free
ip
ping
traceroute
netstat
ss
curl
wget
tar
zip
unzip
systemctl
journalctl
crontab
ssh
scp
rsync
```