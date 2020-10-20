create database bai_tap_lam_them_01;
drop database bai_tap_lam_them_01;
use bai_tap_lam_them_01;
create table Products(
Id int,
Name nvarchar(50),
UmageUrl nvarchar(1000),
Price int,
Discount int,
Stock int,
CategoryId int,
SupplierId int,
Description nvarchar(1000));
create table Orders(
Id int,
CreatedDate datetime,
ShippedDate datetime,
Status varchar(50),
Description nvarchar(1000),
ShippingAddress nvarchar(500),
ShippingCity nvarchar(50),
PaymentType varchar(20),
Customer varchar(20),
Employee varchar(20));
