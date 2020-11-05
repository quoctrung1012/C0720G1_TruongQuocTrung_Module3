drop database demo;
create database demo;
use demo;
create table users(
id int not null,
name varchar(120) not null,
email varchar(120) not null,
country varchar(120) not null
);
alter table users add primary key (id), modify id int auto_increment;
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');