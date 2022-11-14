create database valorant;
use valorant;
create table agent (
id int primary key,
name varchar(255),
location varchar(255));

-- Thêm dữ liệu cho bảng
insert into agent
values (1, 'Chamber', 'Sentinals'), 
	   (2, 'Reyna', 'Duelist'), 
	   (3, 'Omen', 'Controllers'), 
	   (4, 'Breach', 'Initiators'); 
       
-- Xem dữ liệu của bảng, * là lấy hết tất cả các cột
select * from agent;

-- Lấy thông tin của 2 cột
select `name`, location from agent;
select * from agent;

-- Sửa thông tin
update agent set name = 'Jett' where id = 2;
select * from agent;
SET SQL_SAFE_UPDATES = 0;

-- Xóa thông tin (toàn bộ)
delete from agent;

-- Xóa thông tin kèm điều kiện
delete from agent where id = 4;

-- Thêm cột mới cho bảng
alter table agent add column(nation varchar(255));
insert into agent
values (4, 'Yoru', 'Duelist', 'Japan');

--

