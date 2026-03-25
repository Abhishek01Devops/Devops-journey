# Day 26 — Cron Jobs

## What is Cron
Cron is a scheduler in Linux used to run commands automatically at specific times.

Example uses:
- Backups
- Log cleanup
- Health checks
- Deploy scripts
- Monitoring

---

## Cron Format
| | | | |
| | | | └── Day of week (0-7)
| | | └──── Month (1-12)
| | └────── Day of month (1-31)
| └──────── Hour (0-23)
└────────── Minute (0-59)

---

Examples: 
- */5 * * * * -> every 5 minutes
- 0 * * * *   -> every hour
- 0 2 * * *   -> daily at 2 AM

---

## Step 1 — Create Script
```bash
nano script.sh :- 
# ADD
echo "Cron ran at: $(date)" >> /home/devops/Devops-Journey/day26-corn/output.log

## Make executable:
chmod +x script.sh

---

## Step 2 — Add Cron Job
crontab -e :- 
* * * * * /bin/bash /home/devops/Devops-Journey/day26-corn/script.sh

## Step 3 — Verify Cron
- crontab -l :- Check cron entries.

- tail -f output.log :- Watch log

---

### Debugging Steps Learned

- sudo systemctl status cron :- Check cron running

- sudo journalctl -u cron :- Check cron execution logs

- /bin/bash script.sh :-Run script manually

---

### Stop Cron Job

- crontab -e :-
# * * * * * /bin/bash /home/devops/Devops-Journey/day26-corn/script.sh


### Key Learning
- cron runs in background
- minimal environment
- absolute paths required
- logs help debugging
- cron is core DevOps automation tool



