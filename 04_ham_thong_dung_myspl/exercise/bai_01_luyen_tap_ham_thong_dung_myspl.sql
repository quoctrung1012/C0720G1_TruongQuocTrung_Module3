create database bai_01_luyen_tap_cac_ham_thong_dung;
drop database bai_01_luyen_tap_cac_ham_thong_dung;
use bai_01_luyen_tap_cac_ham_thong_dung;
create table InformationStudent(
id int auto_increment primary key,
fullName varchar(20) not null,
age int not null,
course varchar(20) not null,
amount varchar(25)not null
);

insert into InformationStudent value (null,'Hoang',21,'CNTT','400000');
insert into InformationStudent value (null,'Viet',19,'DTVT','320000');
insert into InformationStudent value (null,'Thanh',18,'KTDN','400000');
insert into InformationStudent value (null,'Nhan',19,'CK','450000');
insert into InformationStudent value (null,'Huong',20,'TCHH','500000');
insert into InformationStudent value (null,'Huong',20,'TCHH','200000');

select * from informationstudent where fullName = 'Huong';

select sum(amount) from informationstudent where fullName = 'Huong';

select distinct fullName from informationstudent;