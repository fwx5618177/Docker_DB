# `Docker`部署`MySQL`

# 1.应用技术栈
- Mysql
- Redis
- mongoDB

# 2. 使用流程
1. `sh init.sh`: 初次运行、搭建环境
2. `sh execDB.sh`: 进入Mysql容器
  - 进入容器内搭建初始环境, `sh /mysql/setup.mysql`
  - `/mysql/*.sql`: 各类sql文件
3. `sh del.sh`: 删除旧容器


# 使用
## `MySQL`
- 创建`Mysql`文件夹和文件:
  - `schama.sql`: 默认表、默认数据
  - `privileges.sql`: 权限表
  - `setup.sh`: 启动和处理脚本

- 创建容器: `docker build -t mysql .`
- 运行镜像: `docker run -d -p 13306:3306 --name=mysql2 mysql`
  - M1: `docker run --platform linux/x86_64 -d -p 13306:3306 --privileged=true --name=mysql2 mysql`
    - `M1`问题较多, 会导致很多问题
  - 查看运行情况: `docker run --platform -d -p 13306:3306 --privileged --name=mysql2 mysql`
    - 解决没有权限的问题:`/usr/sbin/init`
    - `-v /sys/fs/cgroup:/sys/fs/cgroup`
    - 查看日志: `docker logs -f ${images name}`
  - 自定义映射配置: `docker run --platform linux/x86_64 -d -p 13306:3306  -v $PWD/data:/var/lib/mysql -v $PWD/conf.d:/etc/mysql/conf.d -v $PWD/logs:/var/log/mysql --privileged=true --name=mysql2 mysql`

- 进入容器测试`DB`: `docker exec -it mysql2 /bin/bash`
  - `mysql -u docker -p [pwd]`
  - `use docker_mysql;`
  - `show tables;`
  - `select * from user;`