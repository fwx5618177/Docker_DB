#!/bin/bash
set -e
 
echo '1.开始导入数据....'
#导入数据
mysql < /mysql/schema.sql
echo '导入数据完毕....'
 
#重新设置mysql密码
echo '2.开始修改密码....'
mysql < /mysql/privileges.sql
echo '修改密码完毕....'

echo '3.title sql'
mysql < /mysql/title.sql
echo '新增title'

ls -al /mysql

#sleep 3
# echo `service mysql status`
echo `service mysql.server status`
echo 'mysql容器启动完毕,且数据导入成功'
echo '请继续使用'
 
tail -f /dev/null
