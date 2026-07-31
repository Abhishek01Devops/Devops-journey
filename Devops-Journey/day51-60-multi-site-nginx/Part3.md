---

# Configuring Nginx Server Blocks (Virtual Hosts)

Until now, we have created the website directories and added the HTML files.

However, Nginx still does not know:

- Which website belongs to which domain.
- Where each website's files are stored.
- Which configuration should be used when a client requests a specific website.

To solve this problem, Nginx uses **Server Blocks**, also known as **Virtual Hosts**.

A Server Block is simply a configuration file that tells Nginx how to handle requests for a particular website.

Each website has its own Server Block configuration.

Example:

```
site1.local
↓

Server Block

↓

/var/www/site1.local/html
```

```
site2.local
↓

Server Block

↓

/var/www/site2.local/html
```

```
site3.local
↓

Server Block

↓

/var/www/site3.local/html
```

---

# Why Do We Need Server Blocks?

Imagine a company owns these websites:

```
company.com

blog.company.com

support.company.com
```

All of these websites may run on the same Linux server.

When a browser sends a request, Nginx needs a way to determine which website should respond.

Server Blocks provide this information.

Without Server Blocks:

- Nginx would not know which website to display.
- Multiple websites could not be hosted on the same server.
- Every website would require a separate server.

Server Blocks make it possible to host many websites using one Nginx service.

---

# Nginx Configuration Directory

The Nginx configuration files are stored in:

```bash
/etc/nginx/
```

Important directories:

```
/etc/nginx/

├── nginx.conf
├── sites-available/
└── sites-enabled/
```

---

# Understanding nginx.conf

The main configuration file is:

```bash
/etc/nginx/nginx.conf
```

This file contains the global Nginx configuration.

It defines:

- Worker processes
- Logging
- Performance settings
- HTTP configuration
- Includes Server Block files

Normally, we do not create Virtual Hosts directly inside this file.

Instead, Nginx loads configuration files from:

```
sites-enabled
```

using the following line inside `nginx.conf`:

```nginx
include /etc/nginx/sites-enabled/*;
```

This tells Nginx to read every enabled Server Block automatically.

---

# sites-available

Directory:

```bash
/etc/nginx/sites-available/
```

Purpose:

This directory stores **all available website configurations**.

Think of it as a storage location.

A website configuration placed here is **not active** until it is enabled.

In this project we created:

```
site1.local

site2.local

site3.local
```

---

# sites-enabled

Directory:

```bash
/etc/nginx/sites-enabled/
```

Purpose:

This directory contains only the websites that Nginx should actually load.

Nginx reads this directory every time it starts or reloads.

Only configuration files present here become active.

---

# Why Are These Two Directories Separate?

Separating configuration files provides flexibility.

For example:

```
sites-available

Contains:

Website A

Website B

Website C
```

```
sites-enabled

Contains:

Website A

Website C
```

In this example:

Website B exists but is currently disabled.

There is no need to delete its configuration.

Removing or creating the symbolic link instantly disables or enables the website.

This is much safer than deleting configuration files.

---

# Creating the Server Block

We created a configuration file for every website.

Example:

```bash
sudo nano /etc/nginx/sites-available/site1.local
```

Similarly,

```bash
sudo nano /etc/nginx/sites-available/site2.local
```

```bash
sudo nano /etc/nginx/sites-available/site3.local
```

---

# Server Block Configuration

Example:

```nginx
server {

    listen 80;

    server_name site1.local;

    root /var/www/site1.local/html;

    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

}
```

Every line inside this file has a specific purpose.

Let's understand each directive.

---

# server { }

```
server {

}
```

The `server` block groups together all configuration related to one website.

Everything inside these braces belongs only to that particular website.

Each website requires its own server block.

---

# listen 80;

```
listen 80;
```

Purpose:

This tells Nginx which network port should accept incoming requests.

Port:

```
80
```

is the default HTTP port.

Flow:

```
Browser

↓

http://site1.local

↓

Port 80

↓

Nginx
```

If the request arrives on port 80, this Server Block becomes eligible to handle it.

---

# server_name

Example:

```nginx
server_name site1.local;
```

This is one of the most important directives.

Purpose:

It tells Nginx which domain name belongs to this Server Block.

When the browser sends:

```
Host: site1.local
```

Nginx searches every Server Block.

When it finds:

```
server_name site1.local;
```

it selects that configuration.

Without `server_name`, Nginx cannot determine which website should respond.

---

# root

Example:

```nginx
root /var/www/site1.local/html;
```

Purpose:

This tells Nginx where the website files are stored.

This directory is called the **Document Root**.

Flow:

```
Browser

↓

site1.local

↓

Server Block

↓

root

↓

/var/www/site1.local/html
```

Everything served to the client comes from this directory.

---

# index

Example:

```nginx
index index.html;
```

Purpose:

When the browser requests:

```
http://site1.local/
```

the URL does not specify a file.

Nginx automatically searches for:

```
index.html
```

inside the document root.

If found, it is returned to the browser.

Without the `index` directive, users might receive a directory listing or an error depending on the configuration.

---

# location

Example:

```nginx
location / {

}
```

The `location` block defines how Nginx should process requests for a specific URL path.

The slash (`/`) represents the root of the website.

This means the configuration applies to every request under the website unless another, more specific `location` block matches.

---

# try_files

Example:

```nginx
try_files $uri $uri/ =404;
```

Purpose:

This directive tells Nginx to check whether the requested resource actually exists.

It checks in this order:

1. Exact file (`$uri`)
2. Directory (`$uri/`)
3. If neither exists, return **404 Not Found**

Example:

User requests:

```
http://site1.local/about.html
```

Nginx checks:

```
/var/www/site1.local/html/about.html
```

If the file exists, it is served.

If it does not exist, Nginx immediately returns:

```
404 Not Found
```

This prevents invalid requests from being served and improves security.

---

# Project Progress

At this stage we have successfully:

- Learned what a Server Block is.
- Understood why Virtual Hosts are required.
- Explored the Nginx configuration directory.
- Learned the difference between `sites-available` and `sites-enabled`.
- Created separate configuration files for each website.
- Understood every important Nginx directive:
  - `server`
  - `listen`
  - `server_name`
  - `root`
  - `index`
  - `location`
  - `try_files`

In the next section, we will enable the websites using symbolic links (`ln -s`), understand why symbolic links are preferred over copying files, test the Nginx configuration using `nginx -t`, and safely reload the Nginx service.