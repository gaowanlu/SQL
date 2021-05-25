/*                                                     使用存储过程与函数                                                      */
DELIMITER //
#删除存储过程
DROP procedure test;
#参数种类

#IN 输入参数：表示调用者向过程传入值（传入值可以是字面量或变量）
#OUT 输出参数：表示过程向调用者传出值(可以返回多个值)（传出值只能是变量）
#INOUT 输入输出参数：既表示调用者向过程传入值，又表示过程向调用者传出值（值只能是变量）

#创建存储过程
DELIMITER $$
create procedure test(in a integer,in b integer,OUT num INTEGER)
BEGIN
	SELECT *
    FROM clients;
    set a=2*a;
    SELECT @a;#用户变量
    SELECT a+b;
    num=a+b;
END$$
DELIMITER ;
SET @num=0;
CALL test(1,2,@num);
SELECT @num;
#删除存储过程
DROP PROCEDURE IF EXISTS test;

#IF THEN ELSE END IF
DELIMITER $$
create procedure test(in a integer,in b integer)
BEGIN
    IF a IS NULL THEN
        SET a=2;
    ELSE
        SET b=100;
    END IF;
	SELECT *
    FROM clients;
    set a=2*a;
    SELECT @a;#用户变量
    SELECT a+b;
END$$
DELIMITER ;
#删除存储过程
DROP PROCEDURE IF EXISTS test;

#使用SIGNAL抛出异常
BEGIN
    IF pay<=0 THEN
    SIGNAL SQLSTATE '22003'
    SET MESSAGE_TEXT='Invalid pay amount';
    END IF;
END

#变量
--    |-User or Session variables
--    |SET @num=10;set @a=20;
--    |-Local variable
--    |DECLARE risk FLOAT4 DEFAULT 0;
--    SELECT COUNT(*),SUM(invoice_total)
--    INTO @num,@a
--    FROM invoices;
#局部变量的声明一定放在存储过程的开始
#DECLARE variable_name [,variable_name...] datatype [DEFAULT value];
#形如MySQL 的数据类型，如: int, float, date,varchar(length)
#DECLARE l_varchar varchar(255) DEFAULT 'This will not be padded';






#变量赋值
#SET 变量名 = 表达式值 [,variable_name = expression ...]

#用户变量有全局性，有点像全局变量
#通常以@开头

#调用存储过程
set @a=2;
call test(2,2);

#if-then-else-endif语句
#if __ then
# todo
#else
# todo
#end if;

#case语句
#     -> case var  
#    -> when 0 then   
#     -> insert into t values(17);  
#     -> when 1 then   
#     -> insert into t values(18);  
#     -> else   
#     -> insert into t values(19);  
#     -> end case; 

#循环语句
#     -> while var<6 do  
#     -> insert into t values(var);  
#     -> set var=var+1;  
#     -> end while;

#do while语句
#     -> repeat  
#     -> insert into t values(v);  
#     -> set v=v+1;  
#     -> until v>=5  
#     -> end repeat; 

#loop 循环不需要初始条件，这点和 while 循环相似，同时和 repeat 循环一样不需要结束条件, leave 语句的意义是离开循环。
#     -> LOOP_LABLE:loop  
#     -> insert into t values(v);  
#     -> set v=v+1;  
#     -> if v >=5 then 
#     -> leave LOOP_LABLE;  
#     -> end if;  
#     -> end loop;

# ITERATE迭代
#ITERATE 通过引用复合语句的标号,来从新开始复合语句:
#     -> LOOP_LABLE:loop  
#     -> if v=3 then   
#     -> set v=v+1;  
#     -> ITERATE LOOP_LABLE;  
#     -> end if;  
#     -> insert into t values(v);  
#     -> set v=v+1;  
#     -> if v>=5 then 
#     -> leave LOOP_LABLE;  
#     -> end if;  
#     -> end loop;




-- FUNCTIONS
-- 建立自己的函数：像聚集函数一样例如MIN MAX SUM等
-- 函数与存储过程很像，但是区别就是，函数只能返回单一的值
-- 与存储过程不同，函数不能返回有行有列的结果集
CREATE FUNCTION get_risk_factor_for_client
(
    client_id INT
)
RETURNS INTEGER
--DETERMINISTIC
READS SQL DATA
MODIFIES SQL DATA
BEGIN
    RETURN 1;
END

--删除函数
DROP FUNCTION IF EXISTS get_risk_factor_for_client;