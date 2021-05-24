/*                                           004H_使用通配符与正则表达式                                                         */
USE sql_inventory;
SELECT *
FROM products
WHERE name LIKE '%b%';#使用通配符%

SELECT *
FROM products
WHERE name LIKE '_o%';#_只匹配一个字符


-- 正则表达式 REGEXP
SELECT *
FROM products
WHERE name REGEXP 'filed';-- name 中含有filed的数据


SELECT *
FROM products
WHERE name REGEXP '^filed';-- name以filed开头的数据

SELECT *
FROM products
WHERE name REGEXP 'filed$';-- name以filed结尾的数据

SELECT *
FROM products
WHERE name REGEXP 'filed|mac|rose';-- name中含有filed 或 mac 或 rose的数据

SELECT *
FROM products
WHERE name REGEXP '[gio]c';-- name中含有gc 或 ic 或 oc的数据,同理可以c[iod]

SELECT *
FROM products
WHERE name REGEXP '[a-z]c';-- ac bc dc ..........zc






