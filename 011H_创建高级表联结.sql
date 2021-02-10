/*                             第13节           创建高级表联结                                        */
USE sql_invoicing;
SELECT *
FROM clients;
SELECT *
FROM customers;
# 使用表别名
SELECT *
FROM clients AS A_TABLE,customers AS B_TABLE;

#使用不同类型的联结

#自联结(self-join)
SELECT c1.cust_id,c1.cust_name,c1.cust_contact
FROM customers AS c1,customers AS c2
WHERE c1.cust_name=c2.cust_name AND c2.cust_contact="Jim Jones";

#自然联结
SELECT C.cust_id,B.*
FROM customers AS C, clients AS B
WHERE C.cust_id=B.client_id+10000;

#左外联结
SELECT *
FROM customers
LEFT OUTER JOIN clients ON customers.cust_id=clients.client_id+10000;
#选中OUTER JOIN左边的表的全部行,哪怕没有关联行

#右外联结
SELECT *
FROM customers
RIGHT OUTER JOIN clients ON customers.cust_id=clients.client_id+10000;
#选中OUTER JOIN左边的表的全部行，哪怕没有关联行


#使用带聚集函数的联结
SELECT customers.cust_id,COUNT(clients.name) AS num
FROM customers
INNER JOIN clients ON customers.cust_id=clients.client_id+10000
GROUP BY customers.cust_id;

SELECT customers.cust_id,COUNT(clients.name) AS num
FROM customers
LEFT OUTER JOIN clients ON customers.cust_id=clients.client_id+10000
GROUP BY customers.cust_id;
#先联结，在分组，再SELECT统计计算等等

