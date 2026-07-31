---

# Complete HTTP Request Flow in Nginx

At this stage, our project is fully configured.

We have:

- Created website directories.
- Added HTML pages.
- Configured Server Blocks.
- Enabled websites.
- Configured the `/etc/hosts` file.

Now let's understand what actually happens when a user opens:

```
http://site1.local
```

This is one of the most important concepts for Linux Administrators because it explains how Nginx serves the correct website when multiple websites are hosted on the same server.

---

# End-to-End Request Flow

The complete flow is:

```
User

↓

Browser

↓

Hostname Resolution

↓

127.0.0.1

↓

Port 80

↓

Nginx

↓

Server Block

↓

Document Root

↓

index.html

↓

Browser Displays Website
```

Every request follows these steps.

---

# Step 1 — User Types the Website Name

The user enters:

```
http://site1.local
```

inside the browser.

At this moment, the browser only knows the hostname.

It does **not** know:

- IP Address
- Server Location
- Website Files

The browser first needs to discover where the website exists.

---

# Step 2 — Browser Resolves the Hostname

The browser asks the operating system:

```
Where is site1.local?
```

Linux checks:

```
/etc/hosts
```

It finds:

```
127.0.0.1 site1.local
```

Now Linux knows:

```
site1.local

↓

127.0.0.1
```

---

# Step 3 — Browser Creates an HTTP Request

The browser now prepares an HTTP request.

Example:

```
GET / HTTP/1.1

Host: site1.local
```

Notice the second line.

```
Host:

site1.local
```

This is called the **Host Header**.

It is one of the most important HTTP headers when multiple websites are hosted on the same server.

---

# What is the Host Header?

The Host Header tells the web server:

```
Which website does the user want?
```

Example:

```
GET /

Host: site2.local
```

Nginx immediately understands:

```
User wants

site2.local
```

Without the Host Header, Nginx would not know which website should respond.

---

# Why is the Host Header Required?

Imagine one Linux server hosts:

```
site1.local

site2.local

site3.local
```

All websites share:

- Same IP Address
- Same Nginx Service
- Same HTTP Port (80)

Without the Host Header, every request would look identical.

Nginx would have no way to determine which website the user requested.

The Host Header solves this problem.

---

# Step 4 — Browser Sends the Request

The browser sends:

```
Destination IP

127.0.0.1
```

Destination Port:

```
80
```

Flow:

```
Browser

↓

127.0.0.1

↓

Port 80

↓

Nginx
```

The request has now reached the Nginx server.

---

# Step 5 — Nginx Accepts the Connection

Earlier we configured:

```nginx
listen 80;
```

This tells Nginx:

```
Accept HTTP requests on Port 80.
```

Since the request arrives on Port 80, Nginx accepts it.

---

# Step 6 — Nginx Reads the Host Header

Nginx now examines:

```
Host:

site1.local
```

It compares the Host Header with every configured Server Block.

Example:

```
Server Block 1

server_name site1.local;
```

```
Server Block 2

server_name site2.local;
```

```
Server Block 3

server_name site3.local;
```

Nginx searches until it finds a matching `server_name`.

---

# Step 7 — Matching the Correct Server Block

Suppose the request contains:

```
Host:

site2.local
```

Nginx checks:

```
site1.local

×

No Match
```

↓

```
site2.local

✓ Match Found
```

↓

```
Use This Configuration
```

The matching Server Block becomes responsible for handling the request.

---

# Step 8 — Reading the Document Root

Inside the selected Server Block:

```nginx
root /var/www/site2.local/html;
```

Nginx now knows:

```
Website Files

↓

/var/www/site2.local/html
```

It changes to that directory internally.

---

# Step 9 — Looking for the Home Page

Inside the Server Block:

```nginx
index index.html;
```

Nginx automatically searches for:

```
index.html
```

inside:

```
/var/www/site2.local/html
```

If the file exists:

```
Open File

↓

Read Contents

↓

Prepare HTTP Response
```

---

# Step 10 — Returning the Response

Nginx creates an HTTP Response.

Example:

```
HTTP/1.1 200 OK

Content-Type: text/html
```

Followed by the HTML page:

```html
<h1>Welcome to Site 2</h1>
```

The browser receives the response.

---

# Step 11 — Browser Displays the Website

Finally,

```
Browser

↓

Receives HTML

↓

Parses HTML

↓

Displays Website
```

The user now sees:

```
Welcome to Site 2
```

The request lifecycle is complete.

---

# Complete Flow Diagram

```
User

↓

Browser

↓

URL

↓

site2.local

↓

/etc/hosts

↓

127.0.0.1

↓

Port 80

↓

Nginx

↓

Reads Host Header

↓

Matches

server_name site2.local

↓

Document Root

↓

/var/www/site2.local/html

↓

index.html

↓

HTTP Response

↓

Browser

↓

Website Displayed
```

---

# Why Can One Server Host Multiple Websites?

Because every request contains a different Host Header.

Example:

```
Host: site1.local
```

↓

Server Block 1

---

```
Host: site2.local
```

↓

Server Block 2

---

```
Host: site3.local
```

↓

Server Block 3

The IP address remains the same.

Only the Host Header changes.

This allows one Nginx server to host hundreds or even thousands of websites.

---

# Verifying Using curl

We tested each website using:

```bash
curl http://site1.local
```

Purpose:

Sends an HTTP GET request to the first website.

---

```bash
curl http://site2.local
```

Purpose:

Verifies that the second Server Block is working correctly.

---

```bash
curl http://site3.local
```

Purpose:

Confirms that the third website is being served successfully.

---

# Testing Using the Host Header

Commands:

```bash
curl -H "Host: site1.local" http://127.0.0.1
```

```bash
curl -H "Host: site2.local" http://127.0.0.1
```

```bash
curl -H "Host: site3.local" http://127.0.0.1
```

---

# Why Use the `-H` Option?

The `-H` option allows us to manually send HTTP headers.

Syntax:

```bash
curl -H "Header: Value" URL
```

Example:

```bash
curl -H "Host: site1.local" http://127.0.0.1
```

Here:

- `-H` adds a custom HTTP header.
- `"Host: site1.local"` tells Nginx which virtual host to use.
- `http://127.0.0.1` sends the request to the local Nginx server.

This proves that **Nginx selects the website based on the Host Header**, not just the IP address.

---

# Project Progress

At this stage, we have successfully learned:

- The complete HTTP request lifecycle.
- How browsers resolve hostnames.
- The purpose of the Host Header.
- How Nginx matches `server_name`.
- How the Document Root is selected.
- How `index.html` is served.
- How to verify Virtual Hosts using `curl`.
- Why one server can host multiple websites using Nginx Virtual Hosts.

In the next section, we will focus on testing methods, troubleshooting common issues, and diagnosing configuration problems that Linux Administrators commonly encounter in production environments.