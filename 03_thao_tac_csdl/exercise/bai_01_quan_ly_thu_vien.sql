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

create table BorrowOrder(
id_order int auto_increment primary key,
last_borrwed_date datetime not null,
date_borrow datetime not null,
date_return datetime not null,
status_borrow varchar(20) not null default 'waiting',
descriptions text null,
student_id varchar(15),
check (date_return >= date_borrow and date_borrow >= last_borrwed_date),
check ( status_borrow = 'waiting' or 'completed' or 'canceled')
);

create table BrowBooks(
id_brow_book int,
order_id int,
book_id int
);

alter table student add primary key(student_number);
alter table BrowBooks add primary key (id_brow_book);

alter table Books add foreign key(category_id) references Category(id_category);
alter table BorrowOrder add foreign key(student_id) references Student(student_number);
alter table BrowBooks add foreign key(order_id) references BorrowOrder(id_order);
alter table BrowBooks add foreign key(book_id) references Books(book_number);

