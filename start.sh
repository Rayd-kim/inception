if [ ! -d /home/youskim/data ];then
	sudo mkdir /home/youskim/data
fi

if [ ! -d /home/youskim/data/mysql ];then
	sudo mkdir /home/youskim/data/mysql
fi

if [ ! -d /home/youskim/data/wordpress ];then
       sudo mkdir /home/youskim/data/wordpress
fi

if ! cat /etc/hosts | grep youskim.42.fr;then
	sudo echo "127.0.0.1 youskim.42.fr" >> /etc/hosts
fi
