
## ifconfig :
 To see network interfaces and IP details on your system.
  . en0 → Wi-Fi (Mac)
  . inet → Your IP address
  . status: active → Network is working

- Check your system IP
- See which interface is active (Wi-Fi / Ethernet)
- Debug “system not connected to network”

## hostname : 
Shows your machine name on the network.
- Used in logs
- Used in monitoring tools
- Helps identify which server has an issue

## ifconfig | grep inet :
To check all interfaces IPv4 ,IPv6,Netmask.

## ping 8.8.8.8 : 
Connectivity to Google DNS server (IP based).
- Tests internet access without DNS
- Helps isolate DNS issues
- Ping works → Internet is OK
- Ping fails → Network problem

## ping google.com : 
Internet + DNS resolution
- 8.8.8.8 works but google.com fails → DNS issue
- Both fail → Network issue

| Result               ->    Problem    |
| --------------------------------------|
| IP ping works        ->  Internet OK  |
| Domain ping fails    ->  DNS broken   |
| Both fail            ->  Network down |
| Localhost works only ->  App issue    |

## nslookup google.com : 
It shows which DNS server is used, IP address returned.
It is used to Check DNS working or not,First cmd used in outages
  - If this fails → DNS issue
  - If this works → move to network check

## dig google.com : 
Detailed DNS debugging,More detailed than nslookup
- ANSWER SECTION → actual IP
- Query time → DNS speed

## cat /etc/hosts :
To view the file,Many “site not opening” issues come from bad /etc/hosts

## netstat -rn :
It shows the routing table in numeric format(ip addresses only,no DNS resolution)
-r -> Display routing table
-n -> Show numeric addresses

## route get :
Path to destination

## traceroute google.com :
Hop-by-hop path,Every router between you and Google,Where delay or failure happens

### REAL PRODUCTION DEBUG FLOW
1. ping google.com
2. nslookup google.com
3. dig google.com
4. netstat -rn
5. traceroute google.com

## lsof -i :
Who is using the network, it shows Process name
                                   PID
                                   Port number
                                   Protocol (TCP/UDP)

