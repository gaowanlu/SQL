/*                                           第9课(汇总数据)                                                         */
USE sql_invoicing;
SELECT *
FROM invoices;

# 聚集函数
# 对某些行运行的函数，计算并返回一个值
/*
AVG() 返回某列的平均值
COUNT() 返回某列的行数
MAX() 返回某列的最大值
MIN() 返回某列的最小值
SUM() 返回某列值之和
*/
# 使用样例
SELECT 
AVG(invoice_total) AS avg,
COUNT(*) AS count,
MAX(invoice_total) AS max,
MIN(invoice_total) AS min,
SUM(invoice_total) AS sum
FROM invoices
WHERE invoice_total>110;
#添加WHERE子句，是先执行WHERE条件，然后再进行SELECT语句里函数计算

#聚集不同值
#DISTINCT 与 ALL（ALL是默认的）
SELECT AVG(ALL client_id) AS avg_client_id
FROM invoices;
SELECT AVG(DISTINCT client_id) AS avg_client_id
FROM invoices; 

