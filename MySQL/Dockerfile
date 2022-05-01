# M1芯片的问题,可能会导致报错
FROM mysql/mysql-server:5.7
# 常规使用
# FROM mysql:5.7

#设置免密登录
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes
ENV MYSQL_HOME /mysql
# ENV MYSQL_ROOT_PASSWORD 123456

RUN mkdir -p $MYSQL_HOME

EXPOSE 3306

# CMD ["sh", "/mysql/setup.sh"]