drop table orders;
drop table inventory;
Drop table customer;
Drop table products;
drop table warehouses;
drop sequence Ord;
Create table customer ( CustomerID Number PRIMARY KEY, FirstName VARCHAR2(30) NOT NULL, LastName VARCHAR2(30) NOT NULL, Address VARCHAR2(30) NOT NULL, State Varchar2(5) Not null, Zip varchar2(7), Phone Number);
Create table products (ProductID VARCHAR2(10) Primary key, ProductName Varchar2(20) NOT NULL, Price Number);
create table warehouses (Warehousecode VARCHAR2(15) Primary key, Address varchar2(30) NOT NULL, State Varchar2(5) Not null, Zip varchar2(7), Phone Number);
Create table orders (OrderID Number Not Null Primary key, Orderdate Date, CustomerID number references Customer(customerID), ProductID Varchar2(10) references products(ProductID), Qty number not null, Unitprice Number not null , Warehousecode Varchar2(15) references warehouses(warehousecode), orderstatus varchar2(20), shipdate date);
Create table Inventory(ProductID VARCHAR2(10)  references products(productID), warehousecode VARCHAR2(15) references warehouses(warehousecode), Qty number ,Constraint PK_Inventory Primary Key (ProductID, Warehousecode));
create sequence Ord start with 1116;
insert into customer (CustomerID, FirstName, Lastname, Address, State, zip, Phone) Values ('101', 'Jason','Ngo', '8282 miami cir','CA','92541', '7143621773');
insert into customer (CustomerID, FirstName, Lastname, Address, State, zip, Phone) Values ('102', 'Vivian','phan', '101 fifth ave','Ca','45621', '1111111111');
insert into customer (CustomerID, FirstName, Lastname, Address, State, zip, Phone) Values ('103', 'Cody','pham', '123 Oregon str','OR','58462', '2222222222');
insert into customer (CustomerID, FirstName, Lastname, Address, State, zip, Phone) Values ('104', 'Steve', 'Pushes','9242 gale ave','AR','14785', '3333333333');
insert into customer (CustomerID, FirstName, Lastname, Address, State, zip, Phone) Values ('105', 'andy','Wen','789 Madrid ave','WA','45698','4444444444');

Insert into products (productID, Productname, Price) Values ('p1','pencil','1.00');
Insert into products (productID, Productname, Price) Values ('p2','pen','1.20');
Insert into products (productID, Productname, Price) Values ('p3','eraser','1.15');
Insert into products (productID, Productname, Price) Values ('p4','notesbook','2.00');
Insert into products (productID, Productname, Price) Values ('p5','books','2.50');

insert into warehouses (Warehousecode, Address,State,Zip,Phone) Values ('OC', '123 Orange County','CA','93214', '1231231234');
insert into warehouses (Warehousecode, Address,State,Zip,Phone) Values ('LA', '456 Los Angeles','CA','90254', '2342342345');
insert into warehouses (Warehousecode, Address,State,Zip,Phone) Values ('IRV', '567 Irvine','CA','91376', '5675675678');

insert into orders (OrderID, orderdate, CustomerID, ProductID, Qty, Unitprice, Warehousecode, Orderstatus, Shipdate) values ('1111','12-oct-19','101','p1','12','1.00','OC','Shipped','14-oct-19');
insert into orders (OrderID, orderdate, CustomerID, ProductID, Qty, Unitprice, Warehousecode, Orderstatus, Shipdate) values ('1112','22-oct-19','102','p2','15','1.2','LA','Shipped','25-oct-19');
insert into orders (OrderID, orderdate, CustomerID, ProductID, Qty, Unitprice, Warehousecode, Orderstatus, Shipdate) values ('1113','25-OCT-19','103','p3','14','1.15','IRV','Shipped','27-oct-19');
insert into orders (OrderID, orderdate, CustomerID, ProductID, Qty, Unitprice, Warehousecode, Orderstatus) values ('1114','30-OCT-19','104','p4','200','2.00','LA','Rejected');
insert into orders (OrderID, orderdate, CustomerID, ProductID, Qty, Unitprice, Warehousecode, Orderstatus) values ('1115','15-NOV-19','105','p5','25','2.5','OC','In Process');

insert into inventory (ProductID, Warehousecode, Qty) Values ('p1','OC', '100');
insert into inventory (ProductID, Warehousecode, Qty) Values ('p2','LA', '150');
insert into inventory (ProductID, Warehousecode, Qty) Values ('p3','IRV', '90');
insert into inventory (ProductID, Warehousecode, Qty) Values ('p4','LA', '180');
insert into inventory (ProductID, Warehousecode, Qty) Values ('p5','OC', '30');
Commit;

Select * from customer;
Select * from products;
Select * From warehouses;
Select * from inventory;
Select * from orders;