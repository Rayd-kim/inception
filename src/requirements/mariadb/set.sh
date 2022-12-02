
echo -------start mysql---------------------------------------------------------
#service mysql start 

if [ ! -d /var/lib/mysql/$DB_NAME ];then
	service mysql restart
	mysql -e "CREATE DATABASE $DB_NAME";
	mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PW'";
	mysql -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%'";
	#mysql -e "GRANT ALL ON *.* TO 'root'@'localhost'IDENTIFIED BY '$DB_PW'";
	mysql -e "ALTER USER'root'@'localhost' IDENTIFIED BY '$DB_PW'";
	#mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PW')";
	mysql -uroot -p$DB_PW -e "FLUSH PRIVILEGES";
	service mysql stop
fi

#service mysql restart

exec mysqld_safe
