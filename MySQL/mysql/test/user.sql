use `docker_mysql`;

-- 建表
DROP TABLE IF EXISTS `TestUser`;

CREATE TABLE `TestUser` (
 `id` bigint(20) NOT NULL,
 `created_at` bigint(40) DEFAULT NULL,
 `last_modified` bigint(40) DEFAULT NULL,
 `email` varchar(255) DEFAULT NULL,
 `first_name` varchar(255) DEFAULT NULL,
 `last_name` varchar(255) DEFAULT NULL,
 `username` varchar(255) DEFAULT NULL,
 `address` varchar(255) DEFAULT NULL,
 `phone` varchar(255) DEFAULT NULL,
 `contract` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

show tables;