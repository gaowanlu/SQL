-- conceptual-》 logical-》 physical
-- 概念          逻辑    实体
    ER           关系       一张张表

-- ER图绘制
www.draw.io

-- 1NF
没有重复的行，每条数据可以唯一确定

-- 2NF
满足1NF
没有依赖任何关系的其他子集的非主键字段
-- 2NF告诉我们，每张表都应该是单一功能的，换句话说，它仅能表示一个实体类型
-- 这张表的所有字段都是用来描述这个特定的实体的
ORDERS 1NF
order_id date  name
1      ...      hi
2      ...      hi
2NF
ORDERS 1NF
order_id date customer_id
1       ...     1
1       ...     1
CUSTOMERS
customer_id name
1            hi


-- 3NF
满足2NF
所有表中的字段都只依赖于主键与其他的字段值无关

INVOICES
...    invoice_total payment_total  balance
        100             40         60(100-40)
blance依赖于invoice_total payment_total


-- 不要设想数据库模型将来要应对的情况，一般想出来的情况都不会出现
-- 只会让我们的解决方案变得复杂
-- 只关注眼前的需求找出最佳解法
-- 而不是考虑还没发生的问题


