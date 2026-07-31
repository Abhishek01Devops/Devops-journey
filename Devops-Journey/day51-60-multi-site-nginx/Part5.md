---

# Understanding the `/etc/hosts` File

At this stage, Nginx is fully configured and all three websites are enabled.

However, there is one important question:

When we type:

```
http://site1.local
```

How does Linux know where `site1.local` is located?

The answer is the **`/etc/hosts`** file.

The `/etc/hosts` file is a local hostname-to-IP mapping file.

It allows Linux to translate a hostname into an IP address without contacting a DNS server.

---

# What is a Hostname?

A hostname is a human-readable name assigned to a computer or website.

Examples:

```
google.com

github.com

amazon.com

site1.local
```

Humans remember names more easily than IP addresses.

Instead of remembering:

```
142.250.193.78
```

we simply type:

```
google.com
```

The operating system converts the hostname into an IP address before sending the request.

---

# What is DNS?

DNS stands for:

```
Domain Name System
```

DNS is often called the **Internet's Phone Book**.

Its job is to convert:

```
Hostname

↓

IP Address
```

Example:

```
google.com

↓

142.250.xxx.xxx
```

Without DNS, users would have to remember numerical IP addresses for every website.

---

# Why Didn't We Use DNS?

Our websites are:

```
site1.local

site2.local

site3.local
```

These are not registered public domain names.

No public DNS server knows about them.

Therefore, we manually created local mappings using:

```
/etc/hosts
```

---

# Location of the Hosts File

The Hosts file is located at:

```bash
/etc/hosts
```

This file exists on almost every Linux distribution.

---

# Viewing the Hosts File

Command:

```bash
cat /etc/hosts
```

---

# Why is `cat` Used?

The `cat` command displays the contents of a text file directly in the terminal.

Syntax:

```bash
cat filename
```

Example:

```bash
cat /etc/hosts
```

Purpose:

To verify the hostname-to-IP mappings configured on the local system.

---

# Hosts File Entries

Example:

```
127.0.0.1 localhost

127.0.0.1 site1.local

127.0.0.1 site2.local

127.0.0.1 site3.local
```

Each line consists of two parts:

```
IP Address

↓

Hostname
```

Example:

```
127.0.0.1

↓

site1.local
```

This tells Linux:

"When someone requests `site1.local`, use the IP address `127.0.0.1`."

---

# What is 127.0.0.1?

```
127.0.0.1
```

is called the **Loopback Address**.

It always refers to the local computer itself.

Whenever Linux sends traffic to:

```
127.0.0.1
```

the traffic never leaves the machine.

Instead, it immediately returns to the local operating system.

Flow:

```
Browser

↓

127.0.0.1

↓

Same Computer

↓

Nginx
```

---

# Why Did We Use 127.0.0.1?

Our Nginx server is running on the same Ubuntu machine.

Therefore,

```
site1.local

↓

127.0.0.1

↓

Nginx
```

No network communication is required.

Everything happens locally.

---

# Browser Request Flow

Suppose we type:

```
http://site2.local
```

The following sequence occurs:

```
Browser

↓

Needs IP Address

↓

Checks /etc/hosts

↓

Finds

127.0.0.1

↓

Sends HTTP Request

↓

Nginx

↓

Server Block

↓

Returns Website
```

Notice that the browser never contacts a DNS server because the answer is already available in the Hosts file.

---

# Name Resolution Order in Linux

When resolving a hostname, Linux generally follows this order:

```
Application

↓

/etc/hosts

↓

DNS Server

↓

Internet
```

If the hostname exists in `/etc/hosts`, Linux immediately uses that entry.

DNS is skipped completely.

This makes `/etc/hosts` useful for:

- Local development
- Testing web servers
- Internal lab environments
- Temporary hostname mappings

---

# Why Do System Administrators Use `/etc/hosts`?

System administrators often use the Hosts file when:

- Testing new websites before public release.
- Migrating websites to new servers.
- Verifying configurations without modifying DNS.
- Creating local development environments.
- Troubleshooting DNS-related problems.

Using `/etc/hosts` allows administrators to test websites safely before exposing them to users.

---

# Difference Between `/etc/hosts` and DNS

| `/etc/hosts` | DNS |
|--------------|-----|
| Local file | Distributed service |
| Manual entries | Automatic lookup |
| Works only on one machine | Works globally |
| No network required | Requires network communication |
| Best for testing | Best for production websites |

---

# Testing Hostname Resolution

Command:

```bash
ping site1.local
```

Purpose:

Checks whether the hostname resolves correctly.

Expected Output:

```
PING site1.local (127.0.0.1)
```

This confirms that Linux successfully translated the hostname into the correct IP address.

---

# Verifying the Hosts File

Command:

```bash
cat /etc/hosts
```

Purpose:

Displays all hostname mappings currently configured on the system.

This helps confirm that:

```
site1.local

site2.local

site3.local
```

are correctly mapped to:

```
127.0.0.1
```

---

# Project Progress

At this stage, we have successfully:

- Learned what the Hosts file is.
- Understood the purpose of hostname resolution.
- Learned the difference between DNS and `/etc/hosts`.
- Understood why we used `127.0.0.1`.
- Learned how browsers resolve hostnames.
- Verified hostname mappings using `cat`.
- Tested hostname resolution using `ping`.

Our local hostname resolution is now complete.

In the next section, we will follow a complete HTTP request from the browser to Nginx and understand how the **Host** header allows Nginx to select the correct Virtual Host when multiple websites are hosted on the same server.