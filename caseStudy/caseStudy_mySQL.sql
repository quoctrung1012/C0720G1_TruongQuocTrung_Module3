drop database caseStudy;
create database caseStudy;
use caseStudy;

create table ViTri(
IdVitri int,
TenViTri varchar(50) not null
);
create table TrinhDo(
IdTrinhDo int ,
TrinhDo varchar(50) not null
);
create table BoPhan(
IdBoPhan int,
BoPhan varchar(50) not null
);

create table NhanVien(
IdNhanVien int,
hoTen varchar(50) not null,
NgaySinh date not null,
SoCNND varchar(50) not null unique,
Luong varchar(50) not null,
SDT varchar(50) not null unique,
Email varchar(50) not null,
DiaChi varchar(50) not null
);
create table LoaiKhachHang(
IdLoaiKhach int,
TenLoaiKhach varchar(50) not null
);
create table KhachHang(
IdKhachHang int,
HoTen varchar(50) not null,
NgaySinh date,
SoCNND varchar(50) not null unique,
SDT varchar(50) not null unique,
Email varchar(50) not null,
DiaChi varchar(255) not null
);

create table KieuThue(
IdKieuThue int,
TenKieuThue varchar(50) not null,
Gia int not null);
create table LoaiDichVu(
IdLoaiDichVu int,
TenLoaiKieuThue varchar(50) not null);
create table DichVu(
IdDichVu int,
TenDichVu varchar(50) not null,
DienTich double not null,
SoTang int not null,
SoNguoiToiDa int not null,
ChiPhiThue int not null,
TrangThai varchar(50) not null);

create table DichVuDiKem(
IdDichVuDiKem int ,
TenDichVuDiKem varchar(50) not null,
Gia int not null,
DonVi int not null,
TrangThaiKhaDung varchar(50) not null
);
create table HopDongChiTiet(
IdHopDongChiTiet int,
SoLuong int
);
create table HopDong(
IdHopDong int,
NgayLamHopDong date ,
NgayKetThuc date,
TienDatCoc int not null,
TongTien int not null);

alter table vitri add primary key (IdVitri), modify IdVitri int auto_increment;
alter table trinhdo add primary key(IdTrinhDo), modify IdTrinhDo int auto_increment;
alter table bophan add primary key(IdBoPhan), modify IdBoPhan int auto_increment;
alter table dichvudikem add primary key(IdDichVuDiKem), modify IdDichVuDiKem int auto_increment;
alter table kieuthue add primary key(IdKieuThue), modify IdKieuThue int auto_increment;
alter table loaidichvu add primary key(IdLoaiDichVu), modify IdLoaiDichVu int auto_increment;
alter table loaikhachhang add primary key(IdLoaiKhach), modify IdLoaiKhach int auto_increment;

alter table nhanvien 
add primary key(IdNhanVien), modify IdNhanVien int auto_increment, 
add IdVitri int after hoTen, 
add IdTrinhDo int after hoTen, 
add IdBoPhan int after hoTen;

alter table khachhang 
add primary key (IdKhachHang),modify IdKhachHang int auto_increment, 
add IdLoaiKhach int after IdKhachHang;

alter table dichvu 
add primary key(IdDichVu), modify IdDichVu int auto_increment, 
add IdKieuThue int after ChiPhiThue, 
add IdLoaiDichVu int after ChiPhiThue;

alter table hopdong 
add primary key(IdHopDong), modify IdHopDong int auto_increment,
add IdNhanVien int after IdHopDong,
add IdKhachHang int after IdHopDong,
add IdDichVu int after IdHopDong;

alter table nhanvien
add constraint vitri_fk foreign key(IdVitri) references vitri(IdVitri),
add constraint trinhdo_fk foreign key(IdTrinhDo) references trinhdo(IdTrinhDo),
add constraint bophan_fk foreign key(IdBoPhan) references bophan(IdBoPhan);

alter table khachhang 
add constraint loaikhachhang_fk foreign key(IdLoaiKhach) references loaikhachhang(IdLoaiKhach);

alter table dichvu 
add constraint loaidichvu_fk foreign key(IdLoaiDichVu) references loaidichvu(IdLoaiDichVu),
add constraint kieuthue_fk foreign key(IdKieuThue) references kieuthue(IdKieuThue);

alter table hopdongchitiet 
add primary key(IdHopDongChiTiet), modify IdHopDongChiTiet int auto_increment,
add IdDichVuDiKem int after IdHopDongChiTiet, 
add IdHopDong int after IdHopDongChiTiet,
add constraint dichvudikem_fk foreign key (IdDichVuDiKem) references dichvudikem(IdDichVuDiKem),
add constraint hopdong_fk foreign key (IdHopDong) references hopdong(IdHopDong);

