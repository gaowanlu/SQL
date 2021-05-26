-- 建立索引成本
COST OF INDEXES
- 增加数据库的大小（它需要和表一起保存）
- 每次增删改数据时，MySQL会自动更新索引，会影响当前操作的效率

-- 我们只需要给特别重要的查询添加索引(数据量大，但频繁检索)

-- 不要在设计表的时候就创建好索引，不要以表来创建索引、要以查询内容来创建

-- 在内部：索引通常是以二叉树的方式保存的



-- 创建索引
#检索时对比了多大的数据量
EXPLAIN SELECT customer_id FROM customers WHERE  state='US';
CREATE INDEX idx_state ON customers(state);
EXPLAIN SELECT customer_id FROM customers WHERE  state='US';

--查看索引
SHOW INDEXES IN customers;
只要给表添加了主键，引擎自动会对主键加索引、聚合索引(主键索引) clustered INDEX
ANALYZE TABLE customers;
每张表只能有一个聚合索引

其他的索引是，从属索引 secondary indexes
外码也会自动加索引


如果索引的列为 CHAR VARCHAR TEXT BLOB,索引就会占用大量的磁盘空间、并且性能表现也不好
-- 解决方案，对数据部分内容建立索引
CREATE INDEX idx_lastname ON customers (last_name(20))
--怎样挑选一个不错的值
SELECT
COUNT(DISTINCT LEFT(last_name,1)),
COUNT(DISTINCT LEFT(last_name,5)),
COUNT(DISTINCT LEFT(last_name,10))
FROM customers;


-- 全文索引 索引类型
问题
USE sql_blog;
SELECT *
FROM posts
WHERE title LIKE '%rect%' OR body LIKE '%rect%';

数据量大的时候将会非常慢
-- 创建全文索引
CREATE FULLTEXT INDEX idx_title_body ON posts(title,body);
-- 使用全文索引
SELECT *
FROM posts
WHERE MATCH(title,body) AGAINST('rect');
-- MATCH(title,body) AGAINST('rect -redux +form' IN BOOLEAN MODE) 含rect但不含redux 含form


-- 组合索引
EXPLAIN SELECT customer_id FROM customers
WHERE state='CA' AND points>1000;

CREATE INDEX idx_state_points ON customers(state,points);



-- 删除索引
DROP INDEX idx_state ON customers;


--组合索引的顺序问题
-- 将最常用的列放到最前面

--ＵＳＥ　ＩＮＤＥＸ
ＳＥＬＥＣＴ　ｃｕｓｔｏｍｅｒ＿ｉｄ
ＦＲＯＭ　ｃｕｓｔｏｍｅｒｓ
ＵＳＥ　ＩＮＤＥＸ（ｉｄｘ＿ｓｔａｔｅ＿ｌａｓｔｎａｍｅ）
ＷＨＥＲＥ　ｓｔａｔｅ　ＬＩＫＥ　＇Ａ％＇　ＡＮＤ　ｌａｓｔ＿ｎａｍｅ　ＬＩＫＥ　＇Ａ％＇；

--有时候这样写效率会更好
ＳＥＬＥＣＴ　*
ＦＲＯＭ　ｃｕｓｔｏｍｅｒｓ
ＷＨＥＲＥ　ｓｔａｔｅ　ＬＩＫＥ　＇Ａ％＇
UNION
ＳＥＬＥＣＴ　*
ＦＲＯＭ　ｃｕｓｔｏｍｅｒｓ
WHERE ｌａｓｔ＿ｎａｍｅ　ＬＩＫＥ　＇Ａ％＇；


--防止建立相同的索引
(A,B,C) == (A,B,C)
(A,C,B) != (A,B,C)

--防止建立无用索引
建立了(A,B)
再建立(A) (A)为无用索引

