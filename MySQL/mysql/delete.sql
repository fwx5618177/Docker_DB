-- truncate
TRUNCATE TABLE User;
TRUNCATE TABLE Roles;


SELECT * FROM User;
SELECT * FROM Roles;

-- 禁用外键约束
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE User;

-- 启动外键约束
SET FOREIGN_KEY_CHECKS=1;

-- delete
DELETE FROM User;