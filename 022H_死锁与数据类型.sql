-- 死锁

A等待B B等待A
当遇到死锁时一般系统会回滚事务A与事务B



-- MySQL数据类型
String \Numeric \Date and Time\Blob(二进制数据)\Spatial(存放地理数据)


-- 字符串
CHAR(X) 固定长度
VARCHAR(X) 可变长度 最大的长度是6万5千多
MUEDIUMTEXT 16MB 最多1千6百万
LONGTEXT 4GB
TINYTEXT 255 bytes
TEXT 64KB

English 1 byte   中东:2bytes   中日:3byte


-- 整数 INTEGERS
TINYINT 1b [-128,127]
UNSIGNED TINYINT [0,255]
SMALLINT 2b [-32l,32k]
MEDIUMINT 3b[-8M,8M]
INT 4b [-2B,2B]
BIGINT 8b [-9Z,9Z]

-- 小数类型RATIONALS
DECIMAL(p,s)  DECIMAL(9,2)=>1234567.89
DEC
NUMERIC
FIXED
-------------
FLOAT 4b
DOUBLE 8b


-- BOOLEANS类型
BOOL
BOOLEAN
UPDATE posts
SET is_published=TRUE # or FALSE
TRUE<-->1  FALSE<-->0

-- 枚举类型
例:ENUM(1,2,3)
ENUM('a','bb','ccc')
SET(...)

-- DATE/TIME
DATA
TIME
DATETIME 8b
TIMESTAMP  4b  --通常使用于TIMESTAMP事件戳来记录数据插入和最后修改的时间 最大2038
YEAR

-- BLOBS 二进制数据
TINYBLOB 255b
BLOB 65KB
MEDIUMBLOB 16MB
LONGBLOB 4GB


-- JSON
JSON-- 具体使用可以进行查询



