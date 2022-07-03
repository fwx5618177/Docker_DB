#!/bin/bash

NEW_MYSQL_ID=`docker ps -a | grep -e "mysqlDB_test" | awk '{print $1}'`

docker exec -it $NEW_MYSQL_ID /bin/bash