service mysql start

# database name, user_name, pw -> in .env variable use

#mysql -e "CREATE DATABASE wordpress_db";
#mysql -e "CREATE USER 'youskim'@'%' IDENTIFIED BY 'dbtjd0513!'";
#mysql -e "GRANT ALL ON wordpress_db.* TO 'youskim'@'%'";
#mysql -e "FLUSH PRIVILEGES";

export $(cat .env | xargs)

mysql -e "CREATE DATABASE $DB_NAME";
mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PW'";
mysql -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%'";
mysql -e "FLUSH PRIVILEGES";

rm set.sh
rm .env
