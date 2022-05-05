#!/usr/bin/env sh

sed -i "s/\$REDIS_PORT/$REDIS_PORT/g" /redis/conf/redis.conf   #声明参数，为了docker-compose里面可以动态配置
sed -i "s/\$REDIS_PASSWORD/$REDIS_PASSWORD/g" /redis/conf/redis.conf  #声明参数
    
redis-server /redis/conf/redis.conf
