set feedback off
set echo off
set verify off
set heading off
Prompt*****Show Order Details*****
Prompt
Prompt
Accept vOrderID prompt 'Please enter order ID:'
Select 'Order Status:', orderstatus from orders where orderID = '&vOrderID';
Prompt
Select customer.lastname||','||customer.firstname from orders inner join customer on orders.CustomerID=customer.customerID where orderID = '&vOrderID';
Select customer.address from orders inner join customer on orders.CustomerID=customer.customerID where orderID = '&vOrderID';
Select customer.State||customer.Zip from orders inner join customer on orders.CustomerID=customer.customerID where orderID = '&vOrderID';
Select '(' ||substr(Customer.PHONE,1,3)|| ')' ||substr (Customer.PHONE,4,3)|| '-' ||substr(Customer.PHONE,7,4) from orders inner join customer on orders.CustomerID=customer.customerID where orderID = '&vOrderID';
Prompt
Select 'ProductID:', ProductID from Orders where orderID = '&vOrderID';
Select 'Product Name:',products.Productname from orders inner join products on orders.ProductID=Products.productID where orderID = '&vorderid';
Select 'Unit Price:', To_Char(Products.Price, '$9,999.99') from orders inner join products on orders.ProductID=Products.productID where orderID = '&vorderid';
Select 'Quantity Ordered:', Qty from orders where orderid = '&vorderid';
Select 'Total:', To_Char(Products.Price * Orders.Qty,'$9,999.99') from orders inner join products on orders.ProductID=Products.productID where orderID = '&vorderid';
Prompt
Select 'Order Date:', Orderdate from orders where orderID = '&vOrderID';
Select 'Shipped Date:', Shipdate from orders where orderID = '&vOrderID';
Prompt
Select 'Shipping Warehouse:', Warehouses.Warehousecode from orders inner join warehouses on orders.Warehousecode=Warehouses.warehousecode where orderID = '&vOrderID';
Select Warehouses.Address from orders inner join warehouses on orders.Warehousecode=Warehouses.warehousecode where orderID = '&vOrderID';
Select warehouses.state||warehouses.zip from orders inner join warehouses on orders.Warehousecode=Warehouses.warehousecode where orderID = '&vOrderID';
Select '(' ||substr(Warehouses.PHONE,1,3)|| ')' ||substr (Warehouses.PHONE,4,3)|| '-' ||substr(Warehouses.PHONE,7,4) from orders inner join warehouses on orders.Warehousecode=Warehouses.warehousecode where orderID = '&vOrderID';