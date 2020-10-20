create database bai_tap_01_xac_dinh_khoa_chinh_ngoai;
drop database bai_tap_01_xac_dinh_khoa_chinh_ngoai;
create table Customers (
customer_number int not null auto_increment primary key,
fullname varchar(50) not null,
address varchar(50) not null,
email varchar(50) not null,
phone_number varchar(11) not null
);
create table Accounts (
account_number int not null auto_increment primary key,
account_type varchar(11) not null,
date_open_account date not null,
balance float not null
);

create table Transactions (
tran_number int(15) not null auto_increment primary key,
account_number_transaction int not null,
date_transaction datetime not null,
amounts float(20) not null,
descriptions varchar(50) not null,
FOREIGN KEY (account_number_transaction) references accounts(account_number)
);
alter table accounts add customer_number_acc int not null;
alter table accounts add foreign key (customer_number_acc) references customers(customer_number);