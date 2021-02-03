/*---                                           第10节 分组数据                                                         ---*/
#复习上一节内容（汇总数据）ＡＶＧ　ＳＵＭ　ＭＩＮ　ＭＡＸ　ＣＯＵＮT 函数的使用
USE sql_invoicing;
SELECT AVG(distinct client_id),SUM(payment_total),MIN(payment_total),MAX(payment_total),COUNT(*)
FROM invoices;

#本节内容
SELECT COUNT(*) AS client_idCOUNT#输出17
FROM invoices;

SELECT COUNT(*) AS client_idCOUNT#输出6,统计client_id=5的行共有6个
FROM invoices
WHERE client_id=5;
SELECT *#输出17
FROM invoices;

#创建分组 GROUP BY子句
#GROUP BY子句的位置必须在WHERE子句之后 ORDER BY子句之前
SELECT client_id,payment_total,COUNT(*) AS num
FROM invoices
GROUP BY client_id,payment_total;
/*
num client_id
5	1      即client_id为3的行有5个，为5的有6个
1	2
5	3
6	5
GROUP BY子句更像是
SELECT COUNT(*) AS num
FROM 
WHERE alient_id=something
的加强版
*/

SELECT client_id,payment_total,COUNT(*) AS num
FROM invoices
GROUP BY client_id,payment_total;#像ORDER BY一样也可以使用数字来指定列
#将会按照client_id、payment_total依次分组

#HAVING 过滤分组（HAVING放在GROUP之后ORDER BY之前）
#例如只要组内数量超过一定数量的信息
SELECT client_id,payment_total,COUNT(*) AS num
FROM invoices
GROUP BY client_id,payment_total
HAVING COUNT(*)>=2#HAVING以组为单位进行操作：则COUNT(*)则是统计组内有多少行
ORDER BY num,payment_total,client_id;#分组后过滤然后排序输出

/*
下列语句顺序级大致用途
SELECT 返回的列或者表达式
FROM 从中检索数据的表
WHERE 行级过滤
GROUP BY 分组过滤
HAVING 组级过滤
ORDER BY 输出排序顺序
*/
