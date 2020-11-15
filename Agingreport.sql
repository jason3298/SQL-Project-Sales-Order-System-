set feedback off
set echo off
set verify off
set heading off
Prompt
Prompt****Aging report****
Select 'Today''s date:', sysdate from dual;
Prompt
Prompt
Column ORDERDATE HEADING 'ORDER|DATE' FORMAT 9999
Column ORDERSTATUS HEADING 'ORDER|STATUS' FORMAT A11
Column Productname HEADING 'Product|Description' FORMAT A12
Column Qty HEADING 'Quantity|Ordered' Format 99,999
Column unitprice HEADING 'Unit|Price' Format $9,999.99
Column totalamt HEADING 'Total|Amount' Format $9,999.99
Column daysopen HEADING 'Days|Open' Format 9999
Set heading on 

select orderID,orderdate, orderstatus,Orders.productID,productname,qty,unitprice,
Qty*unitprice as totalamt,Floor (sysdate - orderdate) as daysopen
 from orders inner join products on orders.productID = products.productID where orderstatus = 'Open' ;