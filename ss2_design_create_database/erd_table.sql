create database construct;
use construct;

create table phieu_xuat (
so_px int auto_increment primary key,
ngay_xuat date
);

create table vat_tu (
ma_vtu int auto_increment primary key,
ten_vtu varchar(50)
);

create table chi_tiet_phieu_xuat (
id_px int,
id_vtu int,
don_gia_xuat int,
so_luong_xuat int,
start_time date,
primary key(id_px , id_vtu),
foreign key(id_px) references phieu_xuat(so_px),
foreign key(id_vtu) references vat_tu(ma_vtu)
);

create table phieu_nhap (
so_pn int auto_increment primary key,
ngay_nhap date
);

create table chi_tiet_phieu_nhap (
id_pn int,
id_vtu int,
don_gia_nhap int,
so_luong_nhap int,
start_time date,
primary key(id_pn , id_vtu),
foreign key(id_pn) references phieu_nhap(so_pn),
foreign key(id_vtu) references vat_tu(ma_vtu)
);

create table don_hang (
so_dh int auto_increment primary key,
ngay_dh date
);

create table chi_tiet_dat_hang (
id_vtu int,
id_dh int,
start_time date,
primary key(id_vtu , id_dh),
foreign key(id_vtu) references vat_tu(ma_vtu),
foreign key(id_dh) references don_hang(so_dh)
);


create table nha_cc (
ma_ncc int auto_increment primary key,
ten_ncc varchar(50),
dia_chi varchar(255)
);

create table cung_cap (
id_dh int,
id_ncc int,
start_time date,
primary key(id_dh,id_ncc),
foreign key(id_dh) references don_hang(so_dh),
foreign key(id_ncc) references nha_cc(ma_ncc)
);

create table so_dien_thoai (
id int auto_increment primary key,
phone varchar(50),
phone_id int,
foreign key (phone_id) references nha_cc(ma_ncc)
);



