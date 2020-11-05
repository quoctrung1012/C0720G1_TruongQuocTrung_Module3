-- Câu 2: Tìm tên nhân viên
select * from nhanvien where (length(hoTen) <=15) and (hoTen like 'T%' or 'P%' or 'K%');
-- Câu 3: Tìm tên khách hàng
select * from khachhang 
where (year(curdate()) - year(NgaySinh) > 18) 
and (year(curdate()) - year(NgaySinh) <50)
and khachhang.DiaChi = 'Đà Nẵng' or khachhang.DiaChi = 'Quảng Trị';
-- Câu 4: Kiểm tra số lần khách hàng loại Diamond đặt hàng
select khachhang.HoTen, count(hopdong.IdKhachHang), loaikhachhang.TenLoaiKhach from khachhang
join hopdong on khachhang.IdKhachHang  = hopdong.IdKhachHang
join loaikhachhang on khachhang.IdLoaiKhach = loaikhachhang.IdLoaiKhach
where loaikhachhang.TenLoaiKhach = 'Diamond'
group by khachhang.IdKhachHang
order by  khachhang.IdKhachHang desc;

-- Câu 5:
select khachhang.IdKhachHang, khachhang.HoTen, loaikhachhang.TenLoaiKhach, hopdong.IdHopDong, dichvu.TenDichVu, hopdong.NgayLamHopDong, hopdong.NgayKetThuc, sum(dichvu.ChiPhiThue + hopdongchitiet.SoLuong*dichvudikem.Gia) as Tong_tien from khachhang
left join loaikhachhang on khachhang.IdLoaiKhach = loaikhachhang.IdLoaiKhach
left join hopdong on khachhang.IdKhachHang = hopdong.IdKhachHang
left join dichvu on	hopdong.IdDichVu = dichvu.IdDichVu
left join hopdongchitiet on hopdong.IdHopDong = hopdongchitiet.IdHopDongChiTiet
left join dichvudikem on hopdongchitiet.IdDichVuDiKem = dichvudikem.IdDichVuDiKem
group by hopdong.IdHopDong;

-- Câu 6:
select dichvu.IdDichVu, dichvu.TenDichVu, dichvu.DienTich, dichvu.ChiPhiThue, loaidichvu.TenLoaiKieuThue from dichvu
join loaidichvu on dichvu.IdLoaiDichVu = loaidichvu.IdLoaiDichVu
where not exists(
select hopdong.IdDichVu from hopdong 
where (hopdong.NgayLamHopDong between '2019-01-01' and '2019-03-31') 
and hopdong.IdDichVu = dichvu.IdDichVu
);

-- Câu 7:
select dichvu.IdDichVu, dichvu.TenDichVu, dichvu.TenDichVu, dichvu.DienTich, dichvu.SoNguoiToiDa, dichvu.ChiPhiThue, loaidichvu.TenLoaiKieuThue from dichvu
join loaidichvu on loaidichvu.IdLoaiDichVu = dichvu.IdLoaiDichVu
where exists(
select hopdong.IdHopDong from hopdong 
where year(hopdong.NgayLamHopDong) = '2018' and hopdong.IdDichVu = dichvu.IdDichVu)
and not exists (
select hopdong.IdHopDong from hopdong 
where year(hopdong.NgayLamHopDong) = '2019' and hopdong.IdDichVu = dichvu.IdDichVu);

-- Câu 8
-- Cách 1:
select distinct HoTen from khachhang;
-- Cách 2:
select HoTen from khachhang group by HoTen;
-- Cách 3:
select khachhang.HoTen from khachhang union select khachhang.HoTen from khachhang;

-- Câu 9:
select month(hopdong.NgayLamHopDong) as thang ,count(month(hopdong.NgayLamHopDong)) as so_luong from hopdong
where year(hopdong.NgayLamHopDong) = '2019'
group by month(hopdong.NgayLamHopDong)
order by month(hopdong.NgayLamHopDong);

-- Câu 10:
Select hopdongchitiet.IdHopDong, count(hopdongchitiet.IdDichVuDiKem) as so_luong, hopdong.NgayLamHopDong, hopdong.NgayKetThuc, hopdong.TienDatCoc  from hopdongchitiet
join hopdong on hopdong.IdHopDong = hopdongchitiet.IdHopDong
group by hopdongchitiet.IdHopDong;

