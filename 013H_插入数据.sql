/*                                     第15课      插入数据                                     */
USE sql_invoicing;
SELECT *
FROM clients;

# 插入完整的行
#INSERT INTO clients
#VALUES(10,"刘微","china","anyang","CN","133-456-8956");

#更规范的写法
#INSERT INTO clients(client_id,name,address,city,state,phone)
#VALUES
#(11,"刘微","china","anyang",DEFAULT,NULL),
#(13,"刘","china","anyang",DEFAULT,NULL);
#插入部分行
#只需要使用上面更规范的写法，进而可以指定哪些插入值

#插入检索出的数据
#INSERT INTO clients(client_id,name,address,city,state,phone)
#SELECT client_id,name,address,city,state,phone
#FROM clients;

#从一个表复制到另一个表
CREATE TABLE custcpoy AS SELECT * FROM clients;

SELECT *
FROM custcpoy;
