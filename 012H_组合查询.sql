/*                                         第14节      组合查询                        */
USE sql_invoicing;
SELECT *
FROM clients;

# 使用UNION ALL不去掉重复的
SELECT *
FROM clients
WHERE clients.client_id<=3
UNION ALL
SELECT *
FROM clients
WHERE clients.client_id>=3;

# 使用UNION默认去掉重复的
SELECT *
FROM clients
WHERE clients.client_id<=3
UNION
SELECT *
FROM clients
WHERE clients.client_id>=3;