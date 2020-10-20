create database bai_thuc_hanh_02_tao_khoa_chinh;
drop database bai_thuc_hanh_02_tao_khoa_chinh;
use bai_thuc_hanh_02_tao_khoa_chinh;
create table users_01(
user_id_01 INT AUTO_INCREMENT primary key,
username VARCHAR(40),
password VARCHAR(255),
email VARCHAR(255)
);

create table users_02(
user_id_01 INT AUTO_INCREMENT,
username VARCHAR(40),
password VARCHAR(255),
email VARCHAR(255)
);

create table roles(
role_id int auto_increment,
role_name varchar(50),
primary key (role_id)
);   
create table usersroles(
user_id_01 int not null,
role_id int not null,
primary key (user_id_01, role_id),
foreign key(user_id_01) references users(user_id_01),
foreign key(role_id)references roles(role_id)
);
ALTER TABLE users MODIFY user_id_01 INT AUTO_INCREMENT;
