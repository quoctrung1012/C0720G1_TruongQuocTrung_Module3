create database bai_lam_them_02;
drop database bai_lam_them_02;
create table categories(
id_categorie int not null auto_increment primary key,
name nvarchar(50) not null unique,
Descriptions nvarchar(500)
);
create table suppliers(
id_supplier int not null auto_increment primary key,
name nvarchar(100) not null,
email varchar(50) not null unique,
phone_number varchar(50),
address nvarchar(500) not null
);
create table customers(
id_customers varchar(50) not null primary key,
first_name nvarchar(50) not null,
last_name nvarchar(50) not null,
phone_number varchar(50),
address nvarchar(500) not null,
email varchar(50) not null unique,
birthday date
);
create table employee(
id_employee varchar(50) not null primary key,
first_name nvarchar(50) not null,
last_name nvarchar(50) not null,
phone_number varchar(50),
address nvarchar(500) not null,
email varchar(50) not null unique,
birthday date
);
create table products(
id_product int not null auto_increment primary key,
name_product nvarchar(50) not null,
UmageUrl nvarchar(1000) not null,
price int not null default 0,
discount int not null default 0,
stock int not null default 0,
category_id int not null,
supplier_id int not null,
Descriptions nvarchar(10000) not null,
check (price >=0),
check (discount > 0 and discount <100)
);
create table orders(
id_order int not null auto_increment primary key,
created_date datetime not null,
shipped_date datetime,
status_order varchar(50) not null default 'waiting',
Descriptions nvarchar(10000),
shipping_adress nvarchar(500)not null,
shipping_city nvarchar(50)not null,
payment_type varchar(50)not null default 'cash',
customer_id varchar(50)not null,
employee_id varchar(50)not null,
check (shipped_date >= created_date),
check (status_order='waiting'or'completed'or'canceled'),
check(payment_type='pay'or'creditcard')
);
create table OrderDetails(
id_order_details int not null auto_increment primary key,
order_id int not null,
product_id int not null,
quantity int not null);
drop table orders;

alter table products add foreign key(category_id) references categories(id_categorie);
alter table products add foreign key(supplier_id) references suppliers(id_supplier);
alter table orders add foreign key(customer_id) references customers(id_customers);
alter table orders add foreign key(employee_id) references employee(id_employee);
alter table orderdetails add foreign key(order_id) references orders(id_order);
alter table orderdetails add foreign key(product_id) references products(id_product);
