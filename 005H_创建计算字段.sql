/*                                           第7课(创建计算字段)                                                         */
# 复习上一节，使用通配符
USE sql_inventory;
SELECT *
FROM products
WHERE unit_price<=5 AND ( name LIKE '%t%');

#这一节学习的是创建计算字段
#拼接字段（不同地数据库管理系统中的SQL语句语法有所不同）
SELECT concat('name:  ',name,'  price:  ',unit_price)
FROM products
ORDER BY unit_price DESC;

#RTRIM()、LTRIM()、TRIM()函数
#函数功能:去掉值右边的空格、去掉值左边的空格、去掉值左边和右边的空格
SELECT concat(trim(name),trim(unit_price))
FROM products;
SELECT concat(rtrim(name),rtrim(unit_price))
FROM products;

#使用别名（或者称导出列）
SELECT concat(trim(name)) AS ProductName
FROM products;

#执行算数计算
SELECT name,quantity_in_stock*unit_price AS quantity_in_stockmulunit_price
FROM products;

#SQL算数操作符 加+ 减- 乘* 除/
SELECT curdate(),name,quantity_in_stock/unit_price AS quantity_in_stockdivunit_price
FROM products;





