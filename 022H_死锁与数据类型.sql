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
