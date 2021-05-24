/*                                           第三课(排序检索数据)                                                            */
USE sql_store;
SELECT *
FROM customers;

#使用ORDER BY 进行排序（应该保证ORDER BY 放在语句的最后面）
USE sql_inventory;
SELECT *
FROM products
ORDER BY quantity_in_stock;

#按照多个列进行行排序
USE sql_inventory;
SELECT *
FROM products
ORDER BY quantity_in_stock,unit_price;# 先按照quantity_in_stock排序再按照unit_price排序

#不用指定列的名字，指定是第几列
USE sql_inventory;
SELECT *
FROM products
ORDER BY 3,4;# quantity_in_stock为第3行,unit_price为第4行alter
#先按照第三列排序在按照第四列排序


#指定排序的方向是升序还是降序
USE sql_inventory;
SELECT *
FROM products
ORDER BY 3 DESC;# quantity_in_stock为第3行


#想为多个列进行排序指定排序方向必须为每个列指定DESC
USE sql_inventory;
SELECT *
FROM products
ORDER BY 3 DESC,4 DESC;

#使用计算字段在ORDER BY
SELECT *
FROM products
ORDER BY quantity_in_stock * unit_price DESC;








