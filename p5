#####3Update system (if not done):

sudo apt update && sudo apt upgrade -y                  # (recommended)


#######3Use nmap NSE scripts for quick vuln checks (recommended):

nmap --script vuln -T4 -sV -oN vuln-scan.txt <target-ip> # (recommended)


####33Run Nikto (web scanner) (install if needed):

sudo apt install nikto -y                                # (recommended)
nikto -h                                                # show usage
nikto -host http://<target-ip>                          # run scan (recommended)


##########OpenVAS / Greenbone is GUI/web-based — start scanner (example commands to start services):

# if installed (Greenbone/OpenVAS service examples)
sudo systemctl start openvas-scanner
sudo gvm-check-setup                
