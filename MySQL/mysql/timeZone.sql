-- 查看时区
show variables like "%time_zone%";

select curtime(); 

select now(); 

-- 修改mysql全局时区为北京时间，即我们所在的东8区
-- set global time_zone = '+8:00';

-- 修改当前会话时区
-- set time_zone = '+8:00';

-- 立即生效
-- flush privileges;
