-- 选择数据库
use docker_mysql;
 
-- 建表
DROP TABLE IF EXISTS `creative_title_pkg`;

CREATE TABLE `creative_title_pkg` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pkg_name` varchar(64) NOT NULL DEFAULT '' COMMENT '包名',
  `app_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'appId',
  `title_list` varchar(1000) NOT NULL DEFAULT '' COMMENT '标题+动态词包的json',
  `create_user` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_user` varchar(32) NOT NULL DEFAULT '' COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_pkg_name` (`pkg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文案包配置表'