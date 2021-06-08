----------------------------------  账户和权限  -----------------------------------------
-- 创建用户
CREATE USER `john@允许访问的ip` IDENTIFIED BY '1232nfdb1dvfd3nhng13fdv';

-- 查看用户
SELECT * FROM mysql.user;

--删除用户
DROP USER `john@允许访问的ip`;

--修改密码
SET PASSWORD FOR `john@允许访问的ip`='1234frfe';
--为当前登录的用户更改密码
SET PASSWORD ='2324234';


--授予权限
GRANT SELECT,INSERT,UPDATE,DELETE,EXECUTE
ON sql_store.*
TO  `john@允许访问的ip`；

--授予能够创建表\创建触发器\修改现有表
PRIVILEGES provided by mysql,summary of available PRIVILEGES 

GRANT ALL 
ON sql_store.* -- *.*
TO `john@允许访问的ip`;

-- width grant option(不仅允许用户拥有这个权限，还可以将授予的权限再授予给他人)


--查看权限
SHOW GRANTS FOR `john@允许访问的ip`;
--查看当前用户权限
SHOW GRANTS;

--撤销权限
REVOKE CREATE VIEW 
ON sql_store.*
FROM `john@允许访问的ip`;


1、with admin option 用于系统权限授权，with grant option 用于对象授权。

2、给一个用户授予系统权限带上with admin option 时，此用户可把此系统权限授予其他用户或角色，
但收回这个用户的系统权限时，这个用户已经授予其他用户或角色的此系统权限不会因传播无效，
如授予A系统权限create session with admin option,然后A又把create session权限授予B,
但管理员收回A的create session权限时，B依然拥有create session的权限，
但管理员可以显式收回B create session的权限，即直接revoke create session from B. 
而with grant option用于对象授权时，被授予的用户也可把此对象权限授予其他用户或角色，
不同的是但管理员收回用with grant option授权的用户对象权限时，权限会因传播而失效，
如：grant select on 表名 to A with grant option;，A用户把此权限授予B，但管理员收回A的权限时，
B的权限也会失效，但管理员不可以直接收回B的SELECT ON TABLE 权限。  执行授权语句报错（ora-01031，ora-01929）时，可参考一下。
相同点：
- 两个都可以既可以赋予user 权限时使用，也可以在赋予role 时用 GRANT CREATE SESSION TO emi WITH ADMIN OPTION;
 GRANT CREATE SESSION TO role WITH ADMIN OPTION; GRANT role1 to role2 WITH ADMIN OPTION; 
  GRANT select ON customers1 TO bob WITH GRANT OPTION;  GRANT select ON customers1 TO hr_manager(role) WITH GRANT OPTION; 
    - 两个受赋予者，都可以把权限或者role 再赋予other users  - 两个option 都可以对DBA 和APP ADMIN 管理带来方便性，但同时，
    都带来不安全的因素
不同点：  - with admin option 只能在赋予 system privilege 的时使用 - with grant option 只能在赋予
 object privilege 的时使用

- 撤消带有admin option 的system privileges 时，连带的权限将保留

--加with grant option
A->B
则B可->C
但C！——》A


--REVOKE
REVOKE<权限>[,<权限>]...
ON <对象类型><对象名>[,<对象类型><对象名>]...
FROM <用户>[,<用户>]...[CASCADE|RESTRICT]
例:
REVOKE INSERT
ON TABLE SC
FROM U5 CASCADE;
U5->U6->U7
撤销了U5 同时撤销了U6 U7

--创建数据库模式的权限
CREATE USER <username> [WITH] [DBA|RESOURCE|CONNECT]
只有超级用户才可以创建一个新的数据库用户


--使用角色
CREATE ROLE <角色名>;
--给角色授予权限
GRANT <权限>,[....]
ON <对象类型>对象名
TO 角色、角色...;
-- 将角色授予其他的角色或用户
GRANT 角色、角色...
TO 角色、用户...
[WITH ADMIN OPTION]
--添加WITH ADMIN OPTION，则获得某种权限的角色和用户还可以把这种权限授予给其他的角色;

--角色权限的收回
REVOKE 权限、权限
ON <对象类型><对象名>
FROM 角色、角色;
