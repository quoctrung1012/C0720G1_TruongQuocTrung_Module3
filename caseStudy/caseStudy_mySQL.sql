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
alter table nhanvien 
add primary key(IdNhanVien), modify IdNhanVien int auto_increment, add IdVitri int after hoTen, add IdTrinhDo int after hoTen, add IdBoPhan int after hoTen,
;

alter table loaikhachhang add primary key(IdLoaiKhach), modify IdLoaiKhach int auto_increment;
alter table khachhang 
add primary key (IdKhachHang),modify IdKhachHang int auto_increment, add IdLoaiKhach int after IdKhachHang,
add constraint loaikhachhang_fk foreign key(IdLoaiKhach) references loaikhachhang(IdLoaiKhach);