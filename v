# update + install required tools
sudo apt update -y
sudo apt install -y git python3-pip curl jq nmap whois googler cupp


# Sublist3r (subdomain enumeration)
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
sudo pip3 install -r requirements.txt
python3 sublist3r.py -d google.com -o ~/subdomains_google.com.txt
cd ..


# OSRFramework (username/email discovery) - may return nothing for big brands
sudo pip3 install osrframework
sudo usufy -n google -o ~/usufy_google.csv
sudo mailfy -n google -o ~/mailfy_google.csv


# Wayback snapshot index (Wayback Machine)
curl -s "http://web.archive.org/cdx/search/cdx?url=google.com/*&output=json&fl=timestamp,original,statuscode" > ~/wayback_google.com.json


# Simple scraping: download homepage and list links
curl -sL "https://google.com" -A "OSINT-script" > ~/google.com_homepage.html
grep -Eoi '<a [^>]+>' ~/google.com_homepage.html | sed -E 's/.*href="([^"]+)".*/\1/' | sort -u > ~/google.com_links.txt


# WHOIS / DNS / certificate info
whois google.com > ~/google.com_whois.txt
dig +short A google.com > ~/google.com_A.txt
echo | openssl s_client -connect google.com:443 -servername google.com 2>/dev/null | openssl x509 -noout -text > ~/google.com_cert.txt

# Nmap (non-invasive host discovery)
nmap -sn google.com -oN ~/google.com_nmap_ping.txt

# List Kali wordlists
ls -la /usr/share/wordlists > ~/kali_wordlists_list.txt
