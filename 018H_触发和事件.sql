#创建触发器:例
DELIMITER $$
CREATE TRIGGER payments_after_insert
    AFTER--BEFORE
    DELETE-- INSERT UPDATE
    ON payments
    FOR EACH ROW-- 加入插入了5行，每行都会执行，否则执行一次
BEGIN
    UPDATE invoices
    SET payment_total=payment_total+NEW.amount
    WHERE invoice_id=NEW.invoice_id;
END$$
DELIMITER ;

-- NEW:新行元组 OLD:老行元组

-- 查看触发器
SHOW TRIGGERS LIKE 'payments%';

--删除触发器
DROP TRIGGER IF EXISTS payments_after_insert;



--事件 Events
--定时执行
SHOW VARIABLES;--mysql 中的环境变量
--开启事件
SHOW VARIABLES LIKE 'event%';
--event_scheduler ON
SET GLOBAL event_scheduler=ON--OFF

#创建事件
DELIMITER $$
CREATE EVENT yearly_delete_audit_rows
ON SCHEDULE
    AT '2021-05-26'
    --EVERY 1 HOUR-- 2 DAY --2 YEAR
    --EVERY 1 YEAR STARTS '2019-01-01' ENDS '2029-01-01'
DO BEGIN 
    DELETE FROM payments_audit
    WHERE action_date<NOW()-INTERVAL 1 YEAR;
END $$
DELIMITER ;
-- 查看事件
SHOW EVENTS;
-- 删除事件
DROP EVENT IF EXISTS yearly_delete_audit_rows;
--修改事件
DELIMITER $$
ALTER EVENT yearly_delete_audit_rows
ON SCHEDULE
    AT '2021-05-28'
    --EVERY 1 HOUR-- 2 DAY --2 YEAR
    --EVERY 1 YEAR STARTS '2019-01-01' ENDS '2029-01-01'
DO BEGIN 
    DELETE FROM payments_audit
    WHERE action_date<NOW()-INTERVAL 1 YEAR;
END $$
DELIMITER ;

--启动事件
ALTER EVENT yearly_delete_audit_rows ENABLE;
--关闭事件
ALTER EVENT yearly_delete_audit_rows DISABLE;