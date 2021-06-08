-- 创建医院管理系统数据库
DROP DATABASE IF exists dbb;
CREATE DATABASE dbb;
USE dbb;
DROP TABLE IF exists 用户;
-- 创建用户表
CREATE TABLE 用户
(
	用户编号 INT unsigned NOT NULL auto_increment,
    primary key(用户编号),
    身份证号码 char(18) NOT NULL unique,
    联系电话 char(11) NOT NULL,
    姓名 varchar(20) NOT NULL
);

-- 向用户表插入数据
INSERT INTO 用户(身份证号码,联系电话,姓名)
VALUES
('410526200112218978','13346637702','高万禄'),
('410526200112218975','13346637702','李红');

SELECT *
FROM 用户;

-- 创建科室表
DROP TABLE IF exists 科室;
CREATE TABLE 科室
(
	科室编号 INT unsigned NOT NULL auto_increment unique,
    primary key(科室编号),
    科室名称 varchar(20) NOT NULL unique
);
-- 向科室插入数据
INSERT INTO 科室(科室名称)
VALUES
('放射科'),
('内科'),
('外科');
SELECT *
FROM 科室;

-- 创建职工表
DROP TABLE IF exists 职工;
CREATE TABLE 职工
(
	职工编号 INT unsigned NOT NULL auto_increment unique,
    primary key(职工编号),
    姓名 VARCHAR(20) NOT NULL,
    身份证号码 CHAR(18) NOT NULL UNIQUE,
    联系电话 CHAR(11) NOT NULL,
    科室编号 INT unsigned NOT NULL references 科室(科室编号),
    职务 VARCHAR(15) NOT NULL
); 

INSERT INTO 职工(姓名,身份证号码,联系电话,科室编号,职务)
VALUES
('李华','身份证号码','13346637702',1,'主任');
SELECT *
FROM 职工;

DROP TABLE if exists 医院检查项目;
CREATE TABLE 医院检查项目
(
	项目编号 INT unsigned NOT NULL auto_increment unique,
    primary key(项目编号),
    项目名称 VARCHAR(20) NOT NULL UNIQUE,
    项目费用 FLOAT NOT NULL CHECK(项目费用>=0)
);
-- 插入医院有的检查项目
INSERT INTO 医院检查项目(项目名称,项目费用)
VALUES
('核磁共振检查',300);
SELECT *
FROM 医院检查项目;


-- 创建医院药品表
DROP TABLE IF exists 医院药品;
CREATE TABLE 医院药品
(
	药品序号 INT unsigned NOT NULL auto_increment unique,
    PRIMARY KEY(药品序号),
	药品编码 CHAR(14) NOT NULL UNIQUE ,
    药品名称 VARCHAR(20) NOT NULL,
    单位 VARCHAR(8) NOT NULL,
    价格 float not null CHECK(价格>=0),
    库存量 INT unsigned not null CHECK(库存量>=0)
);
-- 插入药品
INSERT INTO 医院药品(药品编码,药品名称,单位,价格,库存量)
VALUES
('12345678912345','青霉素注射剂','支',3,1000);
SELECT *
FROM 医院药品;

-- 医院理疗项目
DROP TABLE if exists 医院理疗项目;
CREATE TABLE 医院理疗项目
(
	理疗项目编码 INT unsigned NOT NULL auto_increment unique,
    项目名称 VARCHAR(20) NOT NULL,
    价格 FLOAT NOT NULL CHECK(价格>=0)
);
-- 插入理疗项目
INSERT INTO 医院理疗项目(项目名称,价格)
VALUES
('针灸',200);
SELECT *
FROM 医院理疗项目;


-- 医院手术项目
DROP TABLE if exists 医院手术项目;
CREATE TABLE 医院手术项目
(
	手术项目编码 INT unsigned NOT NULL auto_increment unique,
    项目名称 VARCHAR(20) NOT NULL,
    价格 FLOAT NOT NULL CHECK(价格>=0)
);
-- 插入手术项目
INSERT INTO 医院手术项目(项目名称,价格)
VALUES
('骨折修复',10000);
SELECT *
FROM 医院手术项目;

