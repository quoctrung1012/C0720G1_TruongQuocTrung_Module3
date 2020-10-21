create database phan_tich_va_thiet_ke_csdl;
drop database phan_tich_va_thiet_ke_csdl;

create table customers(
id_customers int auto_increment primary key,
customer_name nvarchar(50) not null,
contact_last_name nvarchar(50) not null,
contact_first_name nvarchar(50) not null,
phone_number varchar(11) not null,
address_line_01 nvarchar(50) not null,
address_line_02 nvarchar(50),
city nvarchar(50) not null,
state nvarchar(50) not null,
postal_code nvarchar(15) not null,
country nvarchar(50) not null,
credit_limit int,
salesRepEmployeeNumber int
);
create table products_line(
id_products_line int primary key,
Descriptions text,
image text
);
create table products(
id_product varchar(20)  primary key,
product_name varchar(70) not null,
product_scale varchar(10) not null,
product_vendor varchar(50) not null,
productDescription text not null,
quantity_In_Stock int not null,
buy_price double not null,
msrp double not null,
products_line_id int
);
create table orders(
id_order int auto_increment primary key,
order_date date not null,
request_date date not null,
shippded_date date not null,
status_order varchar(15) not null,
comments varchar(50) not null,
quantity_ordered int not null,
price_each int not null,
custoner_id int
);
create table payments(
id_payment int auto_increment primary key,
check_number varchar(50) not null,
date_payment date not null,
amount int not null,
customer_id int
);
create table employees(
id_employee int auto_increment primary key,
last_name nvarchar(50) not null,
first_name nvarchar(50) not null,
email varchar(100) not null,
name_job nvarchar(50) not null,
reportTo int,
offices_id varchar(10)
);
create table offices (
id_offices varchar(10) not null primary key,
city varchar(50) not null,
phone varchar(50) not null,
address_line_01 nvarchar(50) not null,
address_line_02 nvarchar(50),
state nvarchar(50) not null,
postal_code nvarchar(15) not null,
country nvarchar(50) not null
);
create table OrderDetails(
id_Order_Details int auto_increment primary key,
product_id varchar(20),
orders int
);

alter table orders add foreign key(custoner_id) references customers(id_customers);
alter table payments add foreign key(customer_id) references customers(id_customers);
alter table orderdetails add foreign key(product_id) references products(id_product);
alter table orderdetails add foreign key(orders) references orders(id_order);
alter table products add foreign key(products_line_id) references products_line(id_products_line);
alter table customers add foreign key(salesRepEmployeeNumber) references employees(id_employee);
alter table employees add foreign key(reportTo) references employees(id_employee);
alter table employees add foreign key(offices_id) references offices(id_offices);




