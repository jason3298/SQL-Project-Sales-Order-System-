set feedback off
set echo off
set verify off
set heading off
Prompt*----open an order----*
Prompt
Prompt
Select 'Today:', sysdate from dual;
accept vCUSTOMERID prompt 'Please enter customer number:'
select 'Name of Customer:'||Initcap(Lastname)|| ',' ||Initcap(Firstname) from customer WHERE CUSTOMERID = '&vCUSTOMERID';
Select 'Shipping Address:', Address from customer WHERE CUSTOMERID = '&vCUSTOMERID';
Select 'State Zip:' ||State||' '||Zip from customer WHERE CUSTOMERID = '&vCUSTOMERID';
select' Phone:(' ||substr(PHONE,1,3)|| ')' ||substr (PHONE,4,3)|| '-' ||substr(PHONE,7,4) from customer WHERE CUSTOMERID = '&vCUSTOMERID';
Prompt
accept vProductID prompt 'Enter Product ID:'
Select 'ProductID:', productID from products WHERE productID = '&vProductID';
Select 'Product Name:', Productname from products WHERE productID = '&vProductID';
Select 'Unit Price:',To_char(price,'$9,9999.99') from products WHERE productid = '&vproductid';
Prompt Please choose from the following warehouse: 
set heading on
Select * From Inventory WHERE productID = '&vProductID';
accept vWarehousecode prompt 'Enter Warehouse code:'
accept vqty prompt 'Enter quantity ordered:'
set heading off
select 'total:',To_char(&vQty*price,'$9,999.99') from products where productID = '&vProductId';
Prompt
prompt*****Order Status: Open
Set heading off
Select '--->Order number is', Ord.NextVal from dual;
insert into orders values (ord.currval, sysdate, '&vCUSTOMERID', '&vProductID','&vqty',(Select Price from products WHERE productid = '&vproductid'),'&vWarehousecode','Open', Null);
 
