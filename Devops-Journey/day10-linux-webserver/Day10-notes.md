# Day 10 — Nginx deep dive, logs, permissions (Date: YYYY-MM-DD)

## Goal
Understand how Nginx serves files, how to read logs, manage the service, and fix permission issues.

## 1. Check Nginx processes
Commands:
- `ps aux | grep nginx`
- `sudo systemctl status nginx`

Key result:
- master process (root), multiple worker processes (www-data)
- Nginx active and running

## 2. Test the site locally & from Mac
Commands:
- server: `curl -i localhost`
- mac: `curl -I http://192.168.64.2` or open browser

Expected:
- HTTP 200 and HTML content

## 3. Logs
Commands:
- Access log: `sudo tail -f /var/log/nginx/access.log`
- Error log: `sudo tail -f /var/log/nginx/error.log`

Use case:
- Access log shows incoming requests and status codes
- Error log shows configuration and permission errors

## 4. Controlled break/fix
Steps:
- `sudo mv /var/www/html/index.html /var/www/html/index.html.bak`
- Trigger a request from the browser
- Check `error.log` and fix by restoring the file

Lesson:
- Reproduce failure and follow logs to resolution

## 5. Document root and permissions
Configuration:
- Nginx root: `/var/www/html` (check `/etc/nginx/sites-enabled/default`)

Commands to fix ownership/permissions:
- `sudo chown -R www-data:www-data /var/www/html`
- `sudo find /var/www/html -type d -exec chmod 755 {} \;`
- `sudo find /var/www/html -type f -exec chmod 644 {} \;`
- `sudo systemctl reload nginx`

Reason:
- Ensure `www-data` can read files; avoid world-writable files

## 6. Service lifecycle
Commands:
- `sudo systemctl reload nginx` (apply config)
- `sudo systemctl restart nginx` (full restart)
- `sudo journalctl -u nginx -n 200 --no-pager` (view logs)

## Key takeaways
- Logs are the #1 tool to debug production issues
- Ownership (`www-data`) and permissions must be correct
- Learn to `reload` vs `restart` for safe operation
- Practice break/fix to strengthen troubleshooting

