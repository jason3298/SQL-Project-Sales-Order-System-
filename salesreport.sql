set feedback off
set echo off
set verify off
set heading on
Prompt
Prompt*****Sales Report*****
Column ProductName HEADING 'Product | Name' 
Column NumberOfOrders Heading 'No Of | Orders' format '9,999,999'
Column Totalqty Heading 'TOTAL|QTY' format '9,999,999'
Column TotalAmt Heading 'Total|Amount' Format '$999,999.99'

Select Products.ProductID, ProductName, To_Char(orderDate, 'mm/yyyy') AS Month,
COUNT(*) as NumberOfOrders,
SUM(qty) as totalqty,
SUM(Qty*unitprice) as TotalAmt
FROM orders,products
WHERE Products.productid=Orders.ProductID 
GROUP BY Products.productid, ProductName, (orderdate,'MM/yyyy')
ORDER BY Products.productid;