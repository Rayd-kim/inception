#!/bin/sh

if [ ! -d /var/lib/mysql/$DB_NAME ];
then
	service mysql restart
	echo 1
	mysql -e "CREATE DATABASE $DB_NAME";
	echo 2
	mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PW'";
	echo 3
	mysql -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%'";
	mysql -e "ALTER USER'root'@'localhost' IDENTIFIED BY '$DB_PW'";
#	mysql -e "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('$DB_PW')";
	echo 4
	mysqladmin -uroot -p$DB_PW shutdown
	echo 5
	exec mysqld_safe
else
	echo 6
	exec mysqld_safe
fi
