
if [ ! -d /var/lib/mysql/$DB_NAME ];then
	service mysql start
	mysql -e "CREATE DATABASE $DB_NAME";
	mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PW'";
	mysql -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%'";
	mysql -e "ALTER USER'root'@'localhost' IDENTIFIED BY '$DB_PW'";
	mysql -e "FLUSH PRIVILEGES";
	service mysql stop
fi

exec mysqld_safe
