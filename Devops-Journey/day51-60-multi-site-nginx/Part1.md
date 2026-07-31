# Day 51–60 — Deploy Multi-Site Nginx Setup

## Project Overview

### Objective

The objective of this project is to learn how to host multiple websites on a single Linux server using the Nginx web server.

Instead of running one web server for every website, Nginx allows multiple websites to share the same server by using **Virtual Hosts**, also called **Server Blocks**.

This is one of the most common configurations used in production environments because it reduces infrastructure cost while efficiently utilizing server resources.

---

# What We Built

In this project we hosted three different websites on a single Ubuntu server.

```
Website 1
site1.local

Website 2
site2.local

Website 3
site3.local
```

Although all three websites run on the same server and the same Nginx service, each website has:

- Its own document root
- Its own HTML files
- Its own configuration file
- Its own server name

Nginx decides which website to display by checking the **Host** header in every incoming HTTP request.

---

# Skills Learned

After completing this project, you will understand:

- Installing and managing Nginx
- Hosting multiple websites
- Virtual Hosts (Server Blocks)
- Linux directory structure
- Document Root
- HTTP Host Header
- Local DNS using `/etc/hosts`
- Nginx configuration files
- Symbolic links
- Configuration validation
- Reloading services safely
- Testing websites using `curl`
- Troubleshooting Nginx configurations

---

# Lab Environment

Operating System

```
Ubuntu Linux
```

Web Server

```
Nginx
```

Configuration Directory

```
/etc/nginx/
```

Website Root Directory

```
/var/www/
```

Testing Tool

```
curl
```

Service Manager

```
systemctl
```

---

# Project Architecture

```
                      Browser / curl
                             │
                             │
                      HTTP Request
                             │
                             ▼
                     +----------------+
                     |     Nginx      |
                     +----------------+
                      │      │      │
        ┌─────────────┘      │      └──────────────┐
        ▼                    ▼                     ▼

 server_name          server_name           server_name
 site1.local          site2.local           site3.local

        │                    │                     │

        ▼                    ▼                     ▼

/var/www/site1      /var/www/site2      /var/www/site3

        │                    │                     │

        ▼                    ▼                     ▼

 index.html          index.html          index.html
```

---

# Why Do Companies Use Multi-Site Hosting?

Imagine a company owns these domains:

```
company.com

blog.company.com

support.company.com

careers.company.com
```

Instead of purchasing four different servers, the company can host all websites on one Linux server.

Benefits:

- Lower infrastructure cost
- Easier maintenance
- Better resource utilization
- Centralized management
- Faster deployments

This is exactly what we implemented in this project.

---

# Linux Directory Structure Used

The main directory used for website files is:

```bash
/var/www/
```

Why?

Linux follows the Filesystem Hierarchy Standard (FHS).

According to this standard:

```
/var
```

stores variable application data.

Inside `/var`:

```
/var/www
```

is the conventional location for web content.

---

# Creating Website Directories

Command:

```bash
sudo mkdir -p /var/www/site1.local/html
sudo mkdir -p /var/www/site2.local/html
sudo mkdir -p /var/www/site3.local/html
```

## Why is `mkdir` used?

`mkdir` creates new directories in Linux.

Without these directories, Nginx would have no location from which to serve website files.

---

## Why is `-p` used?

The `-p` option tells `mkdir` to create parent directories if they do not already exist.

Example:

```
/var/www/site1.local/html
```

If `site1.local` does not exist, Linux automatically creates:

```
site1.local
```

and then:

```
html
```

Without `-p`, the command would fail if the parent directory did not exist.

---

After running the command, the directory structure becomes:

```
/var/www/

├── site1.local
│      └── html
│
├── site2.local
│      └── html
│
└── site3.local
       └── html
```

Each website now has its own dedicated document root.

---

# Verifying Directory Creation

Command:

```bash
ls -R /var/www/
```

## Why do we use `ls`?

`ls` lists files and directories.

---

## What does `-R` mean?

`-R` stands for **Recursive**.

Instead of listing only `/var/www`, Linux recursively displays every subdirectory and file.

This makes it easy to verify that all website directories were created correctly.

Example output:

```
/var/www/

site1.local
site2.local
site3.local

site1.local/html
site2.local/html
site3.local/html
```

At this stage, the directories exist but contain no website content.

In the next section, we will create custom `index.html` files for each website and understand how Nginx uses the **Document Root** to serve web pages.