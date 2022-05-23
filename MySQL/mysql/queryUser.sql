use docker_mysql;

SELECT
*
FROM
User;


SELECT
*
FROM
Roles;

SELECT
*
FROM
LoginInfo;

SELECT
*
FROM
User AS p1
INNER JOIN
Roles AS p2
ON
p2.uuid = p1.uuid

