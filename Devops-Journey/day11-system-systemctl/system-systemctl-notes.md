# What Happens When Linux Boots?
Linux startup flow:
BIOS / UEFI  
    ↓  
Linux Kernel  
    ↓  
systemd (PID 1)  
    ↓  
All services start  

### Key Concept
- **systemd** is the first process started by Linux.
- It manages the entire operating system services.

## ps -p 1 : 
                PID TTY          TIME CMD
                 1 ?        00:00:25 systemd

    Meaning: systemd controls the system.

## What is a Service?
A service is a background program that keeps running and provides functionality.
ex : ssh
     nginx
     systemd-resolved
     cron

Services are also called daemons.

## systemctl list-units --type=service :
                                          Listing Running Services in the system

    ex : nginx.service       loaded          active                  running

## systemctl status nginx : 
                             Check service status 
    output : Loaded: loaded
             Active: active (running)
             Main PID: <process id>

    Helps identify:
	•	Service stopped
	•	Configuration errors
	•	Permission issues
	•	Crash logs

## systemctl cat nginx : 
View service defination

output : [Unit]
        Description=Service info

        [Service]
        ExecStart=command to run

        [Install]
       WantedBy=multi-user.target 

Sections Meaning: 	•	[Unit] → Description & dependencies
	                •	[Service] → How service runs
	                •	[Install] → When service starts during boot

## 🎯 Objective

Understand how Linux services are controlled and how application availability depends on service state.

 practiced managing the Nginx web server using systemctl.

 ## What is systemctl?
 systemctl is a command used to manage services in Linux systems that use systemd.

It allows us to:
	•	Start services
	•	Stop services
	•	Restart services
	•	Reload configurations
	•	Check service status

## systemctl status nginx :  Checking Service Status
Purpose
	•	Verify whether a service is running
	•	View logs and process information
	•	Confirm service health

## curl localhost :  testing application availablity
Concept : . if service runs → Website works
          . If service stops → Website becomes unreachable

## sudo systemctl stop nginx : stoping services
Result
	•	Nginx process stops
	•	Port 80 closes
	•	Website becomes inaccessible

## sudo systemctl start nginx : starting services
Result
	•	Web server starts again
	•	Website becomes accessible

## sudo systemctl restart nginx : restart a services
Meaning
	•	Stops service
	•	Starts it again immediately

Used when:
	•	Application behaves incorrectly
	•	After major updates

## sudo systemctl reload nginx : reload the service
Important Concept: 
- Reload applies configuration changes without downtime.

- Used in production environments to avoid service interruption.


## Objective
Understand how Linux services behave during server boot and how DevOps engineers control which services start automatically.

## Why Service Auto-Start Matters ?
- When a server reboots:
	•	Operating system starts first
	•	Required services must start automatically
	•	Applications depend on these services

- Example:
	•	Web server (nginx) must start automatically
	•	Otherwise website becomes unavailable

    This is managed by systemd boot targets.

## systemctl is-enabled nginx : Check Service Auto-Start Status
- Possible Outputs
	•	enabled → Starts automatically at boot
	•	disabled → Will NOT start at boot
	•	static → Started only by dependency

## sudo systemctl disable nginx : it disable the services.

## sudo systemctl enable nginx : it enable the services.

## sudo reboot : this will rebot the server.

## sudo systemctl start nginx : this will start the services.

## What is journalctl?
journalctl is used to view system and service logs managed by systemd journal.
journalctl = log viewer for Linux services

## journalctl : To view all logs.

## journalctl -u nginx : to View Logs for a Specific Service

## journalctl -u nginx -f : Show live logs for the specific service.

## journalctl -n 20 : Shows recent 20 logs.

## journalctl -b : Logs since boot, Useful after reboot issues.

## journalctl -p err : Show Errors Only.

## journalctl -xe : shows latest error with explination.





