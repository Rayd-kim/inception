WORKDIR = src

MYSQL_DATA = /home/youskim/data/mysql

WP_DATA = /home/youskim/data/wordpress

all: start
	cd ./$(WORKDIR) && docker compose up -d --build

start:
	sudo sh start.sh

restart: shutdown
	cd ./$(WORKDIR) && docker compose up -d

shutdown:
	cd ./$(WORKDIR) && docker compose down

reset: shutdown
	docker volume rm db wp
	sudo rm -rf $(MYSQL_DATA) $(WP_DATA)

.PHONY: all start restart shutdown reset
