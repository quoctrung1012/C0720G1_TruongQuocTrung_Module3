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
SoCNND varchar(50) not null,
Luong varchar(50) not null,
SDT varchar(50) not null,
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
SoCNND varchar(50) not null,
SDT varchar(50) not null,
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

alter table vitri add constraint vitri_check check (TenViTri = 'Le Tan' or TenViTri = 'Phuc Vu' or TenViTri = 'Chuyen Vien' or TenViTri = 'Giam Sat' or TenViTri = 'Quan Ly' or TenViTri = 'Giam Doc');
alter table trinhdo add constraint trinhdo_check check (trinhdo = 'Trung Cap' or  trinhdo = 'Cao Dang' or trinhdo = 'Dai Hoc' or trinhdo = 'Sau Dai Hoc');
alter table bophan add constraint bophan_check check (bophan = 'Sale – Marketing' or bophan = 'Hanh Chinh' or bophan = 'Phuc Vu' or bophan = 'Quan Ly');
alter table nhanvien add constraint luong_check check (Luong > 0);
alter table loaikhachhang add constraint loaikhach_check check ( TenLoaiKhach = 'Diamond' or TenLoaiKhach = 'Platinium' or TenLoaiKhach = 'Gold' or TenLoaiKhach = 'Silver' or TenLoaiKhach = ' Member');
alter table kieuthue add constraint kieuthue_check check (TenKieuThue = 'Ngay' or TenKieuThue = 'Thang' or TenKieuThue = 'Nam' or TenKieuThue = 'Gio');
alter table loaidichvu add constraint loaidichvu_check check (TenLoaiKieuThue = 'Villa' or TenLoaiKieuThue = 'House' or TenLoaiKieuThue = 'Room');
alter table dichvu 
add constraint dichvu_check_ten check (TenDichVu = 'Villa' or TenDichVu = 'House' or TenDichVu = 'Room'),
add constraint dichvu_check_dientich check (DienTich >= 30),
add constraint dichvu_check_sotang check (SoTang >0),
add constraint dichvu_check_songuoi check (SoNguoiToiDa > 0),
add constraint dichvu_check_chiphi check (ChiPhiThue >0),
add constraint dichvu_check_trangthai check (TrangThai = 'Dang Trong' or TrangThai = 'Dang Thue' or TrangThai = 'Moi tra, dang don dep');
alter table dichvudikem
add constraint dichvudikem_check_ten check (TenDichVuDiKem = 'Massage' or TenDichVuDiKem = 'Karaoke' or TenDichVuDiKem = 'Thuc An' or TenDichVuDiKem = 'Nuoc Uong' or TenDichVuDiKem = 'Thue Xe'),
add constraint dichvudikem_check_gia check (Gia >0),
add constraint dichvudikem_check_donvi check (DonVi >0),
add constraint dichvudikem_check_trangthai check (TrangThaiKhaDung = 'Dang Su Dung' or TrangThaiKhaDung = 'Khong Su Dung');
alter table hopdongchitiet add constraint hopdongchitiet_check check (SoLuong >0);
alter table hopdong
add constraint hopdong_check_tiendatcoc check (TienDatCoc > 0),
add constraint hopdong_check_tongtien check (TongTien > 0);
