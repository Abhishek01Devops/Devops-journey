---

# Testing and Verifying the Multi-Site Nginx Setup

After configuring a web server, the job is not complete.

A Linux Administrator must verify that every website is working correctly before handing the server over to users.

Testing helps us confirm that:

- Nginx is running.
- Configuration is correct.
- Websites are accessible.
- DNS or Hosts file resolution works.
- The correct Server Block is selected.
- The correct HTML page is returned.

Testing is an essential part of system administration because even a small configuration mistake can make a website unavailable.

---

# Why Do We Test?

Suppose we configure three websites.

```
site1.local

site2.local

site3.local
```

If we never test them, we cannot confirm:

- Whether Nginx is reading the configuration.
- Whether the correct document root is used.
- Whether the Host Header is working.
- Whether users can actually access the websites.

Testing ensures the configuration works exactly as expected.

---

# Test 1 — Verify Nginx Service

Command:

```bash
sudo systemctl status nginx
```

## Why is this command used?

Before testing websites, we first verify that the Nginx service is running.

If the service is stopped, no website will be accessible.

Example Output:

```
Active: active (running)
```

This confirms that:

- Nginx is installed.
- The service is running.
- Worker processes are active.

If you see:

```
inactive
```

or

```
failed
```

the websites will not load.

---

# Test 2 — Verify Nginx Configuration

Command:

```bash
sudo nginx -t
```

Purpose:

Checks the configuration for:

- Syntax errors
- Missing braces
- Missing semicolons
- Invalid directives
- Missing include files

Example:

```
syntax is ok

test is successful
```

Only after receiving this message should we reload Nginx.

---

# Test 3 — Verify Enabled Websites

Command:

```bash
ls -l /etc/nginx/sites-enabled
```

Purpose:

Displays all active Virtual Hosts.

Example:

```
site1.local

site2.local

site3.local
```

Each file should point to its configuration inside:

```
sites-available
```

This confirms that all websites are enabled.

---

# Test 4 — Verify Document Roots

Command:

```bash
ls -R /var/www/
```

Purpose:

Displays every website directory recursively.

Expected Structure:

```
/var/www/

site1.local

site2.local

site3.local
```

Each website should contain:

```
html

↓

index.html
```

If the HTML file is missing, Nginx cannot serve the website.

---

# Test 5 — Verify HTML Files

Command:

```bash
cat /var/www/site1.local/html/index.html
```

Purpose:

Displays the website content.

This helps verify that:

- The file exists.
- HTML is correct.
- The expected page will be served.

Repeat for:

```bash
cat /var/www/site2.local/html/index.html
```

```bash
cat /var/www/site3.local/html/index.html
```

---

# Test 6 — Verify Hostname Resolution

Command:

```bash
ping site1.local
```

Purpose:

Checks whether Linux resolves:

```
site1.local

↓

127.0.0.1
```

Example:

```
PING site1.local (127.0.0.1)
```

This confirms that `/etc/hosts` is configured correctly.

---

# Test 7 — Access Website Using curl

Command:

```bash
curl http://site1.local
```

Purpose:

Sends an HTTP GET request to the website.

Expected Result:

```
Welcome to Site 1
```

Repeat for:

```bash
curl http://site2.local
```

Expected:

```
Welcome to Site 2
```

Repeat:

```bash
curl http://site3.local
```

Expected:

```
Welcome to Site 3
```

This confirms that each Virtual Host serves the correct HTML page.

---

# Test 8 — Verify Host Header

Command:

```bash
curl -H "Host: site1.local" http://127.0.0.1
```

## Why is this test important?

Instead of using DNS or the Hosts file, we manually send the HTTP Host Header.

This proves that Nginx selects the correct Server Block based on:

```
Host Header
```

and not simply the IP address.

Repeat:

```bash
curl -H "Host: site2.local" http://127.0.0.1
```

```bash
curl -H "Host: site3.local" http://127.0.0.1
```

Each command should display the correct website.

---

# Test 9 — Browser Testing

Open your browser.

Visit:

```
http://site1.local
```

Expected Page:

```
Welcome to Site 1
```

Next:

```
http://site2.local
```

Expected:

```
Welcome to Site 2
```

Finally:

```
http://site3.local
```

Expected:

```
Welcome to Site 3
```

If all three pages load successfully, the Virtual Host configuration is working correctly.

---

# Test 10 — Verify Listening Port

Command:

```bash
ss -tulnp | grep nginx
```

## Why is this command used?

The `ss` command displays network sockets.

It helps verify:

- Whether Nginx is listening.
- Which port is open.
- Which process owns the port.

Expected Output:

```
*:80
```

This confirms that Nginx is listening for HTTP requests on port 80.

---

# Test 11 — Verify Running Processes

Command:

```bash
ps aux | grep nginx
```

Purpose:

Displays the Nginx processes.

Expected Output:

```
Master Process

Worker Process

Worker Process
```

This confirms that Nginx has started successfully.

---

# Complete Testing Flow

```
Configuration Completed

↓

nginx -t

↓

Reload Nginx

↓

Check Status

↓

Verify Virtual Hosts

↓

Verify Document Roots

↓

Verify HTML Files

↓

Verify Hostname Resolution

↓

Test Using curl

↓

Test Using Browser

↓

Project Successfully Verified
```

---

# Commands Used During Testing

```bash
sudo nginx -t
```

Tests the Nginx configuration.

---

```bash
sudo systemctl reload nginx
```

Reloads Nginx without interrupting existing connections.

---

```bash
sudo systemctl status nginx
```

Checks the current status of the Nginx service.

---

```bash
ls -l /etc/nginx/sites-enabled
```

Lists enabled Virtual Hosts.

---

```bash
ls -R /var/www/
```

Displays the website directory structure.

---

```bash
cat /etc/hosts
```

Verifies hostname mappings.

---

```bash
ping site1.local
```

Checks hostname resolution.

---

```bash
curl http://site1.local
```

Tests website accessibility.

---

```bash
curl -H "Host: site1.local" http://127.0.0.1
```

Tests Virtual Host selection using the HTTP Host Header.

---

```bash
ss -tulnp | grep nginx
```

Verifies that Nginx is listening on port 80.

---

```bash
ps aux | grep nginx
```

Displays the running Nginx processes.

---

# Project Progress

At this stage, we have successfully verified:

- Nginx service status.
- Configuration syntax.
- Enabled Virtual Hosts.
- Website directory structure.
- HTML files.
- Hostname resolution.
- HTTP responses using `curl`.
- Browser accessibility.
- HTTP Host Header behavior.
- Listening network ports.
- Running Nginx processes.

The project has now been fully tested and validated.

In the next section, we will learn how to troubleshoot common Nginx problems such as **403 Forbidden**, **404 Not Found**, broken symbolic links, permission issues, and configuration errors that Linux Administrators frequently encounter in production.