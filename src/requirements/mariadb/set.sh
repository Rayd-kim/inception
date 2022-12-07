#!/bin/sh

if [ ! -d /var/lib/mysql/$DB_NAME ];
then
	service mysql restart
	mysql -e "CREATE DATABASE $DB_NAME";
	mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PW'";
	mysql -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%'";
	mysql -e "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('$DB_PW')";
	mysqladmin -uroot -p$DB_PW shutdown
	exec mysqld_safe
else
	exec mysqld_safe
fi