-- 手术室地点
DROP TABLE if exists 医院手术室;
CREATE TABLE 医院手术室
(
	手术室编号  INT unsigned NOT NULL auto_increment unique,
    位置 VARCHAR(20) UNIQUE NOT NULL
);

-- 插入手术室
INSERT INTO 医院手术室(位置)
VALUES ('2-3-23');
SELECT *
FROM 医院手术室;

-- 医保信息
DROP TABLE IF EXISTS 医保信息;
CREATE TABLE 医保信息
(
	用户编号 INT unsigned NOT NULL UNIQUE references 用户(用户编号),
    primary key(用户编号),
    医保号码 VARCHAR(20) NOT NULL UNIQUE
);

-- 为用户编号1用户绑定医保信息
INSERT INTO 医保信息(用户编号,医保号码)
VALUES(1,'213243543');
SELECT *
FROM 医保信息;

-- 挂号表
DROP TABLE IF EXISTS 挂号信息;
CREATE TABLE 挂号信息
(
	挂号编码 INT unsigned NOT NULL auto_increment unique,
    primary key(挂号编码),
    挂号用户编码 int unsigned NOT NULL references 用户(用户编码),
    挂号时间 DATETIME NOT NULL,
    就诊时间 DATETIME NOT NULL,
    就诊类型 VARCHAR(2) CHECK(就诊类型 IN('急诊','门诊')),
    挂号费用 FLOAT NOT NULL CHECK(挂号费用>=0),
    科室编号 INT unsigned NOT NULL references 科室(科室编号)
);

-- 添加挂号信息
INSERT INTO 挂号信息(挂号用户编码,挂号时间,就诊时间,就诊类型,挂号费用,科室编号)
VALUES
(1,NOW(),NOW(),'急诊',5,1);
SELECT *
FROM 挂号信息;

-- 门诊受理
DROP TABLE if exists 门诊受理;
CREATE TABLE 门诊受理
(
	挂号编码 INT unsigned NOT NULL unique references 挂号信息(挂号编码),
    医师编码 INT unsigned NOT NULL references 职工(职工编号),
    受理时间 DATETIME NOT NULL,
    primary key(挂号编码)
);

-- 创建门诊药单
DROP TABLE IF exists 门诊药单;
CREATE TABLE 门诊药单
(
	门诊药单编码  INT unsigned NOT NULL auto_increment unique PRIMARY KEY,
	挂号编号 INT unsigned NOT NULL references 挂号信息(挂号编号),
    药品序号 INT unsigned NOT NULL references 医院药品(药品序号),
    数量 INT unsigned NOT NULL CHECK(数量>=0),
    用药注意事项 VARCHAR(100),
    用药原因 VARCHAR(100)
); 
-- 添加门诊药单
INSERT INTO 门诊药单(挂号编号,药品序号,数量,用药注意事项,用药原因)
VALUES
(1,1,2,'注意过敏','用于消炎');
SELECT * FROM 门诊药单;

-- 门诊诊断结果报告
DROP TABLE IF exists 门诊结果;
CREATE TABLE 门诊结果
(
	挂号编号  INT unsigned NOT NULL references 挂号信息(挂号编号),
    报告内容 VARCHAR(100) NOT NULL,
    报告类型 VARCHAR(2) NOT NULL CHECK (报告类型 IN ("初检","二检")),
    primary key(挂号编号,报告类型)
);

-- 检查事项
DROP TABLE IF EXISTS 检查事项;
CREATE TABLE 检查事项
(
	检查事项编号  INT unsigned NOT NULL auto_increment unique PRIMARY KEY,
	挂号编号   INT unsigned NOT NULL references 挂号信息(挂号编号),
    检查项目编号 INT unsigned NOT NULL references 医院检查项目(项目编号),
    检查时间 DATETIME NOT NULL,
    是否已检查 BOOLEAN NOT NULL DEFAULT FALSE,
    医保抵消后应缴费用 FLOAT NOT NULL CHECK (医保抵消后应缴费用>=0),
    已交费用 FLOAT NOT NULL CHECK (已交费用>=0)
);

-- 门诊抓药
DROP TABLE IF exists 门诊抓药;
CREATE TABLE 门诊抓药
(
	门诊药单编号 INT unsigned NOT NULL references 门诊药单(门诊药单编号),
    primary key(门诊药单编号),
    医保抵消后应缴费用 FLOAT NOT NULL CHECK (医保抵消后应缴费用>=0),
    已交费用 FLOAT NOT NULL CHECK (已交费用>=0)
);

