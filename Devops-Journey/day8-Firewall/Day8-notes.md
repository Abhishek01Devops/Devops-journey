#  Day 8 – Firewalls & Port Security

## sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate :
Check if Firewall is ON or OFF .

| Output               |      Meaning              |
| ------------------------------------------------ |
| Firewall is enabled  -> Protection active        |
| Firewall is disabled ->  No host-level protection |

## sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getstealthmode :
Check Stealth Mode,Stealth mode hides your machine from ping scans.

## sudo /usr/libexec/ApplicationFirewall/socketfilterfw --listapps :
List Allowed Apps,T his shows which apps are allowed through firewall.

## On production servers:
                      firewall OFF   →    uge security risk
                     If SSH open to public  →  Brute force attacks
                     If DB port open  →  Data breach

