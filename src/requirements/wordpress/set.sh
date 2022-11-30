
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

if [ -e /var/www/html/wp_config.php ];
then
	echo "already wordpress exist"
else
	cd /var/www/html
	wp core download --allow-root
	wp core config --dbname=wordpress_db --dbuser=youskim --dbpass=dbtjd0513! --dbhost=mariadb --dbprefix=wp_ --allow-root
	wp core install --url=youskim.42.fr --title=inception --admin_user=youskim --admin_password=dbtjd0513! --admin_email=usk05@naver.com --allow-root
	wp user create usk05 youskim@naver.com --user_pass=dbtjd0513 --user_url=usk05.42.fr --allow-root
fi

php-fpm7.3 --nodaemonize
