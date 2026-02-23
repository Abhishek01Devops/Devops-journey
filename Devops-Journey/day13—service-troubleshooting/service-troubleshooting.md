### Day 13 — Service Troubleshooting ###

##  Objective
Learn how to verify whether a service is working correctly using a DevOps troubleshooting approach.
 checked nginx health using multiple system layers.

## Checking Service Status (Systemd Layer) :- systemctl status nginx
# Purpose
- shows current service state
- Managed by systemd

# important States
- active (running) → Service working
- inactive → Service stopped
- failed → Service crashed

##  Checking Listening Ports (Network Layer):- sudo ss -tulnp | grep :80
# Purpose
- Confirms service is listening on a network port
- Ensures server accepts incoming traffic

# Expected Result :- LISTEN 0 511 0.0.0.0:80
# Meaning:
- Port 80 open
- Web server ready for requests

## Checking Running Processes (Operating System Layer) :- ps aux | grep nginx
# Purpose
- Verifies nginx processes are running
- Shows which user executes the service

# Expected Result :- www-data nginx: worker process
# Meaning:
- Linux kernel running nginx processes successfully

## Testing Application Response (Application Layer) :- curl localhost
# Purpose
- Tests actual web server response
- Confirms end-to-end functionality

##  Key Learning
Service troubleshooting should always follow this order:
- Check service status
- Check port listening
- Check running processes
- Test application response

### Practice Scenario ###
We intentionally broke the nginx configuration to simulate a real production failure and then fixed it using logs and system tools.

## sudo systemctl status nginx :- Verify Service Status
# Purpose
- Checks whether service is running or failed.
- Shows exit status and recent error hints.

## sudo nano /etc/nginx/nginx.conf :- Simulating Service Failure
# Added invalid directive:- invalid_directive;
# Result:
- nginx reload failed
- Service entered failed state

## sudo journalctl -u nginx -n 20 :-  Checking Service Logs (Root Cause)
# What it does
- Displays logs for nginx service.
- Helps identify exact failure reason.
# Learned
- Logs showed:- unknown directive "invalid_directive"

##  Fixing Configuration :- sudo nano /etc/nginx/nginx.conf
Removed wrong line from config file

## Testing Configuration :- sudo nginx -t
Output : syntax is ok test is successful

## Restarting Service :- sudo systemctl restart nginx
Purpose: Apply corrected configuration.

## Validation :- sudo stemctl status nginx
To check services.

## Troubleshooting must follow a logical order:
Service → Port → Local Test → Network → Firewall → Files → Permissions → Reload