alter table hopdong 
add constraint nhanvien_fk foreign key (IdNhanVien) references nhanvien(IdNhanVien),
add constraint khachhang_fk foreign key (IdKhachHang) references khachhang(IdKhachHang),
add constraint dichvu_fk foreign key (IdDichVu) references dichvu(IdDichVu);

alter table vitri add constraint vitri_check check (TenViTri = 'Le_Tan' or TenViTri = 'Phuc_Vu' or TenViTri = 'Chuyen_Vien' or TenViTri = 'Giam_Sat' or TenViTri = 'Quan_Ly' or TenViTri = 'Giam_Doc');
alter table trinhdo add constraint trinhdo_check check (trinhdo = 'Trung_Cap' or  trinhdo = 'Cao_Dang' or trinhdo = 'Dai_Hoc' or trinhdo = 'Sau_Dai_Hoc');
alter table bophan add constraint bophan_check check (bophan = 'Sale_–_Marketing' or bophan = 'Hanh_Chinh' or bophan = 'Phuc_Vu' or bophan = 'Quan_Ly');
alter table nhanvien add constraint luong_check check (Luong > 0);
alter table loaikhachhang add constraint loaikhach_check check ( TenLoaiKhach = 'Diamond' or TenLoaiKhach = 'Platinium' or TenLoaiKhach = 'Gold' or TenLoaiKhach = 'Silver' or TenLoaiKhach = 'Member');
alter table kieuthue add constraint kieuthue_check check (TenKieuThue = 'Ngay' or TenKieuThue = 'Thang' or TenKieuThue = 'Nam' or TenKieuThue = 'Gio');
alter table loaidichvu add constraint loaidichvu_check check (TenLoaiKieuThue = 'Villa' or TenLoaiKieuThue = 'House' or TenLoaiKieuThue = 'Room');
alter table dichvu 
add constraint dichvu_check_ten check (TenDichVu = 'Villa' or TenDichVu = 'House' or TenDichVu = 'Room'),
add constraint dichvu_check_dientich check (DienTich >= 30),
add constraint dichvu_check_sotang check (SoTang >0),
add constraint dichvu_check_songuoi check (SoNguoiToiDa > 0),
add constraint dichvu_check_chiphi check (ChiPhiThue >0),
add constraint dichvu_check_trangthai check (TrangThai = 'Dang_Trong' or TrangThai = 'Dang_Thue' or TrangThai = 'Moi_tra,_dang_don_dep');
alter table dichvudikem
add constraint dichvudikem_check_ten check (TenDichVuDiKem = 'Massage' or TenDichVuDiKem = 'Karaoke' or TenDichVuDiKem = 'Thuc_An' or TenDichVuDiKem = 'Nuoc_Uong' or TenDichVuDiKem = 'Thue_Xe'),
add constraint dichvudikem_check_gia check (Gia >0),
add constraint dichvudikem_check_donvi check (DonVi >0),
add constraint dichvudikem_check_trangthai check (TrangThaiKhaDung = 'Dang_Su_Dung' or TrangThaiKhaDung = 'Khong_Su_Dung');
alter table hopdongchitiet add constraint hopdongchitiet_check check (SoLuong >0);
alter table hopdong
add constraint hopdong_check_tiendatcoc check (TienDatCoc > 0),
add constraint hopdong_check_tongtien check (TongTien > 0);

insert into vitri value (null,'Le_Tan'),(null,'Phuc_Vu'),(null,'Chuyen_Vien'),(null,'Giam_Sat'),(null,'Quan_Ly'),(null,'Giam_Doc');

insert into bophan value (null,'Sale_–_Marketing'),(null,'Hanh_Chinh'),(null,'Phuc_Vu'),(null,'Quan_Ly');

insert into trinhdo value  (null,'Trung_Cap'),(null,'Cao_Dang'),(null,'Dai_Hoc'),(null,'Sau_Dai_Hoc');

insert into loaidichvu value (null,'Villa'),(null,'House'),(null,'Room');

insert into loaikhachhang value (null,'Diamond'),(null,'Platinium'),(null,'Gold'),(null,'Silver'),(null,'Member');

insert into	 kieuthue value (null,'Gio',100),(null,'Ngay',300),(null,'Thang',8000),(null,'Nam',100000);

