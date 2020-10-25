drop database Bai_tap_01;
create database Bai_tap_01;
use Bai_tap_01;
create table products(
Id int auto_increment primary key,
productCode varchar(50) not null ,
productName varchar(50) not null,
productPrice int not null,
productAmount int not null,
productDescription text null,
productStatus varchar(50) not null);

explain select * from products;
create index UniqueIndex on products(productCode);
create index CompositeIndex on products(productName ,productPrice);

show index from products;
insert into products value (null,'B','Exeter 2020',1500,15,'kl','kl');
insert into products value (null,'L', 'Thinkpad P55',3000,10,'kl','lk');
insert into products value (null,'SP',' Bphone B40',550, 11,'kl','kl');
insert into products value (null,'B','Winner',1300,32,'kl','lk');
insert into products value (null,'L','Dell Prection 7510',2000,10,'jk','kj');
insert into products value (null, 'L', 'Hp Zbook 15 g7', 2500, 12,'jk','jk');
create view InforProduct as
select productCode, productName, productPrice, productStatus
from products;

select * from InforProduct;
update inforproduct 
set productPrice = 5500
where productName ='Bphone B40';

drop view InforProduct;

delimiter //
create procedure showAllProduct()
begin
select * from products;
end//
delimiter ;

delimiter //
create procedure addNewProduct(
newProductCode varchar(50),
newProductName varchar(50),
newProductPrice int,
newProductAmount int,
newProductDescription text,
newProductStatus varchar(50))
begin
insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
value( newProductCode,newProductName,newProductPrice,newProductAmount,newProductDescription,newProductStatus);
call showAllProduct();
end //
delimiter ;

delimiter //
create procedure updateProductBuyId(
productId int,
newProductCode varchar(50),
newProductName varchar(50),
newProductPrice int,
newProductAmount int,
newProductDescription text,
newProductStatus varchar(50))
begin 
update products set 
productCode = newProductCode,
productName = newProductName,
productPrice = newProductPrice,
productAmount = newProductAmount,
productDescription = newProductDescription,
productStatus = newProductStatus
where productId = Id;
call showAllProduct();
end //
delimiter ;

delimiter //
create procedure deleteProductById(productId int)
begin
delete from	products where Id = productId;
call showAllProduct();
end // 
delimiter ;

call showAllProduct();
call addNewProduct('B','Raider',1500,10,'jk','kjl');
call updateProductBuyId(7,'B','Nouvo', 1700,12,'kl','kl');
call deleteProductById(7);