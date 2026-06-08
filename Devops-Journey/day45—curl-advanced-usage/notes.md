# Day45 — Advanced cURL Usage

## Date

(Enter today's date)

---

# 1️⃣ What is cURL?

cURL stands for:

```text
Client URL
```

It is a command-line tool used to:

- Send HTTP requests
- Test APIs
- Download files
- Upload data
- Troubleshoot web services

---

# Why DevOps Engineers Use cURL

In production environments:

- Websites fail
- APIs become slow
- Load balancers stop responding
- Kubernetes services become unavailable

Before opening a browser, DevOps engineers often use:

```bash
curl
```

because it directly communicates with servers.

---

# 2️⃣ Basic Website Request

## Command

```bash
curl https://google.com
```

## Why This Command is Used

Downloads webpage content from the server.

Acts like a browser requesting a webpage.

---

## What Happens Internally

```text
curl
↓
DNS Lookup
↓
TCP Connection
↓
TLS Handshake
↓
HTTP Request
↓
HTTP Response
```

---

## Real DevOps Usage

Used to:

- Verify website availability
- Check server response
- Test connectivity

---

# 3️⃣ Viewing Only Response Headers

## Command

```bash
curl -I https://google.com
```

## Why This Command is Used

`-I`

means:

```text
Fetch Headers Only
```

Instead of downloading the entire webpage.

---

## Example Output

```http
HTTP/2 301
location: https://www.google.com/
server: gws
```

---

## Important Understanding

Headers provide:

- HTTP status code
- Content type
- Server information
- Security settings

---

## Real DevOps Usage

Used for:

- Troubleshooting websites
- Checking redirects
- Inspecting web server responses

---

# 4️⃣ Understanding HTTP Status Code 301

## Example

```http
HTTP/2 301
```

## Meaning

```text
301 = Moved Permanently
```

Google redirects:

```text
https://google.com
↓
https://www.google.com
```

---

## Why Redirects Exist

Used for:

- Domain standardization
- HTTPS enforcement
- Website migrations

---

# 5️⃣ Following Redirects Automatically

## Command

```bash
curl -L https://google.com
```

## Why This Command is Used

`-L`

means:

```text
Follow Redirects
```

Without `-L`:

```text
google.com
↓
301
↓
Stop
```

With `-L`:

```text
google.com
↓
301
↓
www.google.com
↓
200 OK
```

---

## Real DevOps Usage

Used for:

- Website monitoring
- Redirect validation
- Application testing

---

# 6️⃣ Checking Only HTTP Status Code

## Command

```bash
curl -o /dev/null -s -w "%{http_code}\n" https://google.com
```

## Why This Command is Used

Checks status code without downloading webpage content.

---

## Command Breakdown

### -o /dev/null

Discard response body.

### -s

Silent mode.

### -w

Display custom output.

### %{http_code}

Print HTTP status code.

---

## Example Output

```text
301
```

or

```text
200
```

---

## Real DevOps Usage

Used in:

- Monitoring tools
- Health checks
- CI/CD pipelines

---

# 7️⃣ Following Redirect and Checking Final Status

## Command

```bash
curl -L -o /dev/null -s -w "%{http_code}\n" https://google.com
```

## Output

```text
200
```

---

## Why This Command is Used

Confirms final destination is healthy.

---

# 8️⃣ Verbose Mode

## Command

```bash
curl -v https://google.com
```

## Why This Command is Used

`-v`

means:

```text
Verbose Mode
```

Shows everything happening internally.

---

## Information Displayed

- DNS Resolution
- TCP Connection
- TLS Handshake
- SSL Certificate
- HTTP Request
- HTTP Response

---

## Example Output

```text
Connected to google.com
TLSv1.3
SSL certificate verify ok
HTTP/2 301
```

---

## Real DevOps Usage

Used for:

- SSL troubleshooting
- Network debugging
- API debugging

---

# 9️⃣ DNS Resolution

## Output Example

```text
Host google.com:443 was resolved
IPv4: ...
IPv6: ...
```

## What Happened

DNS converted:

```text
google.com
↓
IP Address
```

---

## Why DNS is Important

Servers communicate using IP addresses.

Humans use domain names.

DNS bridges the gap.

---

# 🔟 TLS Handshake

## Output Example

```text
TLS handshake
Client hello
Server hello
Certificate
Finished
```

---

## What Happens

```text
Client Hello
↓
Server Hello
↓
Certificate Exchange
↓
Key Exchange
↓
Secure Tunnel Created
```

---

## Why It Matters

Ensures:

- Encryption
- Authentication
- Secure communication

---

# 1️⃣1️⃣ SSL Certificate Verification

## Output Example

```text
SSL certificate verify ok
```

---

## Meaning

The certificate is:

- Valid
- Trusted
- Not expired

---

## Certificate Information

```text
subject: CN=*.google.com
issuer: Google Trust Services
```

---

## Why Certificates Matter

Prevents:

- Fake websites
- Man-in-the-middle attacks
- Data theft

---

# 1️⃣2️⃣ Calling a Public API

## Command

```bash
curl https://api.github.com
```

## Why This Command is Used

Fetches data from GitHub API.

---

## Example Output

```json
{
  "repository_url": "...",
  "user_url": "...",
  "events_url": "..."
}
```

---

## What is an API?

API = Application Programming Interface

Allows applications to communicate.

---

## Real DevOps Usage

Used for:

- GitHub Automation
- Jenkins Integration
- Kubernetes Management
- Cloud Automation

---

# 1️⃣3️⃣ Formatting JSON Output

## Command

```bash
curl https://api.github.com | python3 -m json.tool
```

## Why This Command is Used

Formats JSON for readability.

---

## Before Formatting

```json
{"name":"Abhishek","role":"DevOps"}
```

---

## After Formatting

```json
{
    "name": "Abhishek",
    "role": "DevOps"
}
```

---

## Real DevOps Usage

Used while debugging APIs.

---

# 1️⃣4️⃣ Querying GitHub User API

## Command

```bash
curl https://api.github.com/users/Abhishek01Devops
```

## Why This Command is Used

Retrieves public GitHub profile information.

---

## Data Returned

```json
"login"
"public_repos"
"followers"
"following"
"created_at"
```

---

## Real DevOps Usage

Used for:

- User automation
- GitHub integrations
- Repository management

---

# 1️⃣5️⃣ Measuring Response Time

## Command

```bash
curl -o /dev/null -s -w "Total Time: %{time_total}\n" https://api.github.com
```

## Example Output

```text
Total Time: 0.303249
```

---

## Why This Command is Used

Measures:

```text
Request Start
↓
Response Received
↓
Total Time
```

---

## Real DevOps Usage

Used for:

- Performance testing
- Latency monitoring
- API health checks

---

# 1️⃣6️⃣ Sending POST Requests

## Command

```bash
curl -X POST https://httpbin.org/post
```

## Why This Command is Used

Sends a POST request.

---

## Difference Between GET and POST

### GET

```text
Give me data
```

### POST

```text
I am sending data
```

---

## Real DevOps Usage

Used for:

- Triggering builds
- Creating resources
- Calling APIs

---

# 1️⃣7️⃣ Sending JSON Data

## Command

```bash
curl -X POST https://httpbin.org/post \
-H "Content-Type: application/json" \
-d '{"name":"Abhishek","role":"DevOps"}'
```

---

## Why This Command is Used

Sends JSON payload to server.

---

## Command Breakdown

### -X POST

Use POST method.

### -H

Send HTTP header.

### Content-Type: application/json

Tells server data format.

### -d

Payload data.

---

## Real DevOps Usage

Used for:

- API automation
- Jenkins jobs
- Kubernetes APIs
- Cloud APIs

---

# 1️⃣8️⃣ Downloading Files

## Command

```bash
curl -O https://raw.githubusercontent.com/github/gitignore/main/README.md
```

## Why This Command is Used

Downloads file using original filename.

---

## Result

```text
README.md
```

appears locally.

---

## Real DevOps Usage

Used for:

- Downloading scripts
- Config files
- Application packages

---

# 1️⃣9️⃣ Saving File With Custom Name

## Command

```bash
curl https://raw.githubusercontent.com/github/gitignore/main/README.md \
-o github-readme.txt
```

## Why This Command is Used

Save downloaded file using custom name.

---

## Difference

### -O

```text
Keep original filename
```

### -o

```text
Custom filename
```

---

# 2️⃣0️⃣ Common cURL Options

| Option | Purpose |
|----------|----------|
| -I | Show headers only |
| -L | Follow redirects |
| -v | Verbose output |
| -O | Save original filename |
| -o | Save custom filename |
| -X | Specify HTTP method |
| -H | Add HTTP headers |
| -d | Send data |
| -s | Silent mode |
| -w | Custom output |

---

# 🧠 Key Concepts Learned

- HTTP Requests
- HTTP Responses
- Status Codes
- Redirects
- DNS Resolution
- TLS Handshake
- SSL Verification
- APIs
- JSON Data
- GET Requests
- POST Requests
- Response Headers
- Response Timing
- File Downloads

---

# Day45 — cURL Commands Practiced

## Basic Website Request

```bash
curl https://google.com
```

---

## View Response Headers Only

```bash
curl -I https://google.com
```

---

## Follow Redirects

```bash
curl -L https://google.com
```

---

## Check HTTP Status Code

```bash
curl -o /dev/null -s -w "%{http_code}\n" https://google.com
```

---

## Check Final Status After Redirect

```bash
curl -L -o /dev/null -s -w "%{http_code}\n" https://google.com
```

---

## Verbose Mode

```bash
curl -v https://google.com
```

---

## Call GitHub API

```bash
curl https://api.github.com
```

---

## Pretty Print JSON Output

```bash
curl https://api.github.com | python3 -m json.tool
```

---

## Query GitHub User API

```bash
curl https://api.github.com/users/Abhishek01Devops
```

---

## Measure Response Time

```bash
curl -o /dev/null -s -w "Total Time: %{time_total}\n" https://api.github.com
```

---

## Send POST Request

```bash
curl -X POST https://httpbin.org/post
```

---

## Send JSON Data Using POST

```bash
curl -X POST https://httpbin.org/post \
-H "Content-Type: application/json" \
-d '{"name":"Abhishek","role":"DevOps"}'
```

---

## Download File (Original Filename)

```bash
curl -O https://raw.githubusercontent.com/github/gitignore/main/README.md
```

---

## Download File (Custom Filename)

```bash
curl https://raw.githubusercontent.com/github/gitignore/main/README.md \
-o github-readme.txt
```

---

## Check API Headers

```bash
curl -I https://api.github.com
```

---

## Verbose API Request

```bash
curl -v https://api.github.com/users/Abhishek01Devops
```

---

# Bonus Commands (Industry Usage)

## Download and Follow Redirects

```bash
curl -LO https://example.com/file.zip
```

---

## Save Response to File

```bash
curl https://api.github.com > output.json
```

---

## Show Response Headers and Body

```bash
curl -i https://api.github.com
```

---

## Custom User Agent

```bash
curl -A "DevOps-Learning" https://api.github.com
```

---

## Add Authorization Header

```bash
curl -H "Authorization: Bearer TOKEN" https://api.github.com/user
```

---

## Download Multiple Files

```bash
curl -O URL1 -O URL2
```

---

## Check Only Download Speed

```bash
curl -o /dev/null -s -w "Speed: %{speed_download}\n" https://google.com
```

---

## Check Remote File Size

```bash
curl -sI https://example.com/file.zip | grep Content-Length
```

---

# Commands Mastered on Day45

```text
curl
curl -I
curl -L
curl -v
curl -o
curl -O
curl -X
curl -H
curl -d
curl -s
curl -w
python3 -m json.tool
```