insert into dichvudikem value 
(null,'Massage',50,1,'Khong_Su_Dung'),
(null,'Karaoke',50,1,'Khong_Su_Dung'),
(null,'Thuc_An',40,1,'Khong_Su_Dung'),
(null,'Nuoc_Uong',5,1,'Khong_Su_Dung'),
(null,'Thue_Xe',70,1,'Khong_Su_Dung'),
(null,'Massage',100,2,'Khong_Su_Dung'),
(null,'Karaoke',100,2,'Khong_Su_Dung'),
(null,'Thuc_An',80,2,'Khong_Su_Dung'),
(null,'Nuoc_Uong',10,2,'Khong_Su_Dung'),
(null,'Thue_Xe',130,2,'Khong_Su_Dung'),
(null,'Massage',140,3,'Khong_Su_Dung'),
(null,'Karaoke',140,3,'Khong_Su_Dung'),
(null,'Thuc_An',75,3,'Khong_Su_Dung'),
(null,'Nuoc_Uong',15,3,'Khong_Su_Dung'),
(null,'Thue_Xe',200,3,'Khong_Su_Dung');


insert into dichvu value 
(null,'Villa',90,2,5,500,1,1,'Dang_Trong'),
(null,'House',80,2,5,400,2,1,'Dang_Trong'),
(null,'Room',70,1,5,250,3,1,'Dang_Trong'),
(null,'Villa',110,2,6,600,1,1,'Dang_Trong'),
(null,'House',100,2,6,500,2,1,'Dang_Trong'),
(null,'Room',90,1,6,350,3,1,'Dang_Trong'),
(null,'Villa',170,3,8,700,1,1,'Dang_Trong'),
(null,'House',150,3,8,600,2,1,'Dang_Trong'),
(null,'Room',120,2,8,400,3,1,'Dang_Trong');

insert into khachhang value 
(null,1,'Nguyễn Văn Cảnh','1985-09-19','0123645896','0986542319','vancanh@gmail.com','Huế'),
(null,1,'Trần Văn Tiến','1995-02-11','0093645896','0356542319','vantien@gmail.com','Đà Nẵng'),
(null,2,'Ngô Minh Hùng','1991-09-10','0223645896','0793542319','minhhung@gmail.com','Quảng Nam'),
(null,2,'Trịnh Tuấn Minh','1990-12-22','0923645896','0553542319','tuanminh@gmail.com','Quảng Trị'),
(null,3,'Đặng Ngọc Cảnh','1988-09-23','0356645896','0383542319','ngoccanh@gmail.com','Quảng Bình'),
(null,3,'Đới Vũ Sinh','1982-02-12','0396645896','0323542319','vusinh@gmail.com','Phú Yên'),
(null,4,'Doãn Hoài Linh','1975-09-30','0396955896','0323542229','hoailinh@gmail.com','Dak-Lak'),
(null,4,'Vũ Cảnh Nam','1985-10-05','0398955896','0226542229','canhnam@gmail.com','Đà Nẵng'),
(null,5,'Hoàng Tuấn Minh','1995-10-05','0363955896','0295542229','tuanminh@gmail.com','Đà Nẵng'),
(null,5,'Lê Minh Khoa','1965-10-15','0223955896','0289542229','minhkhoa@gmail.com','Quảng Trị');

insert into nhanvien value 
(null,'Nguyen Hoang Nam',1,3,3,'1995-10-12','1234567890',1200,'09865432159','hoangnam@gmail.com','Đà Nẵng'),
(null,'Nguyen Van Tuan',2,2,2,'1993-11-28','1234967890',1100,'09869432159','vantuan@gmail.com','Đà Nẵng'),
(null,'Tran Van Thanh',2,3,4,'1993-05-25','3334967890',1000,'09869532159','vanthanh@gmail.com','Huế'),
(null,'Le Thanh Tuyen',4,3,4,'1991-10-22','6532967890',1800,'09869572159','thanhtuyen@gmail.com','Quảng Nam'),
(null,'Ngo Tuan Sinh',3,1,2,'1999-09-11','0234967890',700,'09069532159','tuansinh@gmail.com','Phú Yên'),
(null,'Le Thi Hai Yen',3,1,4,'1996-09-11','0984967890',1200,'09069596159','haiyen@gmail.com','Quảng Trị');

insert into	hopdong value
(null, 1, 3, 3, '2020/05/25', '2020/08/12', 1000, 7000),
(null, 2, 5, 4,'2020/04/15','2020/09/30',1100,8000),
(null, 6, 3, 5, '2020/03/22','2020/06/21',1000,9000),
(null, 5, 5, 2,'2019/12/20','2020/06/21',1500,6000),
(null, 3, 4, 1,'2020/01/05','2020/10/10',1100,7000),
(null, 3, 1, 5, '2020/05/11','2020/10/10',1500,8000);

insert into hopdongchitiet value
(null, 1, 5, 4), (null, 1, 2, 4), (null, 2, 1, 5),(null, 5, 3, 5),(null, 6,2,5);
