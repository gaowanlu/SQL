/*															使用游标alter												*/
/*
1. 游标(cursor)：是一个存储在MySQL服务器上的数据库查询，它不是一条select语句，而是被该语句检索出来的结果集。
   游标主要用于交互式应用，其中用户需要滚动屏幕上的数据，并对数据进行浏览或做出更改。
   游标只能用于存储过程和函数。
2. 使用游标的步骤：
   1) 在能够使用游标前，必须声明（定义）它。这个过程实际上没有检索数据，它只是定义要使用的select语句。
   2) 一旦声明后，必须打开游标以供使用。这个过程用前面定义的select语句把数据实际检索出来。
   3) 对于填有数据的游标，根据需要去除（检索）各行。
   4) 在结束游标使用时，必须关闭游标。
3. 在一个游标被打开后，可以使用fetch语句分别访问它的每一行。fetch指定检索什么数据（所需的列），检索出来的数据存储在什么地方。它还向前移动游标中的内部指针，使下一条fetch语句检索下一行（不重复读取同一行）。
*/
DROP procedure if exists fun;#永久删除游标
DROP TABLE if exists copy;
create table copy
(
	order_num INTEGER NOT NULL,
    cust_id CHAR(10) NOT NULL
);
DELIMITER //
CREATE procedure fun()
BEGIN
	DECLARE num INTEGER;
    DECLARE nam_e CHAR(10);
	#创建游标
	declare cur cursor for SELECT * FROM person;
    open cur;#打开游标
	FETCH cur INTO num,nam_e;
    INSERT INTO copy VALUE(num,nam_e);
    close cur;#关闭游标
END;//
DELIMITER ;
call fun();
SELECT *
FROM copy;

#每fetch一回就会向下自动迭代一行，类似于C语言中的文件读取。