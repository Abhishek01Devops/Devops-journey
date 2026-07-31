---

# Project Summary and Interview Questions

## Project Name

**Deploying Multiple Websites on a Single Nginx Server Using Virtual Hosts**

---

# Project Objective

The objective of this project was to learn how to host multiple websites on a single Linux server using **Nginx Virtual Hosts (Server Blocks)**.

Instead of using one Nginx configuration for every website, each website was configured independently with its own:

- Document Root
- Server Block
- Configuration File
- HTML Page
- Hostname

This is the same concept used in production servers where one server hosts multiple domains.

---

# Environment Used

## Operating System

```
Ubuntu Linux
```

## Web Server

```
Nginx
```

## Configuration Directory

```
/etc/nginx/sites-available
```

## Enabled Configuration Directory

```
/etc/nginx/sites-enabled
```

## Website Directory

```
/var/www/
```

---

# Websites Created

Website 1

```
site1.local
```

Website 2

```
site2.local
```

Website 3

```
site3.local
```

Each website had its own directory and HTML page.

---

# Directory Structure

```
/var/www/

├── site1.local/
│     └── html/
│            └── index.html

├── site2.local/
│     └── html/
│            └── index.html

└── site3.local/
      └── html/
             └── index.html
```

---

# Configuration Files

```
/etc/nginx/sites-available/site1.local

/etc/nginx/sites-available/site2.local

/etc/nginx/sites-available/site3.local
```

Each file contained:

- listen directive
- server_name
- root
- index
- location block

---

# Symbolic Links

Created using:

```bash
sudo ln -s /etc/nginx/sites-available/site1.local /etc/nginx/sites-enabled/
```

Purpose:

Enable the website configuration without duplicating the configuration file.

---

# Hosts File

```
/etc/hosts
```

Entries:

```
127.0.0.1 site1.local

127.0.0.1 site2.local

127.0.0.1 site3.local
```

Purpose:

Map custom hostnames to the local server for testing.

---

# Testing Commands Used

```bash
sudo nginx -t
```

Tests Nginx configuration.

---

```bash
sudo systemctl reload nginx
```

Reloads the configuration.

---

```bash
sudo systemctl status nginx
```

Checks the service status.

---

```bash
curl http://site1.local
```

Tests Website 1.

---

```bash
curl http://site2.local
```

Tests Website 2.

---

```bash
curl http://site3.local
```

Tests Website 3.

---

```bash
curl -H "Host: site1.local" http://127.0.0.1
```

Tests Host Header routing.

---

```bash
ss -tulnp | grep nginx
```

Checks whether Nginx is listening on port 80.

---

```bash
ps aux | grep nginx
```

Displays Nginx processes.

---

# Key Concepts Learned

- Nginx Web Server
- Virtual Hosts (Server Blocks)
- Document Root
- Host Header
- Symbolic Links
- File Permissions
- Linux Directory Structure
- HTTP Request Routing
- Nginx Configuration
- Service Management
- Website Testing
- Troubleshooting

---

# Real-World Use Case

Large organizations often host many websites on the same Linux server.

Example:

```
company.com

blog.company.com

careers.company.com

support.company.com
```

Instead of running multiple web servers, **Nginx uses Virtual Hosts** to serve each website independently based on the requested domain name.

This approach saves system resources, simplifies management, and is widely used in production environments.

---

# Skills Gained

After completing this project, you can:

- Install and manage Nginx.
- Create website directory structures.
- Configure multiple Virtual Hosts.
- Enable sites using symbolic links.
- Understand how the Host header works.
- Test websites using `curl`.
- Validate configurations with `nginx -t`.
- Reload Nginx safely.
- Troubleshoot common web server issues.
- Verify logs and service status.

---

# Interview Questions

## 1. What is Nginx?

**Answer:**

Nginx is a high-performance web server and reverse proxy server used to serve websites, handle HTTP requests, load balance traffic, and proxy requests to backend applications.

---

## 2. What is a Virtual Host (Server Block)?

**Answer:**

A Virtual Host, also called a Server Block in Nginx, is a configuration that allows one Nginx server to host multiple websites using different domain names.

---

## 3. What is a Document Root?

**Answer:**

The Document Root is the directory from which Nginx serves website files such as `index.html`, CSS, JavaScript, and images.

---

## 4. Why do we use `/etc/nginx/sites-available`?

**Answer:**

It stores all available Nginx website configuration files. A site becomes active only after it is linked into `sites-enabled`.

---

## 5. Why do we use `/etc/nginx/sites-enabled`?

**Answer:**

It contains symbolic links to the active website configurations that Nginx loads.

---

## 6. Why do we create symbolic links instead of copying configuration files?

**Answer:**

Symbolic links avoid duplicate configuration files, making management easier and reducing the chance of inconsistencies.

---

## 7. What is the purpose of the `server_name` directive?

**Answer:**

The `server_name` directive tells Nginx which domain name or hostname a Server Block should respond to.

---

## 8. What is the purpose of the `/etc/hosts` file?

**Answer:**

The `/etc/hosts` file maps hostnames to IP addresses, allowing local hostname resolution without a DNS server.

---

## 9. What does `nginx -t` do?

**Answer:**

It tests the Nginx configuration for syntax errors before reloading or restarting the service.

---

## 10. Why do we reload Nginx instead of restarting it?

**Answer:**

Reloading applies configuration changes without interrupting active client connections, making it safer for production environments.

---

## 11. What is the purpose of the Host header in HTTP?

**Answer:**

The Host header identifies the requested website, allowing Nginx to select the correct Virtual Host when multiple sites share the same IP address.

---

## 12. How do you verify that Nginx is listening on port 80?

**Answer:**

Use:

```bash
ss -tulnp | grep nginx
```

---

## 13. How do you verify that Nginx is running?

**Answer:**

Use:

```bash
sudo systemctl status nginx
```

---

## 14. Which logs are useful for troubleshooting Nginx?

**Answer:**

- `/var/log/nginx/access.log`
- `/var/log/nginx/error.log`

---

## 15. What is the difference between a 403 Forbidden error and a 404 Not Found error?

**Answer:**

- **403 Forbidden:** The server found the resource but does not have permission to access it.
- **404 Not Found:** The requested resource or file does not exist.

---

# Commands Practiced Throughout the Project

```bash
mkdir
```

```bash
touch
```

```bash
nano
```

```bash
cp
```

```bash
mv
```

```bash
rm
```

```bash
cat
```

```bash
ls
```

```bash
pwd
```

```bash
cd
```

```bash
sudo
```

```bash
chmod
```

```bash
ln -s
```

```bash
systemctl
```

```bash
nginx -t
```

```bash
curl
```

```bash
ping
```

```bash
ss
```

```bash
ps
```

```bash
tail
```

---

# Final Conclusion

This project provided practical experience in configuring a **Multi-Site Nginx Environment** on Ubuntu Linux. You learned how to host multiple websites on a single server using Virtual Hosts, manage configurations with symbolic links, verify services, test websites using `curl` and browsers, and troubleshoot common issues. These are core Linux Administration and DevOps skills that are frequently required in real-world production environments and are valuable for Linux Administrator (L1) and DevOps Engineer interviews.

---

# ✅ Project Status

**Project:** Multi-Site Nginx Setup Using Virtual Hosts

**Status:** Successfully Completed

**Skills Covered:** Linux Administration, Nginx Configuration, Virtual Hosts, Service Management, Troubleshooting, HTTP, Host Header, File Permissions, and Web Server Deployment.