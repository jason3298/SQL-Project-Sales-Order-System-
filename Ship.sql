set feedback off
set echo off
set verify off
set heading off
Prompt******Update Shipping******
Select 'Today Date:', sysdate from dual;
Prompt
Accept vOrderID prompt 'Please enter Order Number:'
Select 'Order Number is:', OrderID from orders where orderID = '&vOrderID';
Select 'Order Date:', Orderdate from orders where OrderID = '&vOrderID';
Select 'Customer Number:', CustomerID from orders where OrderID = '&vOrderID';
Select customer.lastname||','||customer.firstname from orders inner join customer on orders.CustomerID=customer.customerID where orderID = '&vOrderID';
Select customer.address from orders inner join customer on orders.CustomerID=customer.customerID where orderID = '&vOrderID';
Select customer.State||customer.Zip from orders inner join customer on orders.CustomerID=customer.customerID where orderID = '&vOrderID';
Select '(' ||substr(Customer.PHONE,1,3)|| ')' ||substr (Customer.PHONE,4,3)|| '-' ||substr(Customer.PHONE,7,4) from orders inner join customer on orders.CustomerID=customer.customerID where orderID = '&vOrderID';
Select 'ProductID:', ProductID from Orders where orderID = '&vOrderID';
Select 'Product Name:',products.Productname from orders inner join products on orders.ProductID=Products.productID where orderID = '&vorderid';
Select 'Unit Price:', Products.Price from orders inner join products on orders.ProductID=Products.productID where orderID = '&vorderid';
Select 'Quantity Ordered:', Qty from orders where orderid = '&vorderid';
Select 'Shipping Warehouse:', Warehousecode from orders where orderid = '&vOrderID';
Select Warehouses.Address from orders inner join warehouses on orders.Warehousecode=Warehouses.warehousecode where orderID = '&vOrderID';
Select warehouses.state||warehouses.zip from orders inner join warehouses on orders.Warehousecode=Warehouses.warehousecode where orderID = '&vOrderID';
Select '(' ||substr(Warehouses.PHONE,1,3)|| ')' ||substr (Warehouses.PHONE,4,3)|| '-' ||substr(Warehouses.PHONE,7,4) from orders inner join warehouses on orders.Warehousecode=Warehouses.warehousecode where orderID = '&vOrderID';
Accept vShipdate prompt 'Please enter Date Shipped(yyyy/mm/dd):'
Update Orders Set Orderstatus = 'Shipped', Shipdate = to_date('&vShipdate','YYYY/MM/DD') Where OrderID = '&vOrderID';
Prompt
Prompt ******************
Prompt Order is now----> SHIPPED
Select 'Date Shipped:', Shipdate from orders where orderID = '&vOrderID';
Select 'Quantity Shipped:', Qty from orders where orderid = '&vorderid';
Select 'Total Amount Shipped:',To_Char(Qty*unitprice,'$9,999.99') from orders where orderid = '&vorderid';
