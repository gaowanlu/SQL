/*                                     第16课      更新和删除数据                                     */
#添加行
INSERT INTO clients
VALUES(6,"刘微","china","anyang","CN","133-456-8956");

USE sql_invoicing;
SELECT *
FROM clients;

#更新数据 UPDATE SET
UPDATE clients
SET name="HELLO WORLD",address="USA"
WHERE client_id>=6;

USE sql_invoicing;
SELECT *
FROM clients;

#删除行
DELETE FROM clients
WHERE client_id>=6;

USE sql_invoicing;
SELECT *
FROM clients;