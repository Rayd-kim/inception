#!/bin/sh
if [ -e /usr/local/bin/wp ];
then
	echo "already wp_cli installed"

else
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
fi


if [ -d /var/www/html ];
then
	echo "html directory exist"
else
	mkdir /var/www /var/www/html
fi

chown -R www-data:www-data /var/www/html

if [ -e /var/www/html/wp-config.php ];
then
	echo "already wordpress exist"
else
	cd /var/www/html
	wp core download --allow-root
	while [ ! -f /var/www/html/wp-config.php ];do
		wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PW --dbhost=mariadb --dbprefix=wp_ --allow-root
	done
	wp core install --url=$WP_ADMIN_URL --title=inception --admin_user=$WP_ADMIN_ID --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --path=/var/www/html --allow-root
	wp user create $WP_USER_ID $WP_USER_EMAIL --user_url=$WP_USER_URL --user_pass=$WP_USER_PW --allow-root
fi

php-fpm7.3 --nodaemonize
