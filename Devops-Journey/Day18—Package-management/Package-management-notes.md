## Day 18 — Package Management

Package management means installing, updating, removing, and managing software in Linux using package managers.

In Ubuntu/Debian systems, package management is done using APT (Advanced Package Tool).
It helps you:
- Install software
- Update packages
- Remove software
- Manage dependencies

## What is a Package?
A package is a compressed file that contains:
- Software
- Libraries
- Configuration files
- Dependencies

* Example packages:
- nginx
- git
- curl
- docker

## sudo apt update :- 
* Purpose:
- Updates the list of packages from repositories.
- Does not install anything.

* Example output meaning:
- Fetching package list from servers
- Checking latest versions

## sudo apt upgrade :- 
* Purpose:
- Upgrades installed software to latest version.

* Example:
- New version of curl
- Security patches

## apt list --upgradable :-
This cmd list the packages that need to be upgraded.

## sudo apt install <package>:-
To install a new package.

##  <package> -v :- 
To check installation
 
## sudo apt install git curl wget :- 
To install multiple packages in one cmd
* Examples:
- Git → version control
- cURL → API testing
- Wget → downloading files

## sudo apt remove <package> :-
This removes software but keeps configuration files.

## sudo apt purge nginx :-
It removes completely software and configure files.

## sudo apt autoremove :-
 Auto Remove Unused Dependencies( librarie ) 

 ## apt search docker :- 
 Shows all docker-related package

 ## apt show nginx:-
  Show Package Details.
* Displays:
- version
- dependencies
- description
- repository

## apt list --installed :-
Shows all installed software.

## which nginx :-
 Check Package Location
 * Example output: /usr/sbin/nginx

## dpkg -l | grep nginx :-
 Check Installed Package Version,dpkg is the low-level package manager used by APT. 

## Quick Revision Notes
Command                         Use
- apt update          -          Refresh repo list
- apt upgrade         -         Update packages
- apt install         -         Install software
- apt remove.         -         Remove package      
- apt purge           -         Remove package + config
- apt autoremove      -         Remove unused dependencies
- apt search          -         Find package
- apt show            -         Package details

