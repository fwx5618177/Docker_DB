use docker_mysql;

-- 禁用外键约束
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE User;
TRUNCATE TABLE Roles;
TRUNCATE TABLE LoginInfo;


-- 启动外键约束
SET FOREIGN_KEY_CHECKS=1;