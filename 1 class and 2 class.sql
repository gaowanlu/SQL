/*                                           第一课与第二课(检索数据)                                                              */
USE sql_store;#使用表sql_store
SELECT first_name#从customers表中检索所有列
FROM customers;

# 检索多个列
SELECT DISTINCT first_name,last_name#使用DISTINCT避免列数据重复
FROM customers
LIMIT 5 OFFSET 5;# 只检索从第5行开始的5行

# 从customers表中检索所有列
SELECT *
FROM customers;
-- WHERE customer_id = 1;# 注释可以使用--
# 检索customer_id的那一行

# 总结:选择符合要求的列，选择符合要求的行
#SQL语句中的注释
#使用# -- /**/







 