-- Câu 11:

Select khachhang.HoTen, dichvudikem.TenDichVuDiKem, loaikhachhang.TenLoaiKhach, khachhang.DiaChi from dichvudikem
join hopdongchitiet on hopdongchitiet.IdDichVuDiKem = dichvudikem.IdDichVuDiKem
join hopdong on hopdong.IdHopDong = hopdongchitiet.IdHopDong
join khachhang on khachhang.IdKhachHang = hopdong.IdKhachHang
join loaikhachhang on loaikhachhang.IdLoaiKhach = khachhang.IdLoaiKhach
where loaikhachhang.TenLoaiKhach = 'Diamond' 
and khachhang.DiaChi in ('Vinh' , 'Quảng Ngãi');

-- Câu 12
select hopdong.IdHopDong, nhanvien.hoTen as TenNhanVien, khachhang.HoTen as TenKhachHang, khachhang.SDT, dichvu.TenDichVu, count(hopdongchitiet.IdDichVuDiKem) as SoLuot, hopdong.TienDatCoc from hopdong
left join khachhang on khachhang.IdKhachHang = hopdong.IdKhachHang
left join nhanvien on nhanvien.IdNhanVien = hopdong.IdKhachHang
left join dichvu on	dichvu.IdDichVu = hopdong.IdDichVu
left join hopdongchitiet on hopdongchitiet.IdHopDong = hopdong.IdHopDong
left join dichvudikem on dichvudikem.IdDichVuDiKem = hopdongchitiet.IdDichVuDiKem
where 
month(hopdong.NgayLamHopDong) in ('10','11','12') 
and	year(hopdong.NgayLamHopDong) = '2019'
and khachhang.IdKhachHang not in (
select hopdong.IdKhachHang from hopdong 
where 
month(hopdong.NgayLamHopDong) in ('1','2','3','4','5','6') 
and	year(hopdong.NgayLamHopDong) = '2019')
group by khachhang.IdKhachHang;

-- Câu 13:
create view BangThongKeDichVuDiKem as (
select dichvudikem.TenDichVuDiKem , sum(hopdongchitiet.SoLuong) as TongCong from dichvudikem
join hopdongchitiet on hopdongchitiet.IdDichVuDiKem = hopdongchitiet.IdDichVuDiKem
group by hopdongchitiet.IdDichVuDiKem
);
select bangthongkedichvudikem.TenDichVuDiKem , max(bangthongkedichvudikem.TongCong) as Max from bangthongkedichvudikem
group by bangthongkedichvudikem.TenDichVuDiKem;

-- Câu 14
select hopdong.IdHopDong, dichvu.TenDichVu, dichvudikem.TenDichVuDiKem, count(hopdongchitiet.IdDichVuDiKem) as SoLan from hopdong
join dichvu on dichvu.IdDichVu = hopdong.IdDichVu
join loaidichvu on loaidichvu.IdLoaiDichVu = dichvu.IdLoaiDichVu
join hopdongchitiet on hopdongchitiet.IdHopDong = hopdong.IdHopDong
join dichvudikem on dichvudikem.IdDichVuDiKem = hopdongchitiet.IdDichVuDiKem
group by hopdongchitiet.IdDichVuDiKem
having SoLan = 1;

-- Câu 15:
select nhanvien.IdNhanVien, nhanvien.hoTen, bophan.BoPhan, trinhdo.TrinhDo, vitri.TenViTri, nhanvien.SDT, nhanvien.DiaChi from nhanvien
join trinhdo on trinhdo.IdTrinhDo = nhanvien.IdTrinhDo
join bophan on bophan.IdBoPhan = nhanvien.IdBoPhan
join vitri on vitri.IdVitri = nhanvien.IdVitri
join hopdong on hopdong.IdNhanVien = nhanvien.IdNhanVien
where year(hopdong.NgayLamHopDong) between 2018 and 2019
group by nhanvien.IdNhanVien
having count(hopdong.IdNhanVien) <=3;

-- Câu 16:
-- SET SQL_SAFE_UPDATES=0;
delete from nhanvien where nhanvien.IdNhanVien not in (
select hopdong.IdNhanVien from hopdong);

-- Câu 17