# Day42 — DNS Deep Flow Detailed Notes

---

# 🌐 What is DNS?

DNS = Domain Name System

DNS converts domain names into IP addresses.

Example:

```text
google.com → 142.250.x.x
```

Humans remember names easily.

Machines communicate using:
- IP addresses

DNS acts like:
- Internet phonebook

---

# 🧠 Why DNS is Important

Without DNS:

Instead of:

```text
youtube.com
```

you would need to remember:

```text
142.250.193.78
```

for every website.

Impossible in real-world networking.

---

# 🧠 Why DevOps Engineers Must Learn DNS

DNS is heavily used in:
- Cloud
- Kubernetes
- Linux servers
- APIs
- Load balancers
- Web applications

Most production issues involve:
- DNS failures
- connectivity issues
- routing problems

DNS is one of the most important networking foundations.

---

# 🌐 Real DNS Flow

When user opens:

```text
google.com
```

internally this happens:

```text
Browser
↓
Local DNS Cache
↓
DNS Resolver
↓
Root DNS Server
↓
TLD Server (.com)
↓
Authoritative DNS Server
↓
IP Address Returned
↓
Browser Connects to Server
```

---

# 1️⃣ Basic DNS Lookup

## Command Used

```bash
nslookup google.com
```

---

# 🧠 Why This Command is Used

`nslookup` is used to:
- query DNS servers
- find IP addresses
- verify DNS resolution

It asks:

```text
"What is the IP address of google.com?"
```

---

# 🧠 Example Output

```text
Server: 192.168.1.1
Address: 192.168.1.1#53

Non-authoritative answer:
Name: google.com
Address: 142.250.x.x
```

---

# 🧠 Important Understanding

## Port Used by DNS

DNS uses:

```text
Port 53
```

Very important networking interview question.

---

# 🧠 What is Non-Authoritative Answer?

Means:
- response came from cached DNS resolver
- not directly from Google authoritative DNS server

---

# 🧠 Real DevOps Usage

Used for:
- DNS troubleshooting
- server verification
- checking domain resolution
- debugging cloud networking

---

# 2️⃣ Checking System DNS Servers

## Command Used

```bash
scutil --dns | grep nameserver
```

---

# 🧠 Why This Command is Used

Shows:
- which DNS servers your Mac uses

Example:

```text
nameserver[0] : 8.8.8.8
```

---

# 🧠 Why This is Important

Your system sends DNS requests to these servers.

Examples:
- Google DNS
- Cloudflare DNS
- ISP DNS

---

# 🧠 Common Public DNS Servers

| Provider | DNS |
|---|---|
| Google | 8.8.8.8 |
| Cloudflare | 1.1.1.1 |
| OpenDNS | 208.67.222.222 |

---

# 🧠 Real DevOps Usage

Used for:
- changing DNS resolvers
- troubleshooting DNS failures
- cloud networking analysis
- debugging Kubernetes DNS issues

---

# 3️⃣ Advanced DNS Lookup with DIG

## Command Used

```bash
dig google.com
```

---

# 🧠 Why This Command is Used

`dig` = Domain Information Groper

Used for:
- advanced DNS analysis
- DNS troubleshooting
- viewing detailed DNS responses

More powerful than:
- nslookup

---

# 🧠 Why DIG is Important

Used heavily by:
- DevOps engineers
- network engineers
- cloud engineers
- SRE teams

---

# 🧠 Important Sections in DIG Output

## QUESTION SECTION

Shows:
- what query was sent

---

## ANSWER SECTION

Shows:
- returned DNS records

Example:

```text
google.com. 300 IN A 142.250.x.x
```

---

## Query Time

Shows:
- how fast DNS lookup completed

Example:

```text
Query time: 15 msec
```

---

# 🧠 Real DevOps Usage

Used for:
- DNS propagation checks
- verifying records
- debugging production DNS issues
- analyzing response times

---

# 4️⃣ Understanding DNS Record Types

DNS contains multiple record types.

Each record has different purpose.

