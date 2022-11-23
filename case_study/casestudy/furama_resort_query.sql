use furama_resort_tables;

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien 
where SUBSTRING_INDEX(ho_ten," ", -1) like 'H%' 
and length(ho_ten) < 15;

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
-- sum(ifnull(dv.chi_phi_thue, 0) + ifnull(hdc.so_luong * dvk.gia, 0)) as tongtien
ifnull(dv.chi_phi_thue, 0) + sum(ifnull(hdc.so_luong * dvk.gia, 0)) as tongtien
from khach_hang as kh
left join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong as hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet as hdc on hdc.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem as dvk on dvk.ma_dich_vu_di_kem = hdc.ma_dich_vu_di_kem
group by hd.ma_hop_dong;

-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from dich_vu as dv
left join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
left join hop_dong as hd on hd.ma_dich_vu = dv.ma_dich_vu
where dv.ma_dich_vu not in 
(select ma_dich_vu from hop_dong 
where ngay_lam_hop_dong between '2021-01-01' AND '2021-03-31')
group by dv.ma_dich_vu
order by dien_tich DESC;
-- 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from dich_vu as dv
left join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
left join hop_dong as hd on hd.ma_dich_vu = dv.ma_dich_vu
where dv.ma_dich_vu in (
select ma_dich_vu from hop_dong
where ngay_lam_hop_dong between '2020-01-01' AND '2099-12-31' ) 
AND
dv.ma_dich_vu not in 
(select ma_dich_vu from hop_dong
 where ngay_lam_hop_dong between '2021-01-01' AND '2099-01-01')
group by dv.ma_dich_vu;

-- 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau. Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- Cách 1: Dùng "distinct"
	select distinct ho_ten from khach_hang
    order by ho_ten;
-- Cách 2: Dùng Group by
	select ho_ten from khach_hang
	group by ho_ten;
    
-- Cách 3: sử dụng union
	select ho_ten from khach_hang 
    union
    select ho_ten from khach_hang;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as thang_co_don, count(ma_hop_dong) as so_don_dat_hang from hop_dong 
group by month(ngay_lam_hop_dong) 
order by month(ngay_lam_hop_dong);

-- 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hdc.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong as hd
left join hop_dong_chi_tiet as hdc on hdc.ma_hop_dong = hd.ma_hop_dong
group by hd.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select hdc.ma_dich_vu_di_kem, dv.ten_dich_vu_di_kem
from hop_dong_chi_tiet as hdc
left join dich_vu_di_kem as dv on hdc.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
inner join hop_dong as hd on hdc.ma_hop_dong = hd.ma_hop_dong
inner join khach_hang as kh on kh.ma_khach_hang = hd.ma_hop_dong
inner join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
where ten_loai_khach = 'Diamond' 
And dia_chi like '%Vinh%' or '%Quảng% %Ngãi%';

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, ifnull(sum(hdc.so_luong),0) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
from hop_dong as hd
inner join nhan_vien as nv on nv.ma_nhan_vien = hd.ma_nhan_vien
inner join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang
inner join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet as hdc on hdc.ma_hop_dong = hd.ma_hop_dong
where ngay_lam_hop_dong between '2020-09-01' AND '2020-12-31'
-- where (quarter(hd.ngay_lam_hop_dong) = 4 and year(hd.ngay_lam_hop_dong) = 2020) 
-- and not (quarter(hd.ngay_lam_hop_dong) in (1,2) and year(hd.ngay_lam_hop_dong) = 2021)
group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dvc.ma_dich_vu_di_kem, dvc.ten_dich_vu_di_kem, sum(hdc.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem as dvc
inner join hop_dong_chi_tiet as hdc on hdc.ma_dich_vu_di_kem = dvc.ma_dich_vu_di_kem
group by dvc.ma_dich_vu_di_kem
having sum(hdc.so_luong) = (select max(hdc.so_luong) from hop_dong_chi_tiet as hdc);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hdc.ma_hop_dong, ldv.ten_loai_dich_vu, dvc.ten_dich_vu_di_kem, count(dvc.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong_chi_tiet as hdc 
inner join dich_vu_di_kem as dvc on hdc.ma_dich_vu_di_kem = dvc.ma_dich_vu_di_kem
inner join hop_dong as hd on hdc.ma_hop_dong = hd.ma_hop_dong
inner join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
inner join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
group by dvc.ma_dich_vu_di_kem 
having count(dvc.ma_dich_vu_di_kem) = 1
order by hd.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi 
from nhan_vien as nv 
inner join hop_dong as hd on nv.ma_nhan_vien = hd.ma_nhan_vien
inner join trinh_do as td on nv.ma_trinh_do = td.ma_trinh_do
inner join bo_phan as bp on nv.ma_bo_phan = bp.ma_bo_phan
group by hd.ma_nhan_vien 
having count(ma_hop_dong) <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set SQL_SAFE_UPDATES = 0;
delete from nhan_vien nv1
where nv1.ma_nhan_vien in 
(select * from
(
select nv.ma_nhan_vien
from nhan_vien as nv
left join hop_dong as hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where hd.ma_nhan_vien is null
) as delete_nhan_vien
);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
UPDATE loai_khach lk1 SET ten_loai_khach = 'Diamond', ma_loai_khach = '1'
where lk1.ma_loai_khach in (
select * from 
(
select lk.ma_loai_khach
from khach_hang as kh
left join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong as hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet as hdc on hdc.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem as dvk on dvk.ma_dich_vu_di_kem = hdc.ma_dich_vu_di_kem
where ten_loai_khach = 'Plantinium'
group by hd.ma_hop_dong
) as update_loai_khach
);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set FOREIGN_KEY_CHECKS = 0;
delete from khach_hang as kh1
where kh1.ma_khach_hang in (
select * from 
(
select kh.ma_khach_hang
from hop_dong as hd
inner join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang
where ngay_lam_hop_dong between '2020-01-01' AND '2020-12-31'
) as delete_khach_hang 
);

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem set gia = gia*2
where ma_dich_vu_di_kem not in
(select hdc.ma_dich_vu_di_kem 
from hop_dong_chi_tiet as hdc
group by hdc.ma_dich_vu_di_kem
having sum(hdc.so_luong) <=10);

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select nv.ma_nhan_vien ID, nv.ho_ten, nv.email, nv.ngay_sinh, nv.so_dien_thoai, nv.dia_chi from nhan_vien as nv
union
select kh.ma_khach_hang ID, kh.ho_ten, kh.email, kh.ngay_sinh, kh.so_dien_thoai, kh.dia_chi from khach_hang as kh;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien 
as select * from nhan_vien;


-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.



-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.



-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.



-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.



-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database. Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.



-- 27.	Tạo Function thực hiện yêu cầu sau:



-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.


-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là 1 tham số của function này.



-- 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) và xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác



