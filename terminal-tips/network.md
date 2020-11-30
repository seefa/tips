# Network commands

- nmap 192.168.0.1              -> To scan Nmap ports on a  remote
- nmap www.hostname.com         -> To scan a host
- nmap 192.168.0.1-10           -> To scan a range of IP addresses
- nmap –Pn –F 192.168.0.1       -> To run Nmap on a subnet 
- nmap –p 80 192.168.0.1        -> Scan port 80 on the target system
- nmap –p 1-200 192.168.0.1     -> Scan ports 1 through 200 on the target system
- nmap –F 192.168.0.1           -> Scan (Fast) the most common ports
- nmap –p– 192.168.0.1          -> To scan all ports (1 – 65535)
- nmap –sT 192.168.0.1          -> To scan using TCP connect (it takes longer, but is more likely to connect)
- nmap –Pn –F 192.168.0.1       -> Run a fast scan on the target system, but bypass host discovery. (Host discovery uses ping but many server firewalls do not respond to ping requests. This option forces the test without waiting for a reply that may not be coming)
- nmap –A 192.168.0.1           -> The nmap utility can be used to detect the operating system of a particular target

Common Ports
Here is a brief list of standard ports and their designations:
21 – FTP
22 – SSH
25 – SMTP (sending email)
53 – DNS (domain name service)
80 – HTTP (web server)
110 – POP3 (email inbox)
123 – NTP (Network Time Protocol)
143 – IMAP (email inbox)
443 – HTTPS (secure web server)
465 – SMTPS (send secure email)
631 – CUPS (print server)
993 – IMAPS (secure email inbox)
995 – POP3 (secure email inbox)

more info about Nmap commands: [Nmap guide](https://phoenixnap.com/kb/nmap-scan-open-ports)