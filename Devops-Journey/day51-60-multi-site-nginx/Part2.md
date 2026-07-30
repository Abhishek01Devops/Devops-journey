---

# Creating Website Home Pages

A web server serves files to users when they visit a website.

The first file that Nginx looks for is usually:

```
index.html
```

This file is called the **default web page** or **home page**.

When a user visits:

```
http://site1.local
```

Nginx automatically searches for:

```
index.html
```

inside the configured document root.

If the file exists, Nginx sends it to the client's browser.

If the file does not exist, the user may receive a **403 Forbidden** or **404 Not Found** error depending on the server configuration.

---

# Creating Website Files

We created one HTML file for each website.

Example:

```bash
sudo nano /var/www/site1.local/html/index.html
```

Similarly,

```bash
sudo nano /var/www/site2.local/html/index.html
```

```bash
sudo nano /var/www/site3.local/html/index.html
```

---

# Why do we use `nano`?

`nano` is a terminal-based text editor available on most Linux systems.

It allows administrators to:

- Create configuration files
- Modify HTML pages
- Edit scripts
- Update system configuration

Syntax:

```bash
nano filename
```

Example:

```bash
nano index.html
```

---

# HTML Content

Each website contained different content.

Example:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Site 1</title>
</head>

<body>

<h1>Welcome to Site 1</h1>

<p>This website is hosted using Nginx Virtual Host.</p>

</body>

</html>
```

Each website had different titles and messages so we could easily identify which server block was serving the request.

---

# Why Different HTML Pages?

Suppose every website contained the exact same page.

When testing,

```
site1.local

site2.local

site3.local
```

would all appear identical.

You would not know whether Nginx was selecting the correct Virtual Host.

Using different HTML content verifies that every server block is working independently.

---

# Understanding Document Root

One of the most important concepts in Nginx is the **Document Root**.

Document Root means:

> The directory from which Nginx serves website files.

Example:

```
Document Root

↓

/var/www/site1.local/html
```

When a client requests

```
http://site1.local
```

Nginx performs the following steps:

```
Browser

↓

site1.local

↓

Server Block

↓

root /var/www/site1.local/html;

↓

Looks for

index.html

↓

Returns page
```

The same process occurs for every website.

---

# Website Mapping

```
site1.local

↓

/var/www/site1.local/html

↓

index.html
```

---

```
site2.local

↓

/var/www/site2.local/html

↓

index.html
```

---

```
site3.local

↓

/var/www/site3.local/html

↓

index.html
```

Every website has an independent document root.

This separation is important because changes made to one website do not affect the others.

---

# Checking File Permissions

Command:

```bash
ls -l /var/www/site1.local/html
```

Example Output

```
-rw-r--r-- 1 root root index.html
```

---

# Why is `ls -l` used?

The `-l` option displays detailed information about files.

It shows:

- Permissions
- Owner
- Group
- File Size
- Modification Date
- File Name

Without proper permissions, Nginx cannot read website files.

---

# Understanding Linux File Permissions

Example:

```
-rw-r--r--
```

Breakdown:

```
-

Regular File

rw-

Owner Permissions

r--

Group Permissions

r--

Others Permissions
```

Permission meanings:

```
r

Read
```

Allows opening and reading a file.

---

```
w

Write
```

Allows modifying a file.

---

```
x

Execute
```

Allows executing a file or entering a directory.

---

Permission Summary

```
Owner

Read

Write
```

```
Group

Read
```

```
Others

Read
```

This permission set allows Nginx to read the website content while preventing unauthorized modification by other users.

---

# Why are Correct Permissions Important?

Nginx runs as a non-root user (commonly `www-data` on Ubuntu).

When a request arrives, Nginx attempts to read:

```
index.html
```

If it cannot access the file because of incorrect permissions, the user receives:

```
403 Forbidden
```

Therefore, every document root and website file must be readable by the Nginx worker process.

---

# Checking Which User Runs Nginx

Command:

```bash
ps aux | grep nginx
```

Example Output:

```
www-data
```

This shows that Nginx worker processes run under the `www-data` user account.

This user must have read access to the website files and execute permission on the directories.

---

# Why Doesn't Nginx Run as Root?

Although the master Nginx process starts with root privileges, worker processes run as an unprivileged user such as `www-data`.

This improves security because:

- A compromised website has limited access.
- The web server cannot modify critical system files.
- The impact of vulnerabilities is reduced.

Running network services with the least required privileges is a standard Linux security practice.

---

# Project Progress

At this stage, we have successfully:

- Created three website directories.
- Created three HTML home pages.
- Learned what a Document Root is.
- Verified Linux file permissions.
- Understood why Nginx needs read access.
- Confirmed the user account that runs Nginx.

In the next section, we will configure **Nginx Server Blocks (Virtual Hosts)** and learn how Nginx decides which website to serve based on the requested domain name.