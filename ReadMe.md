# `Docker`部署`Tomcat, MySQL`, 实现`serverlet`的自动部署

# 1.应用技术栈
  - 虚拟容器化技术:`docker, docker-compose, dockerfile`
  - 编程语言: 
    - `Java`: `Serverlet`
    - `Golang`: `test connection and insert one temp data into db`
  - 数据库: `MySQL`
    - 利用`shell`插入`*.sql`文件，实现对`db`的操作
  - 服务器: `Tomcat`

## 流程
- `docker-compose`根据`dockerfile`部署
- `sh`运行和插入`test db`

# 1. 环境
- 先安装`Docker`
- 修改`go`的源: `https://github.com/goproxy/goproxy.cn/blob/master/README.zh-CN.md`

# 2. `Tomcat`
- 创建`tomcat`目录: `mkdir -p ./tomcat/conf ./tomcat/logs ./tomcat/webapps`
- 运行`Dockerfile`: `docker build -t tomcat .`
- 查看结果: `docker images|grep tomcat`

## 1. 映射文件
- 运行模板: `docker run --name tomcat2 -p 8084:8080 tomcat`

- 复制文件: 
  - `docker cp tomcat2:/usr/local/tomcat/logs .`
  - `docker cp tomcat2:/usr/local/tomcat/conf .`
  - `docker cp tomcat2:/usr/local/tomcat/webapps .`
  - 原始文件:`docker cp tomcat2:/usr/local/tomcat/webapps.dist .`

- 删除旧容器: `docker rm tomcat2`
- 运行: `docker run --name tomcat -p 8080:8080 -v $PWD/tomcat/logs:/usr/local/tomcat/logs -v $PWD/tomcat/conf:/usr/local/tomcat/conf -v $PWD/tomcat/webapps:/usr/local/tomcat/webapps -d tomcat`
    - `-p` 8080:8080：将主机的 8080 端口映射到容器的 8080 端口
    - `-v` $PWD/tomcat:/usr/local/tomcat：将主机中当前目录下的 tomcat 挂载到容器的 `/tomcat`

## 2. 运行查看
- 查看容器: `docker ps `
- 访问: `http://localhost:8084`
  - 如果报404问题,且`webapps`下为空,则需要将`webapps.dist`里的文件移动到`webapps`下

# 2. `MySQL`
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