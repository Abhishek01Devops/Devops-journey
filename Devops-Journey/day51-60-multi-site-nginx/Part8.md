---

# Common Nginx Errors and Troubleshooting

Configuring an Nginx web server is only part of a Linux Administrator's job.

In real production environments, websites may stop working due to configuration mistakes, incorrect permissions, missing files, or service failures.

A Linux Administrator must know how to identify the problem, understand why it occurred, and fix it quickly.

This section covers the most common Nginx issues and the commands used to troubleshoot them.

---

# Troubleshooting Approach

Whenever a website does not load, follow this order:

```
Website Not Working

↓

Check Nginx Status

↓

Check Configuration

↓

Check Website Files

↓

Check File Permissions

↓

Check Hosts/DNS

↓

Check Logs

↓

Fix the Issue

↓

Reload Nginx

↓

Test Again
```

Following a structured approach helps identify problems quickly and avoids unnecessary changes.

---

# Error 1 — 403 Forbidden

## What is a 403 Forbidden Error?

A **403 Forbidden** error means that Nginx received the request, but it is **not allowed to access the requested file or directory**.

Example:

```
403 Forbidden
```

---

## Common Causes

- Incorrect file permissions.
- Incorrect directory permissions.
- Wrong ownership.
- Missing read permissions for the Nginx user (`www-data`).
- Directory listing disabled with no `index.html`.

---

## Check File Permissions

Command:

```bash
ls -l /var/www/site1.local/html
```

Purpose:

Displays the permissions and ownership of the website files.

Example:

```
-rw-r--r-- 1 devops devops index.html
```

The Nginx user (`www-data`) must have permission to read the file.

---

## Check Directory Permissions

Command:

```bash
ls -ld /var/www/site1.local/html
```

Purpose:

Checks whether Nginx has permission to enter the directory.

Directories require the **execute (`x`) permission** to be accessible.

---

## Fix Permissions

Command:

```bash
sudo chmod 755 /var/www/site1.local/html
```

Purpose:

Allows:

- Owner → Read, Write, Execute
- Group → Read, Execute
- Others → Read, Execute

---

## Fix File Permissions

Command:

```bash
sudo chmod 644 /var/www/site1.local/html/index.html
```

Purpose:

Allows everyone to read the HTML file while only the owner can modify it.

---

# Error 2 — 404 Not Found

## What is a 404 Error?

A **404 Not Found** error means:

Nginx is working correctly, but it **cannot find the requested file**.

Example:

```
404 Not Found
```

---

## Common Causes

- Missing `index.html`
- Incorrect document root
- Wrong file name
- Wrong path in the Server Block

---

## Verify the Website Files

Command:

```bash
ls -R /var/www/site1.local/html
```

Purpose:

Lists all files inside the document root.

Make sure `index.html` exists.

---

## Verify the Document Root

Command:

```bash
cat /etc/nginx/sites-available/site1.local
```

Purpose:

Checks whether the `root` directive points to the correct directory.

Example:

```nginx
root /var/www/site1.local/html;
```

---

# Error 3 — 502 Bad Gateway

## What is a 502 Error?

A **502 Bad Gateway** error usually occurs when Nginx is acting as a **reverse proxy**, but the backend application is not responding.

Example:

```
502 Bad Gateway
```

Although this project does not use a reverse proxy, Linux Administrators commonly encounter this error in production environments.

Common causes:

- Backend service stopped.
- Wrong proxy configuration.
- Backend listening on the wrong port.

---

# Error 4 — Nginx Configuration Error

Suppose you accidentally forget a semicolon.

Example:

```nginx
listen 80
```

Instead of:

```nginx
listen 80;
```

Reloading Nginx will fail.

---

## Check the Configuration

Command:

```bash
sudo nginx -t
```

Purpose:

Checks the configuration before applying changes.

Example Output:

```
syntax is ok

test is successful
```

If there is an error, Nginx displays the file name and line number that needs correction.

---

# Error 5 — Website Not Loading

Suppose the browser cannot open:

```
http://site1.local
```

Possible causes include:

- Nginx service stopped.
- Incorrect Hosts file.
- Missing Virtual Host.
- Wrong configuration.
- Firewall blocking port 80.

---

## Check the Service

Command:

```bash
sudo systemctl status nginx
```

Purpose:

Verifies whether Nginx is running.

Expected Output:

```
Active: active (running)
```

---

# Error 6 — Virtual Host Not Working

