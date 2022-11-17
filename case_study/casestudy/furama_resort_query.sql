use furama_resort_tables;

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like'K%' and length(ho_ten) <= 15;

-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang 
where (ngay_sinh between '1972-01-01' AND '2004-12-31') 
AND dia_chi in
	(select dia_chi from khach_hang
	where dia_chi like '%Quảng% %Trị%' OR dia_chi like '%Đà% %Nẵng%');

-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ma_khach_hang, kh.ho_ten as 'FullName', lk.ten_loai_khach as 'Level', count(kh.ma_khach_hang) as Amount
from khach_hang as kh
inner join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
inner join hop_dong as hd on hd.ma_khach_hang = kh.ma_khach_hang
where ten_loai_khach = "Diamond"
group by kh.ma_khach_hang
order by Amount ASC;

-- 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
sum((ifnull(dv.chi_phi_thue, 0) + ifnull(hdc.so_luong * dvk.gia, 0))) as tongtien
from khach_hang as kh
left join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong as hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet as hdc on hdc.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem as dvk on dvk.ma_dich_vu_di_kem = hdc.ma_dich_vu_di_kem
group by hd.ma_hop_dong;
