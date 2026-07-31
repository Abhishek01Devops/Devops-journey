---

# Enabling Websites Using Symbolic Links

At this stage, we have completed the following tasks:

- Created website directories.
- Added HTML files.
- Created Server Block configuration files.

However, Nginx still does not use these configuration files automatically.

Why?

Because Nginx only loads configuration files that exist inside the following directory:

```bash
/etc/nginx/sites-enabled/
```

Our configuration files currently exist in:

```bash
/etc/nginx/sites-available/
```

To activate a website, we must create a **Symbolic Link** from `sites-available` to `sites-enabled`.

---

# What is a Symbolic Link?

A Symbolic Link (Soft Link) is a special file that points to another file or directory.

Think of it like a shortcut in Windows.

```
Original File

↓

sites-available/site1.local

↓

Shortcut

↓

sites-enabled/site1.local
```

The shortcut does not contain the configuration.

Instead, it simply points to the original file.

---

# Why Does Nginx Use Symbolic Links?

Imagine a server hosting 100 websites.

All configurations exist inside:

```
/etc/nginx/sites-available/
```

Only 60 websites are currently active.

Instead of deleting the other 40 configuration files, administrators simply remove their symbolic links.

This provides several advantages:

- Easy website management.
- Safe configuration storage.
- Quickly enable or disable websites.
- No need to recreate configuration files.

This is why Ubuntu's Nginx package uses `sites-available` and `sites-enabled`.

---

# Creating Symbolic Links

Command:

```bash
sudo ln -s /etc/nginx/sites-available/site1.local /etc/nginx/sites-enabled/
```

Similarly,

```bash
sudo ln -s /etc/nginx/sites-available/site2.local /etc/nginx/sites-enabled/
```

```bash
sudo ln -s /etc/nginx/sites-available/site3.local /etc/nginx/sites-enabled/
```

---

# Understanding the Command

Syntax:

```bash
ln -s SOURCE DESTINATION
```

Example:

```bash
sudo ln -s /etc/nginx/sites-available/site1.local /etc/nginx/sites-enabled/
```

---

# Why is `ln` Used?

`ln` creates links between files.

Linux supports two types of links:

- Hard Link
- Symbolic Link (Soft Link)

For Nginx, we use **Symbolic Links**.

---

# Why is `-s` Used?

The `-s` option creates a **Soft Link** (Symbolic Link).

Without `-s`, Linux creates a Hard Link.

Hard Links are generally not used for Nginx configuration because:

- They cannot link directories.
- They are less flexible.
- They do not clearly indicate that a file is merely a reference.

Symbolic Links are easier to manage and are the standard practice.

---

# Verifying Symbolic Links

Command:

```bash
ls -l /etc/nginx/sites-enabled
```

Example Output:

```
site1.local -> /etc/nginx/sites-available/site1.local

site2.local -> /etc/nginx/sites-available/site2.local

site3.local -> /etc/nginx/sites-available/site3.local
```

---

# Why Do We Use `ls -l`?

The `-l` option displays detailed information.

For symbolic links, it also shows:

```
Source

↓

Destination
```

The arrow (`->`) indicates that the file is a symbolic link.

Example:

```
site1.local

↓

/etc/nginx/sites-available/site1.local
```

This confirms that the website has been enabled.

---

# Configuration Flow

```
Administrator

↓

Creates Configuration

↓

/etc/nginx/sites-available/

↓

Creates Symbolic Link

↓

/etc/nginx/sites-enabled/

↓

Nginx Reads Configuration

↓

Website Becomes Active
```

---

# Testing Nginx Configuration

After making configuration changes, we should always test the configuration before reloading the service.

Command:

```bash
sudo nginx -t
```

Example Output:

```
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok

nginx: configuration file /etc/nginx/nginx.conf test is successful
```

---

# Why Do We Use `nginx -t`?

The `-t` option tells Nginx to test the configuration files without starting or reloading the service.

It checks:

- Syntax errors
- Missing semicolons
- Missing braces
- Invalid directives
- Duplicate configuration
- Missing files
- Incorrect includes

If any error exists, Nginx displays the file name and line number.

This allows administrators to fix problems before affecting production traffic.

---

# Why Should We Never Skip `nginx -t`?

Imagine updating a production web server.

If you reload Nginx without testing the configuration:

```
Configuration Error

↓

Reload

↓

Nginx Fails

↓

Website Goes Offline
```

Running `nginx -t` first helps prevent unnecessary downtime.

Testing the configuration is considered a best practice before every reload.

---

# Reloading Nginx

Command:

```bash
sudo systemctl reload nginx
```

---

# Why Do We Use `reload` Instead of `restart`?

`reload` tells Nginx to:

- Re-read configuration files.
- Apply configuration changes.
- Keep existing client connections active.

Flow:

```
Configuration Updated

↓

Reload

↓

Workers Receive New Configuration

↓

New Requests Use Updated Settings

↓

Existing Connections Continue
```

This minimizes disruption for users.

---

# Reload vs Restart

Reload

- Reads new configuration.
- Does not stop the service.
- Existing connections remain active.
- Preferred for configuration changes.

Restart

- Stops the service.
- Starts the service again.
- Existing client connections are interrupted.
- Usually used after upgrades or when troubleshooting.

In production environments, administrators generally prefer `reload` whenever possible.

---

# Checking Service Status

Command:

```bash
sudo systemctl status nginx
```

Purpose:

This command displays the current state of the Nginx service.

Important information includes:

- Active status
- Running state
- Main Process ID (PID)
- Worker Processes
- Memory usage
- CPU usage
- Recent log messages

Example:

```
Active: active (running)
```

This confirms that Nginx is running successfully.

---

# Understanding the Output

Example:

```
Loaded
```

Indicates whether the service is installed and enabled.

---

```
Active
```

Shows whether the service is:

- active
- inactive
- failed

---

```
Main PID
```

Displays the Process ID of the Nginx master process.

---

```
Tasks
```

Shows the number of worker processes currently running.

---

```
Memory
```

Displays current memory consumption.

---

```
CPU
```

Shows the amount of CPU time consumed.

---

# Project Progress

At this stage, we have successfully:

- Enabled all three websites using symbolic links.
- Learned why Nginx uses `sites-enabled`.
- Understood the purpose of symbolic links.
- Verified symbolic links using `ls -l`.
- Tested the configuration using `nginx -t`.
- Reloaded Nginx safely using `systemctl reload nginx`.
- Verified the service status using `systemctl status nginx`.

Our server is now correctly configured and ready to serve multiple websites.

In the next section, we will learn how `/etc/hosts` works, why we added `site1.local`, `site2.local`, and `site3.local`, and how the browser resolves these names before sending requests to Nginx.