Suppose every hostname opens the same website.

Example:

```
site1.local

↓

Site 1
```

```
site2.local

↓

Still Site 1
```

Possible causes:

- Missing symbolic link.
- Incorrect `server_name`.
- Wrong Hosts file.

---

## Verify Enabled Sites

Command:

```bash
ls -l /etc/nginx/sites-enabled
```

Purpose:

Checks whether all Virtual Host configuration files are enabled using symbolic links.

---

# Error 7 — Hostname Resolution Failure

Suppose:

```
http://site1.local
```

cannot be resolved.

Possible causes:

- Missing entry in `/etc/hosts`.
- Typographical error.
- Wrong IP address.

---

## Verify Hosts File

Command:

```bash
cat /etc/hosts
```

Expected:

```
127.0.0.1 site1.local
127.0.0.1 site2.local
127.0.0.1 site3.local
```

---

## Test Hostname Resolution

Command:

```bash
ping site1.local
```

Purpose:

Confirms that Linux translates the hostname into the correct IP address.

---

# Checking Nginx Logs

Logs are one of the most valuable troubleshooting tools.

Nginx records:

- Startup messages.
- Configuration problems.
- Access requests.
- Errors.

---

## View Error Log

Command:

```bash
sudo tail -f /var/log/nginx/error.log
```

### Why is this command used?

- `tail` displays the last lines of a file.
- `-f` continuously monitors the log for new entries.

Purpose:

View errors in real time while testing the website.

---

## View Access Log

Command:

```bash
sudo tail -f /var/log/nginx/access.log
```

Purpose:

Displays every HTTP request received by Nginx.

Useful for confirming that requests are reaching the server.

---

# Reload Nginx After Fixes

Command:

```bash
sudo systemctl reload nginx
```

Purpose:

Applies configuration changes without stopping the Nginx service.

Always test the configuration first with:

```bash
sudo nginx -t
```

---

# Final Verification

After fixing an issue:

```bash
curl http://site1.local
```

```bash
curl http://site2.local
```

```bash
curl http://site3.local
```

Each command should return the correct HTML page.

Also verify in a web browser:

```
http://site1.local
```

```
http://site2.local
```

```
http://site3.local
```

---

# Troubleshooting Checklist

Whenever a website is not working, follow this checklist:

- Check the Nginx service status.
- Test the Nginx configuration.
- Verify the Virtual Host configuration.
- Confirm the symbolic links.
- Check the document root.
- Verify that `index.html` exists.
- Check file and directory permissions.
- Verify the `/etc/hosts` file.
- Test hostname resolution with `ping`.
- Review the Nginx error log.
- Review the Nginx access log.
- Reload Nginx after making changes.
- Test the website again using `curl` and a web browser.

---

# Commands Learned in This Section

```bash
sudo systemctl status nginx
```

Checks whether the Nginx service is running.

---

```bash
sudo nginx -t
```

Tests the Nginx configuration for syntax errors.

---

```bash
ls -l /var/www/site1.local/html
```

Displays file permissions and ownership.

---

```bash
ls -ld /var/www/site1.local/html
```

Displays directory permissions.

---

```bash
sudo chmod 755 /var/www/site1.local/html
```

Sets the correct permissions for the website directory.

---

```bash
sudo chmod 644 /var/www/site1.local/html/index.html
```

Sets the correct permissions for the HTML file.

---

```bash
cat /etc/nginx/sites-available/site1.local
```

Displays the Virtual Host configuration.

---

```bash
ls -l /etc/nginx/sites-enabled
```

Lists enabled Virtual Hosts.

---

```bash
cat /etc/hosts
```

Displays hostname-to-IP mappings.

---

```bash
ping site1.local
```

Tests hostname resolution.

---

```bash
sudo tail -f /var/log/nginx/error.log
```

Monitors the Nginx error log in real time.

---

```bash
sudo tail -f /var/log/nginx/access.log
```

Monitors incoming HTTP requests.

---

```bash
sudo systemctl reload nginx
```

Reloads the Nginx configuration without stopping the service.

---

```bash
curl http://site1.local
```

Verifies that the website is accessible.

---

# Project Status

At this stage, you have completed a real-world **Multi-Site Nginx Virtual Host Project**. You learned how to configure multiple websites, understand request routing using the **Host** header, verify configurations, and troubleshoot common production issues. These are practical Linux Administration and DevOps skills used in real server environments.