/*									高级SQL特性									*/
USE gaowanlu;

#创建表时添加主键
#CREATE TABLE data
#(
#	table_id INTEGER NOT NULL PRIMARY KEY,
#   user_name CHAR(50) NOT NULL,
#	user_password CHAR(50) NOT NULL
#);
#修改表时定义主键
#ALTER TABLE data
#ADD CONSTRAINT PRIMARY KEY(table_id);

#翻译-constaint(约束)：管理如何插入或处理数据库数据的原则

#外键:
#是表中的一列，其值必须在另一表的主键中
#也就是templae表中的data_table_id任意都是data中的table_id
#外键是保证引用完整性的及其重要部分。
#CREATE TABLE template
#(
#	 table_id INTEGER NOT NULL PRIMARY KEY,
#    data_table_id INTEGER NOT NULL REFERENCES data(table_id)
#);

#修改表时定义外键
#ALTER TABLE template
#ADD CONSTRAINT
#FOREIGN KEY (data_table_id) REFERENCES data (table_id);

#唯一约束
#类似于表的主键，但与主键不同的是一个表可以有多个唯一约束
#CREATE TABLE template_1
#(
#	 id INTEGER NOT NULL PRIMARY KEY,
#    name CHAR(20) NOT NULL UNIQUE
#);

#修改表时添加唯一约束
#ALTER TABLE <数据表名> ADD CONSTRAINT <唯一约束名> UNIQUE(<列名>);
#ALTER TABLE template_1
#ADD CONSTRAINT
#unique_name UNIQUE(name);

#删除唯一约束
#ALTER TABLE <表名> DROP INDEX <唯一约束名>;

#检查约束
#检查约束能用来保证一列(或一组列)中的数据满足一组指定的条件
# 值大小 范围(如日期) 只允许特定的值
/*
CREATE TABLE template_2
(
	id INTEGER NOT NULL PRIMARY KEY,
    num INTEGER NOT NULL CHECK (num>0 AND num<100),
    str CHAR(10) NOT NULL CHECK (str LIKE '[MF]')
);
*/
#str只包含M或F

#索引
#主键总是有序的，索引就像hash表一样快速找到目标
#CREATE INDEX num_ind
#ON template_2(num);
#CREATE INDEX <索引名称> ON <表名>(<列名>)

#触发器
/*
*触发器是特殊的存储过程，它在特定的数据库活动发生时自动执行
*触发器可以与特定表上的INSERT、UPDATE、DELETE操作(或组合)相关联
*
*	CREATE <触发器名> < BEFORE | AFTER >
*	<INSERT | UPDATE | DELETE >
*	ON <表名> FOR EACH Row<触发器主体>
*/

#BEFORE触发器
#mysql> CREATE TRIGGER SumOfSalary
#    -> BEFORE INSERT ON tb_emp8
#    -> FOR EACH ROW
#    -> SET @sum=@sum+NEW.salary;

#AFTER触发器
#mysql> CREATE TRIGGER double_salary
#    -> AFTER INSERT ON tb_emp6
#    -> FOR EACH ROW
#    -> INSERT INTO tb_emp7
#    -> VALUES (NEW.id,NEW.name,deptId,2*NEW.salary);

#序列
#MySQL 序列是一组整数：1, 2, 3, ...，由于一张数据表只能有一个字段自增主键
#如果你想实现其他字段也实现自动增加

#使用AUTO_INCREMENT
#创建了数据表insect
#insect表中的id无需指定值可实现自动增长
#CREATE TABLE template_3
#(
#	id INT unsigned NOT NULL auto_increment,
#    primary key(id),
#    user_name CHAR(10) NOT NULL
#);

INSERT INTO template_3
VALUES
(NULL,"gao"),
(NULL,"zhang"),
(NULL,"li");

SELECT *
FROM template_3;








