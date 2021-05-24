/*                             第12节        联结表为表起别名                                        */

#等值联结
SELECT vend_name,Vendors.prod_name,Products.prod_price
FROM Cendors,Products
WHERE Vendors.vend_id=Products.vend_id;
# 在联结两个表时，实际要做的是将表中的每一行与其他表的每一行进行配对
# 但会出现，在变的id有另一个没有，也就是可能会出现不能一一匹配

#内联结
SELECT vend_name,prod_name,prod_price
FROM Vendors
INNER JOIN Products ON Vendors.vend_id=Products.vend_id;-- 不写INNER 则默认 INNER JOIN

#联结多个表
SELECT prod_name,vend_name,prod_price,quantity
FROM OrderItems,Products,Vendors
WHERE Products.vend_id=Vendors.vend_id
	AND OrderItems.prod_id=Products.prod_id
    AND order_num=20007;
#先联结，后order_num=20007过滤行


#为表起别名（只是举例）
SELECT *
FROM order_items o
JOIN products p
ON o.name = p.name;

# 跨库联结
-- 例
-- 需要在表的前面加库名 lib4.testtable 代理lib4库下的testtable表
SELECT *
FROM order_items oi
JOIN sql_inventory.products p
ON oi.product_id=p.product_id;

#自联结
SELECT *
FROM order_items oi
JOIN order_items e
ON oi.product_id=e.product_id;-- 没有意义,应在具体情况下使用

-- 库.表.列

#联结多张表
SELECT *
FROM atable a
JOIN btable b ON a.name=b.name
JOIN ctable ON a.id=c.id;


#多条联结条件
SELECT *
FROM atable a
JOIN btable b ON a.id=b.id AND a.name=b.name; 


#外联结-OUTER JOIN
#   |-左联结 LEFT OUTER JOIN 可缩写为 LEFT JOIN
#   |-右联结 RIGHT OUTER JOIN 可缩写为 RIGHT JOIN

#多张表 外连接 自我外联结 （自我）左外联结 （自我）右外联结 略 与内联结差不多少

#MySQL USING
SELECT *
FROM a
JOIN b
USING(name,id);-- 等价于 ON a.name=b.name AND a.id=b.id



#自然联结
SELECT *
FROM orders o
NATURAL JOIN customers c;


#交叉联结
SELECT *
FROM atable a
CROSS btable b;

#集合交UNION
# MySQL貌似不支持intersect except(但可以使用嵌套查询)
SELECT name
FROM a
WHERE age>10;
UNION
SELECT name
FROM b
WHERE age<6;