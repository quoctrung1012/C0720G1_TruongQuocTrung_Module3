-- Câu 2: Tìm tên nhân viên
select * from nhanvien where (length(hoTen) <=15) and (hoTen like 'T%' or 'P%' or 'K%');
-- Câu 3: Tìm tên khách hàng
select * from khachhang 
where (year(curdate()) - year(NgaySinh) > 18) 
and (year(curdate()) - year(NgaySinh) <50)
and khachhang.DiaChi = 'Đà Nẵng' or khachhang.DiaChi = 'Quảng Trị';
-- Câu 4: Kiểm tra số lần khách hàng loại Diamond đặt hàng
select khachhang.HoTen, count(hopdong.IdKhachHang), loaikhachhang.TenLoaiKhach from hopdong
join khachhang on hopdong.IdKhachHang = khachhang.IdKhachHang
join loaikhachhang on khachhang.IdLoaiKhach = loaikhachhang.IdLoaiKhach
where loaikhachhang.TenLoaiKhach = 'Diamond' order by hopdong.IdKhachHang desc;
-- Câu 5:
select khachhang.IdKhachHang, khachhang.HoTen, loaikhachhang.TenLoaiKhach, hopdong.IdHopDong, dichvu.TenDichVu, hopdong.NgayLamHopDong, hopdong.NgayKetThuc, hopdong.TongTien + ( hopdongchitiet.SoLuong * dichvudikem.Gia) as Tong_tien from khachhang
left join hopdong on khachhang.IdKhachHang = hopdong.IdKhachHang
left join dichvu on	hopdong.IdDichVu = dichvu.IdDichVu
left join hopdongchitiet on hopdong.IdHopDong = hopdongchitiet.IdHopDongChiTiet
left join dichvudikem on hopdongchitiet.IdDichVuDiKem = dichvudikem.IdDichVuDiKem
left join loaikhachhang on khachhang.IdLoaiKhach = loaikhachhang.IdLoaiKhach;


-- Câu 8
-- Cách 1:
select distinct HoTen from khachhang;
-- Cách 2:
select HoTen from khachhang group by HoTen;
