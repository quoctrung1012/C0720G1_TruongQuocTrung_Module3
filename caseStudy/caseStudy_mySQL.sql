drop database caseStudy;
create database caseStudy;
use caseStudy;

create table ViTri(
IdVitri int,
TenViTri varchar(50) not null);
create table TrinhDo(
IdTrinhDo int ,
TrinhDo varchar(50) not null);
create table BoPhan(
IdBoPhan int,
BoPhan varchar(50) not null);
create table NhanVien(
IdNhanVien int,
hoTen varchar(50) not null,
NgaySinh date not null,
SoCNND varchar(50) not null,
Luong varchar(50) not null,
SDT varchar(50) not null,
Email varchar(50) not null,
DiaChi varchar(50) not null
);

create table LoaiKhachHang(
IdLoaiKhach int,
TenLoaiKhach varchar(50) not null);
create table KhachHang(
IdKhachHang int,
HoTen varchar(50) not null,
NgaySinh date,
SoCNND varchar(50) not null,
SDT varchar(50) not null,
Email varchar(50) not null,
DiaChi varchar(50) not null
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
add IdHopDongChiTiet int after IdHopDong;

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
add constraint hopdongchitiet_fk foreign key (IdHopDongChiTiet) references hopdongchitiet(IdHopDongChiTiet);



