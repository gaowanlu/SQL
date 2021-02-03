/*                             第12节           联结表                                        */

#等值联结
SELECT vend_name,Vendors.prod_name,Products.prod_price
FROM Cendors,Products
WHERE Vendors.vend_id=Products.vend_id;
# 在联结两个表时，实际要做的是将表中的每一行与其他表的每一行进行配对
# 但会出现，在变的id有另一个没有，也就是可能会出现不能一一匹配

#内联结
SELECT vend_name,prod_name,prod_price
FROM Vendors
INNER JOIN Products ON Vendors.vend_id=Products.vend_id;

#联结多个表
SELECT prod_name,vend_name,prod_price,quantity
FROM OrderItems,Products,Vendors
WHERE Products.vend_id=Vendors.vend_id
	AND OrderItems.prod_id=Products.prod_id
    AND order_num=20007;
#先联结，后order_num=20007过滤行















