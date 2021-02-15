USE sql_invoicing;
#删除表
DROP TABLE Orders1;
#创建表
CREATE TABLE Orders1
(
	order_num INTEGER NOT NULL DEFAULT 1,
    order_date DATETIME NOT NULL,
    cust_id CHAR(10) NULL
);
#使用DEFAULT指定默认值
# 不允许NULL值的列不接受没有列值的行，换句话说，在插入或更新行时，该列必须有值
# NOT NULL,NULL（默认值为NULL）
INSERT INTO Orders1
VALUE(1,current_date(),"HELLO");
INSERT INTO Orders1
VALUE(2,current_date(),"HELLO");
SELECT *
FROM Orders1;

#更新表

#为表添加新的列
ALTER TABLE Orders1
ADD name CHAR(20) NULL DEFAULT "高万禄";
SELECT *
FROM Orders1;

#为表删除列
ALTER TABLE Orders1
DROP COLUMN cust_id;
SELECT *
FROM Orders1;

#表重命名
#RENAME Orders1 TO Orders;
#新版MySQL已经不支持RENAME
