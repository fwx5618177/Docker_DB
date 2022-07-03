#!/bin/zsh/
echo "start stop pre-docker containers..."

MYSQL_ID=`docker ps -a | grep -e "mysqlDB_test" | awk '{print $1}'`

docker stop $MYSQL_ID $TOMCAT_ID

docker rm $MYSQL_ID $TOMCAT_ID

echo 'docker stop Mysql:' $MYSQL_ID

docker-compose up --force-recreate
