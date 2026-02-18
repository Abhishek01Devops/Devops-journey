## Ports, Sockets & Process–Network Mapping

## What is a Port?
- Logical communication endpoint
- 0–65535
- Well-known ports (22, 80, 443)

ex : 192.168.64.2:22   → SSH
     192.168.64.2:80   → Web server
     192.168.64.2:443  → HTTPS
 

## What is a Socket?
   IP + Port + Protocol
    ex : 192.168.64.2:22 TCP

## What Is TCP vs UDP?
TCP: Reliable
     Ordered
     Handshake required
     Used for: SSH, HTTP, HTTPS

UDP: Fast
     No handshake
     No guarantee
     Used for: DNS, streaming

## ss -tuln :
It is used to check listening network ports and services

What This Does:
ss → shows socket statistics
-t → TCP
-u → UDP
-l → listening
-n → numeric (don’t resolve names) 

## ss -tulnp :
It is used to check which services (processes) listening on which port
ex : tcp   LISTEN   0   128   0.0.0.0:22   users:(("sshd",pid=xxx))
based on the ex we get to know port 22 is owned by sshd.
 Port 22 → sshd
 Port 53 → systemd

 ## sudo ss -tulnp | grep :80 :
 What this command means:
ss → shows socket statistics (modern replacement for netstat)
-t → TCP
-u → UDP
-l → Listening ports only
-n → Show numeric ports (don’t resolve names)
-p → Show process using the port
grep :80 → Filter only port 80

## curl localhost :
This happened internally:
- curl sends HTTP request to port 80
- Linux kernel checks which process owns port 80
- Kernel forwards request to nginx
- nginx serves default HTML page
- curl prints HTML output
This is the complete web server flow.

## What is a Server?
A server is a machine that:
- Runs services
- Listens on ports
- Responds to client requests

In our case:
- ubuntu server
- Running Nginx

## What is Nginx?
Nginx is a web server that:
- Serves websites
- hndles HTTP requests
- Listens on port 80

## What is Document Root?
Document Root = Folder from which Nginx serves files.

When user visits: http://192.168.64.2

Nginx checks:/var/www/html

And serves:index.html

## Who Runs Nginx?
Command: ps aux | grep nginx
We saw:www-data

important Concept:

Nginx runs as www-data
That user must have read access to document root
If permissions are wrong → 403 Forbidden error

## End-to-End Flow Understanding