-- 入院信息
DROP TABLE IF exists 住院信息;
CREATE TABLE 住院信息
(
	住院编码  INT unsigned NOT NULL auto_increment unique PRIMARY KEY,
    住院者编号 INT unsigned NOT NULL references 用户(用户编号),
    入院来源 VARCHAR(20) NOT NULL,
    房号 VARCHAR(20),
    床号 VARCHAR(10),
    饮食等级 VARCHAR(10) NOT NULL,
    看护等级 VARCHAR(10) NOT NULL,
    住院费用 FLOAT NOT NULL CHECK(住院费用>=0),
	医保抵消后应缴费用  FLOAT NOT NULL CHECK(医保抵消后应缴费用>=0),
    已交费用 FLOAT NOT NULL CHECK(已交费用>=0),
    入院时间 DATETIME NOT NULL,
    出院时间 DATETIME DEFAULT NULL
);

-- 住院检查
DROP TABLE IF exists 住院检查;
CREATE TABLE 住院检查
(
	住院检查编码 INT unsigned NOT NULL auto_increment unique PRIMARY KEY,
    住院编码 INT unsigned NOT NULL references 住院信息(住院编码),
    检查项目编码 INT unsigned NOT NULL references 医院检查项目(项目编号),
    费用 FLOAT NOT NULL CHECK(费用>=0),
    医保抵消后应缴费用  FLOAT NOT NULL CHECK(医保抵消后应缴费用>=0),
    已交费用 FLOAT NOT NULL CHECK(已交费用>=0),
    检查时间 DATETIME DEFAULT NULL
);

-- 住院手术
DROP TABLE IF EXISTS 住院手术;
CREATE TABLE 住院手术
(
	住院手术编码 INT unsigned NOT NULL auto_increment unique PRIMARY KEY,
    住院编码 INT unsigned NOT NULL references 住院信息(住院编码),
    手术项目编码 INT unsigned NOT NULL references 医院手术项目(项目编号),
    费用 FLOAT NOT NULL CHECK(费用>=0),
    医保抵消后应缴费用  FLOAT NOT NULL CHECK(医保抵消后应缴费用>=0),
    已交费用 FLOAT NOT NULL CHECK(已交费用>=0)
);

-- 住院理疗
DROP TABLE IF EXISTS 住院理疗;
CREATE TABLE 住院理疗
(
	住院理疗编码 INT unsigned NOT NULL auto_increment unique PRIMARY KEY,
    住院编码 INT unsigned NOT NULL references 住院信息(住院编码),
    理疗项目编码 INT unsigned NOT NULL references 医院理疗项目(项目编号),
    费用 FLOAT NOT NULL CHECK(费用>=0),
    医保抵消后应缴费用  FLOAT NOT NULL CHECK(医保抵消后应缴费用>=0),
    已交费用 FLOAT NOT NULL CHECK(已交费用>=0),
    理疗时间 DATETIME DEFAULT NULL
);


-- 排班任务
DROP TABLE IF EXISTS 排班任务;
CREATE TABLE 排班任务
(
	排班编码 INT unsigned NOT NULL auto_increment unique PRIMARY KEY,
    职工编码 INT unsigned NOT NULL references 职工(职工编号),
    开始时间 DATETIME NOT NULL,
    结束时间 DATETIME NOT NULL,
    科室编码 INT unsigned NOT NULL references 科室(科室编码),
    任务事项 VARCHAR(50) NOT NULL,
    地点 VARCHAR(20) NOT NULL
);

-- 手术任务
DROP TABLE IF EXISTS 手术任务;
CREATE TABLE 手术任务
(
	住院手术编码 INT unsigned NOT NULL auto_increment unique PRIMARY KEY references 住院手术(住院手术编码),
    手术开始时间 DATETIME NOT NULL,
    手术结束时间 DATETIME DEFAULT NULL,
    手术室编码 INT unsigned NOT NULL references 医院手术室(手术室编码),
    手术过程记录 VARCHAR(100) DEFAULT ""
);