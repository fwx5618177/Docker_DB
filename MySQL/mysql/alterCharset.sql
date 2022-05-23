ALTER DATABASE 
`docker_mysql` 
CHARACTER SET 
'utf8' 
COLLATE 
'utf8_general_ci';

ALTER TABLE 
`docker_mysql`.`TestUser` 
CHARACTER SET = utf8mb4, 
COLLATE = utf8mb4_bin;

-- 删除表中数据
TRUNCATE TABLE `TestUser`;

DELETE FROM `user`;