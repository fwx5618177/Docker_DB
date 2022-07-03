#!/bin/bash

echo '删除所有images和正在启动容器'

# container
docker ps -a | sed -e 1d > tmp.txt

CONTAINER_ID='tmp.txt'

while read -r line
do

NAME=`echo $line | awk {'print $2'}`
ID=`echo $line | awk {'print $1'}`
echo '停用容器:' $NAME '- ID:' $ID

docker stop $ID
docker rm $ID

done < $CONTAINER_ID


# images
docker images -a | sed -e 1d > tmp.txt

while read -r line
do

NAME=`echo $line | awk {'print $1'}`
ID=`echo $line | awk {'print $3'}`
echo '停用镜像:' $NAME '- ID:' $ID

docker stop $ID
docker rmi -f $ID

done < $CONTAINER_ID

rm -f $CONTAINER_ID

echo '已经删除,请查看:'

docker ps -a

docker images -a