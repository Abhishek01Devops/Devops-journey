# Nginx Reverse Proxy Setup

A hands-on DevOps project demonstrating how to configure Nginx as a reverse proxy to forward HTTP traffic to a backend application server.

## What This Project Does

Instead of exposing a backend server directly to the internet, a reverse proxy sits in front of it — receiving all incoming requests and forwarding them to the backend. This is standard practice in production environments for security, performance, and scalability.

```
Client (Browser)
      │
      ▼
 Nginx (Port 80)        ← Public-facing
      │
      ▼
Python Backend (Port 5000)  ← Internal only
```

## Why This Matters in DevOps

- Hides backend ports from the public internet
- Enables SSL termination at the proxy layer
- Allows multiple backend services behind one IP
- Industry standard — used with Node.js, Django, Flask, and more

---

## Technologies Used

| Tool | Purpose |
|---|---|
| Ubuntu Linux | Server OS |
| Nginx | Reverse proxy |
| Python 3 | Lightweight backend server |
| UFW | Firewall management |

---

## Setup & Configuration

### 1. Install Nginx

```bash
sudo apt update
sudo apt install nginx -y
```

### 2. Start the Python Backend Server

```bash
python3 -m http.server 5000
```

This starts a simple HTTP server on port 5000, simulating a backend application.

### 3. Configure Nginx as Reverse Proxy

Edit the default Nginx site config:

```bash
sudo nano /etc/nginx/sites-available/default
```

Replace the contents with:

```nginx
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name _;

    location / {
        proxy_pass http://localhost:5000;
    }
}
```

This tells Nginx to forward all requests arriving on port 80 to the Python backend on port 5000.

### 4. Restart Nginx to Apply Changes

```bash
sudo nginx -t          # test config for syntax errors
sudo systemctl restart nginx
```

### 5. Test the Reverse Proxy

```bash
curl http://localhost
```

Expected result: the response from the Python backend served through Nginx on port 80.

---

## How It Works

1. Client sends a request to `http://<server-ip>` (port 80)
2. Nginx receives the request
3. Nginx forwards it internally to `localhost:5000`
4. Python backend responds
5. Nginx returns the response to the client

The client never directly communicates with port 5000 — it only ever sees Nginx on port 80.

---

## Key Concepts Learned

- How reverse proxying works and why it's used in production
- Nginx `location` block and `proxy_pass` directive
- Difference between a web server and a reverse proxy
- Testing and validating Nginx configuration with `nginx -t`
- How to safely restart services after config changes

---

## Project Status

✅ Nginx installed and running  
✅ Python backend server configured on port 5000  
✅ Nginx reverse proxy forwarding port 80 → port 5000  
✅ Tested with curl — proxy working correctly  
