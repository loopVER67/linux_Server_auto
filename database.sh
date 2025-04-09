apt install php apache2 unzip php-mysqli mysql-server libapache2-mod-php -y

a2enmod /etc/apache2/mods-available/php8.3
cd /var/www/html
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.2/phpMyAdmin-5.2.2-all-languages.zip
unzip phpMyAdmin-5.2.2-all-languages.zip
mv phpMyAdmin-5.2.2-all-languages phpmyadmin

mysql -u root -e "CREATE DATABASE phpmyadmin;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Admin1234';"
mysql -u root -e "FLUSH PRIVILEGES;"
msyql -u root -e "CREATE DATABASE icinga2;"
msyql -u root -e "CREATE USER 'ici2admin'@'%' IDENTIFIED WITH mysql_native_password BY 'Admin1234';"
mysql -u root -e "grant all privileges on wordpress.* to 'ici2admin'@'%';"
mysql -u root -e "flush privileges"
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'wpadmin'@'%' IDENTIFIED WITH mysql_native_password BY 'Admin1234';"
mysql -u root -e "grant all privileges on wordpress.* to 'wpadmin'@'%';"
mysql -u root -e "CREATE DATABASE webmail;"
mysql -u root -e "CREATE USER 'webmail'@'%' IDENTIFIED WITH mysql_native_password BY 'Admin1234';"
mysql -u root -e "grant all privileges on wordpress.* to 'webmail'@'%';"
mysql -u root -e "flush privileges"

