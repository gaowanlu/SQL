/*                                 使用子查询                               */
# 子查询的两种主要使用目的
# 1、利用子句查询进行过滤
# 2、作为计算字段使用子查询
USE sql_invoicing;
SELECT *
FROM invoices;

# 利用子句查询进行过滤
SELECT invoice_total
FROM invoices
WHERE invoice_total>=170;#输出列 invoice_total:[175.32 189.12 172.17 180.17]

SELECT client_id
FROM invoices
WHERE invoice_total IN (#等于将子查询返回的一列作为筛选项使用
SELECT invoice_total
FROM invoices
WHERE invoice_total>=170
);
# 输出列  client_id[ 5  1  5  5]
#注意：可以多层嵌套，每个SELECT可以查询不同的表
#每个子查询返回的必须是一列，是多列会报错


# 作为计算字段使用子查询
USE sakila;
SELECT COUNT(*) AS SUM
FROM film
WHERE rental_duration>=6;
/*输出列:SUM [ 32 ]*/
#统计了rental_duration>=6的共有多少行

SELECT film_id,title,(SELECT description FROM film WHERE film.film_id = film_text.film_id) AS film_description
FROM film_text;
/*分析:
从表film_text拿title 与film_id 在表film中拿 film_text每行的film_id对应的description
*/

# IF()
SELECT 
IF (COUNT(*)>2,'yes','no') AS u; 

#CASE WHEN
SELECT
CASE WHEN COUNT(*)>100 THEN '>100'
    WHEN COUNT(*)<10 THEN '<10'
    ELSE 'NULL'
END
AS judge;

--FROM中的子查询
SELECT *
FROM(
    SELECT client_id,name,...
    FROM ..
) AS kkk
WHERE kkk........