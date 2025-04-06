apt install php apache2 unzip php-mysqli mysql-server libapache2-mod-php -y
a2enmod /etc/apache2/mods-available/php8.3
cd /var/www/html
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.2/phpMyAdmin-5.2.2-all-languages.zip
unzip phpMyAdmin-5.2.2-all-languages.zip
mv phpMyAdmin-5.2.2-all-languages phpmyadmin

mysql -u root -e "CREATE DATABASE phpmyadmin;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Admin1234';"
mysql -u root -e "FLUSH PRIVILEGES;"
