#!/bin/bash

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

sed -i "s/wp_name/$DB_NAME/" /wp-config.php
sed -i "s/wp_username/$MYSQL_USER/" /wp-config.php
sed -i "s/wp_pass/$MYSQL_PASSWORD/" /wp-config.php

mv wp-cli.phar /usr/local/bin/wp

cp /wp-config.php /var/www/html/

wp core download --allow-root

#wp config create --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

wp theme install twentysixteen --activate --allow-root

#changing the listen directive to a TCP socket

sed -i 's,listen = /run/php/php7.4-fpm.sock,listen = 0.0.0.0:9000,' /etc/php/7.4/fpm/pool.d/www.conf

mkdir /run/php

/usr/sbin/php-fpm7.4 -F
