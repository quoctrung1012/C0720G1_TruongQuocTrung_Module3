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
-- Thực hành số 1
delimiter $$
create procedure get_user_by_id (in  user_id int)
begin
select users.name, users.email, users.country
from users
where users.id = user_id;
end$$
delimiter ;

delimiter $$
-- Thêm thông tin
create procedure insert_user(
in user_name varchar(50),
in user_email varchar(50),
in user_country varchar(50))
begin
insert into	 users(name, email, country) value (user_name, user_email, user_country);
end $$
delimiter ;
-- Thực hành số 2
create table Permision(
id int(11) auto_increment primary key,
name varchar(50)
);
create table User_Permision(
permision_id int(11),
user_id int(11)
);
insert into Permision(name) values('add');
insert into Permision(name) values('edit');
insert into Permision(name) values('delete');
insert into Permision(name) values('view');

delimiter $$
create procedure select_all_user_store()
begin
select * from demo.users;
end $$
delimiter ;

delimiter $$
create procedure delete_row_user(in user_id int)
begin
delete from users where users.id = user_id;
end $$
delimiter ;

delimiter $$
create procedure edit_user(
in user_name varchar(50),
in user_email varchar(50),
in user_country varchar(50),
in user_id int
)
begin
update users set
users.name = user_name,
users.email = user_email,
users.country = user_country
where users.id = user_id;
end$$
delimiter ;
select * from users where users.country like '%t%';

delimiter $$
create procedure find_user_by_country(in user_country varchar(50))
begin
select * from demo.users where users.country like '%user_country%';
end$$
delimiter ;
call find_user_by_country('v');
delimiter $$
create procedure view_user(in user_id int)
begin
select * from demo.users where users.id = user_id;
end$$
delimiter ;
select * from demo.users order by users.name;

delimiter $$
create procedure sory_by_name()
begin
select * from demo.users order by users.name;
end$$
delimiter ;
