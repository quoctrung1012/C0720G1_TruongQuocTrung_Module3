create database bai_thuc_hanh_01_thao_tac_voi_bang;
drop database bai_thuc_hanh_01_thao_tac_voi_bang;
use bai_thuc_hanh_01_thao_tac_voi_bang;
create table customers;

-- tạo bảng

create table contacts(
contact_id int(11) not null auto_increment,
last_name varchar(30) not null,
first_name varchar(25),
birthday date,
constraint contact_pk primary key (contact_id));
create table suppliers(
supplier_id int(11) not null auto_increment,
supplier_name varchar(50) not null,
supplier_rep varchar(30) not null default 'TBD',
constraint supplier_pk primary key (supplier_id));

-- xóa bảng(drop + table + tên bảng)
drop table customers;
drop table customers, suppliers;

-- xóa một trường trong cột(alter + table + tên bảng + drop + column + tên trường)
alter table contacts
drop column age;

-- chỉnh sửa bảng(thêm cột vào bảng)
alter table contacts
add last_name varchar(40) not null
after contact_id,
add first_name varchar(35) null
after last_name;

alter table contacts
add id_card date not null
after birthday;

alter table contacts
add coutry date not null
after birthday;

-- chỉnh sửa bảng(chỉnh sửa mô tả một cột trong bảng)
alter table contacts
modify last_name varchar(50) null;

alter table contacts
modify id_card varchar(11);

alter table contacts
modify coutry varchar(20);

-- thay đổi tên trường hay tên cột
alter table contacts
change column coutry city varchar(15) not null;
-- thay đổi tên bảng
alter table contacts
rename to contact
