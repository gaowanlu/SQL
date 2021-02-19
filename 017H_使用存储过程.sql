/*                                                     使用存储过程                                                      */
DELIMITER //
#删除存储过程
DROP procedure test;
#参数种类

#IN 输入参数：表示调用者向过程传入值（传入值可以是字面量或变量）
#OUT 输出参数：表示过程向调用者传出值(可以返回多个值)（传出值只能是变量）
#INOUT 输入输出参数：既表示调用者向过程传入值，又表示过程向调用者传出值（值只能是变量）

#创建存储过程
create procedure test(in a integer,in b integer)
BEGIN
	SELECT *
    FROM clients;
    set a=2*a;
    SELECT @a;#用户变量
    SELECT a+b;
END;//

#变量

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




