############Update system packages:

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y                                 # (from PDF)


#########If DVWA needs configuration edits (PDF mentions changing config and php.ini), use an editor — example paths may vary. Example edits (recommended):

# edit DVWA config file (example path — adapt to your VM)
sudo nano /var/www/html/DVWA/config/config.inc.php
# set:
# $DB_SERVER   = 'localhost';
# $DB_PASSWORD = 'password';

# edit php.ini (example path depends on distro)
sudo nano /etc/php/7.4/apache2/php.ini                   # adjust php version path as needed
# set:
# allow_url_fopen = On
# allow_url_include = On


(PDF instructs to change db_server to localhost and password to password and to change those php.ini settings). 



###########Restart Apache (to apply php.ini changes):

sudo systemctl restart apache2


##########Open DVWA setup (in browser):

https://localhost/DVWA/setup.php                          # (from PDF)
# then click Create/Update Database (GUI)


#########Login to DVWA:

Username: admin
Password: password                                     # (from PDF)


######3Change DVWA security level to Low (GUI) and then test SQL injection.

####SQLi payloads to enter in DVWA "User ID" field (from PDF):

%' or '0'='0
%' or '1'='1
%' or 0=0 union select null, version() #
%' or 0=0 union select null, user() #
