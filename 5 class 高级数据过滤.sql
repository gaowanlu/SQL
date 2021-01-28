/*                                           第五课(高级数据过滤)                                                         */
USE sql_inventory;
SELECT *
FROM products;

# AND 操作符
SELECT *
FROM products
WHERE product_id>=5 AND quantity_in_stock>=70;

# OR 操作符
SELECT *
FROM products
WHERE product_id>=5 OR quantity_in_stock>=70;

# AND 与 OR 组合(AND 优先级大于 OR)
SELECT *
FROM products
WHERE (product_id>=5 OR quantity_in_stock>=70) AND unit_price>=2;

# IN 操作符
SELECT *
FROM products
WHERE quantity_in_stock IN (98,26,6);
# 等价于 quantity_in_stock==98 OR ...==26 OR ...==6

# NOT 操作符
SELECT *
FROM products
WHERE NOT (quantity_in_stock IN (98,26,6));