---

# 🌐 A Record

## Command Used

```bash
dig google.com A
```

---

# 🧠 Why This Command is Used

Checks:
- IPv4 address mapping

Example:

```text
google.com → 142.250.x.x
```

---

# 🧠 Real Usage

Websites mostly use:
- A records

for browser communication.

---

# 🌐 AAAA Record

## Command Used

```bash
dig google.com AAAA
```

---

# 🧠 Why This Command is Used

Checks:
- IPv6 address mapping

---

# 🧠 Why IPv6 Exists

IPv4 addresses are limited.

IPv6 provides:
- huge address space
- modern internet scalability

---

# 🌐 MX Record

## Command Used

```bash
dig gmail.com MX
```

---

# 🧠 Why This Command is Used

Checks:
- mail exchange servers

Used for:
- email routing

---

# 🧠 Example

When someone sends email to:

```text
user@gmail.com
```

MX records decide:
- which mail server receives email

---

# 🌐 NS Record

## Command Used

```bash
dig google.com NS
```

---

# 🧠 Why This Command is Used

Checks:
- authoritative DNS servers

Example:

```text
ns1.google.com
```

---

# 🧠 What is Authoritative DNS Server?

Server containing:
- original DNS records

Final source of truth for domain.

---

# 🧠 Real DevOps Usage

Used for:
- DNS migration
- domain troubleshooting
- cloud DNS management

---

# 5️⃣ Tracing Complete DNS Flow

## Command Used

```bash
dig +trace google.com
```

---

# 🧠 Why This Command is Used

Shows:
- complete DNS resolution path

Including:
- root servers
- TLD servers
- authoritative servers

---

# 🧠 What Happens Internally

## Step 1 — Root DNS Server

Root server identifies:
- which TLD server handles `.com`

---

## Step 2 — TLD Server

TLD server identifies:
- authoritative DNS server for Google

---

## Step 3 — Authoritative DNS Server

Returns:
- final IP address

---

# 🧠 Why This Command is Important

This is one of the best commands to understand:
- real internet DNS architecture
- recursive DNS lookup
- how websites actually resolve

---

# 🧠 Real DevOps Usage

Used for:
- debugging DNS failures
- DNS propagation analysis
- Kubernetes DNS troubleshooting
- cloud networking diagnostics

---

# 6️⃣ DNS Cache Understanding

# 🧠 What is DNS Cache?

DNS cache temporarily stores:
- resolved IP addresses

Purpose:
- faster future lookups
- reduced DNS traffic

---

# 🧠 Example

If you open:

```text
google.com
```

multiple times:

system remembers IP temporarily.

No need to perform full DNS lookup every time.

---

# 🧠 Why DNS Cache is Important

Without cache:
- every request would contact root DNS servers
- internet becomes slower

---

# 🧠 Real DevOps Usage

Used for:
- performance optimization
- troubleshooting stale DNS issues
- cache invalidation analysis

---

# 🎯 Important DNS Concepts Learned

- DNS architecture
- Recursive lookup
- Root DNS servers
- TLD servers
- Authoritative DNS servers
- DNS resolver
- DNS cache
- DNS records
- Port 53
- IPv4 & IPv6 resolution
- DNS troubleshooting

---

# 📌 Commands Practiced

| Command | Purpose |
|---|---|
| nslookup google.com | Basic DNS lookup |
| scutil --dns | View system DNS servers |
| dig google.com | Detailed DNS analysis |
| dig google.com A | IPv4 lookup |
| dig google.com AAAA | IPv6 lookup |
| dig gmail.com MX | Mail server lookup |
| dig google.com NS | Name server lookup |
| dig +trace google.com | Complete DNS trace |

---

# 🚀 Final Understanding

DNS is one of the most critical components of:
- Internet
- Cloud
- Kubernetes
- DevOps
- Linux infrastructure

Understanding DNS deeply helps DevOps engineers:
- troubleshoot networking issues
- debug production failures
- manage cloud infrastructure efficiently

