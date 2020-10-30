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
group by hopdong.IdKhachHang
order by hopdong.IdKhachHang desc;

-- Câu 5:
select khachhang.IdKhachHang, khachhang.HoTen, loaikhachhang.TenLoaiKhach, hopdong.IdHopDong, dichvu.TenDichVu, hopdong.NgayLamHopDong, hopdong.NgayKetThuc, hopdong.TongTien + ( hopdongchitiet.SoLuong * dichvudikem.Gia) as Tong_tien from khachhang
left join hopdong on khachhang.IdKhachHang = hopdong.IdKhachHang
left join dichvu on	hopdong.IdDichVu = dichvu.IdDichVu
left join hopdongchitiet on hopdong.IdHopDong = hopdongchitiet.IdHopDongChiTiet
left join dichvudikem on hopdongchitiet.IdDichVuDiKem = dichvudikem.IdDichVuDiKem
left join loaikhachhang on khachhang.IdLoaiKhach = loaikhachhang.IdLoaiKhach;

-- Câu 6:
Select services.id_service, services.name_service, services.area, services.cost, service_types.name_service_type from services
left join service_types on services.id_service_type = service_types.id_service_type
left join contracts on services.id_service = contracts.id_service
where year(contracts.day_start) < 2019
and contracts.id_service not in (select contracts.id_service from contracts where year(contracts.day_start) > 2019)
group by services.id_service
union
Select services.id_service, services.name_service, services.area, services.cost, service_types.name_service_type from services
left join service_types on services.id_service_type = service_types.id_service_type
left join contracts on services.id_service = contracts.id_service
where  contracts.id_contract <=> null;

select dichvu.IdDichVu, dichvu.TenDichVu, dichvu.DienTich, dichvu.ChiPhiThue , dichvudikem.TenDichVuDiKem from dichvu
left join loaidichvu on dichvu.IdLoaiDichVu = loaidichvu.IdLoaiDichVu
left join hopdong on dichvu.IdDichVu = hopdong.IdDichVu
where year(hopdong.NgayLamHopDong) <2019
and hopdong.IdDichVu not in 
(select hopdong.IdDichVu from hopdong where year(hopdong.NgayLamHopDong) >2019)
group by dichvu.IdDichVu
union
select dichvu.IdDichVu, dichvu.TenDichVu, dichvu.DienTich, dichvu.ChiPhiThue , dichvudikem.TenDichVuDiKem from dichvu
left join loaidichvu on dichvu.IdLoaiDichVu = loaidichvu.IdLoaiDichVu
left join hopdong on dichvu.IdDichVu = hopdong.IdDichVu
where hopdong.IdHopDong <=>null;


-- Câu 8
-- Cách 1:
select distinct HoTen from khachhang;
-- Cách 2:
select HoTen from khachhang group by HoTen;
