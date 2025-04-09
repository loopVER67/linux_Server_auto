apt install php apache2 unzip php-mysqli mysql-server libapache2-mod-php -y

a2enmod /etc/apache2/mods-available/php8.3
cd /var/www/html
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.2/phpMyAdmin-5.2.2-all-languages.zip
unzip phpMyAdmin-5.2.2-all-languages.zip
mv phpMyAdmin-5.2.2-all-languages phpmyadmin

sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Admin1234';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"
sudo mysql -u root -pAdmin1234 -e "CREATE DATABASE phpmyadmin;"
sudo msyql -u root -pAdmin1234 -e "CREATE DATABASE icinga2;"
sudo msyql -u root -pAdmin1234 -e "CREATE USER 'ici2admin'@'%' IDENTIFIED WITH mysql_native_password BY 'Admin1234';"
sudo mysql -u root -pAdmin1234 -e "grant all privileges on icinga2.* to 'ici2admin'@'%';"
sudo mysql -u root -pAdmin1234 -e "flush privileges"
sudo mysql -u root -pAdmin1234 -e "CREATE DATABASE wordpress;"
sudo mysql -u root -pAdmin1234 -e "CREATE USER 'wpadmin'@'%' IDENTIFIED WITH mysql_native_password BY 'Admin1234';"
sudo mysql -u root -pAdmin1234 -e "grant all privileges on wordpress.* to 'wpadmin'@'%';"
sudo mysql -u root -pAdmin1234 -e "CREATE DATABASE webmail;"
sudo mysql -u root -pAdmin1234 -e "CREATE USER 'webmail'@'%' IDENTIFIED WITH mysql_native_password BY 'Admin1234';"
sudo mysql -u root -pAdmin1234 -e "grant all privileges on webmail.* to 'webmail'@'%';"
sudo mysql -u root -pAdmin1234 -e "flush privileges"

