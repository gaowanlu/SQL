/*                                           第6课(使用通配符)                                                         */
USE sql_inventory;
SELECT *
FROM products
WHERE name LIKE '%b%';#使用通配符%

SELECT *
FROM products
WHERE name LIKE '_o%';#_只匹配一个字符



