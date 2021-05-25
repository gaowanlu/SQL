/*                                                     管理事务处理                                                      */
USE gaowanlu;
#如何利用COMMIT和ROLLBACK语句管理事务处理;

#事务(transaction)指一组SQL语句
#回退(rollback)指撤销指定SQL语句的过程
#提交(commit)指将为存储的SQL语句结果写入数据库表
#保留点(savepoint)指事务处理中设置的临时占位符(placeholder)
#可以对它发布退回(与回退整个事务处理不同)

#可以回退哪些语句?
/*事务处理用来管理INSERT UPDATE DELETE语句。不能回退SELECT语句（回退SELECT语句也没有必要）,
也不能回退CREATE DROP操作，事务处理中可以使用这些操作，但进行回退时，这些操作也不撤回。
*/
#控制事务处理
START TRANSACTION;
INSERT INTO person VALUE(5,"wangming");
INSERT INTO person VALUE(6,"wangming");
ROLLBACK;#撤销INSERT UPDATE DELETE操作
COMMIT;   #使用COMMIT提交事务处理结果

#使用保留点
START TRANSACTION;
INSERT INTO person VALUE(5,"wangming");
SAVEPOINT addwangming;
INSERT INTO person VALUE(6,"xiao");
ROLLBACK TO addwangming;
COMMIT;

SELECT *
FROM person;
