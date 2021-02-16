/*										使用视图													*/
USE sql_invoicing;
SELECT *
FROM clients;

#删除表
DROP TABLE new_table;

#创建表
CREATE TABLE new_table
(
	order_num CHAR(10) NOT NULL DEFAULT 1,
    order_date CHAR(10) NOT NULL,
    cust_id CHAR(10) NULL
);

#插入行
INSERT INTO new_table
VALUE("123","ddi","HELLO");

#显示表
SELECT *
FROM new_table;

#删除视图
#-覆盖(或更新)视图，必须先删除它，然后再重新创建
DROP VIEW new_table_view;

#创建视图（视图是在SQL解析时定义的虚拟的表，视图并不存在数据库）
CREATE VIEW new_table_view AS
SELECT *
FROM new_table;

#使用视图
SELECT *
FROM new_table_view;

#用视图重新格式化检索出的数据
DROP VIEW temp_view;
CREATE VIEW temp_view AS
SELECT concat(RTRIM(order_num),RTRIM(order_date),RTRIM(cust_id)) AS data
FROM new_table;

SELECT *
FROM temp_view;


