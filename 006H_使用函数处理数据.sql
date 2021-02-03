/*                                           第8课(使用函数处理数据)                                                         */
USE sql_inventory;
SELECT *
FROM products;

# UPPER()函数-字符全部变大写
SELECT upper(name) AS UPPERNAME
FROM products;

#常用的文本处理函数
/*
LEFT() 返回字符串左边的字符
LENGTH() 返回字符串的长度
LOWER() 将字符串换为小写
LTRIM() 去掉字符串左边的空格
RTRIM() 去掉字符串右边的空格
RIGHT() 返回字符串右边的字符
SUBSTR() 提取字符串的组成成分
SOUNDEX() 返回字符串的SOUNEDx值alter  （对英文友好）
UPPER() 将字符串转换为大写
*/

# 日期与时间处理函数
# MySQL 使用 YEAR() 函数从日期中提取年份 
USE sql_invoicing;
SELECT *
FROM invoices
WHERE YEAR(invoice_date) != 2019;
USE sql_invoicing;
SELECT *
FROM invoices
WHERE YEAR(invoice_date) = 2019;

#数值处理函数
/*
ABS() 返回一个数的绝对值
COS() 返回一个角度的余弦
EXP() 返回一个数的指数值
PI() 返回圆周率
SIN() 返回一个角度的正弦
SQRT() 返回一个数的平方根
TAN() 返回一个角度的正切
*/
