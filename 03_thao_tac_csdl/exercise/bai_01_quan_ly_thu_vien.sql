create database bai_tap_01;
drop database bai_tap_01;
use bai_tap_01;
create table Student(
student_number varchar(15),
lastName nvarchar(50) not null,
firstName  nvarchar(50) not null,
address nvarchar(500) not null,
email varchar(50)not null,
image text null
);

create table Books(
book_number int auto_increment primary key,
book_name varchar(50) not null,
book_publisher varchar(50) not null,
book_author varchar(50) not null,
publishing_year year not null,
number_of_books_published int null,
price float not null,
image text,
category_id int
);

create table Category(
id_category int auto_increment primary key,
nameCategory varchar(50) not null
);
drop table borroworder;
create table BorrowOrder(
id_order int auto_increment primary key,
last_borrwed_date date not null,
date_borrow date not null,
date_return date not null,
status_borrow varchar(20) not null default 'waiting',
descriptions text null,
student_id varchar(15),
CONSTRAINT check_01 check (date_return >= date_borrow and date_borrow >= last_borrwed_date),
CONSTRAINT check_02 check ( status_borrow = 'waiting' or status_borrow = 'completed' or status_borrow = 'canceled')
);
drop table browbooks;
create table BrowBooks(
id_brow_book int,
order_id int,
book_id int
);

alter table student add primary key(student_number);
alter table BrowBooks add primary key (id_brow_book);

alter table Books add foreign key(category_id) references Category(id_category);
alter table BorrowOrder add foreign key(student_id) references Student(student_number);
alter table BrowBooks 
add foreign key(order_id) references BorrowOrder(id_order),
add foreign key(book_id) references Books(book_number);
alter table borroworder 
modify last_borrwed_date date not null,
modify date_borrow date not null,
modify date_return date not null;
alter table browbooks add primary key (id_brow_book);

