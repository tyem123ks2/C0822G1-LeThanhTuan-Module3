create database exercise1;
use exercise1;
create table class (
id int primary key,
name varchar(255));

create table teacher (
id int primary key,
name varchar(255),
age int,
country varchar(255));

insert into class 
values (1, 'C0822G1'),
	   (2, 'C0922G1');
select * from class;

insert into teacher 
values (1, 'Le Thanh Tuan', 24, 'Quang Tri'),
	   (2, 'Gia Cat Luong', 54, 'Ngoa Long');
select * from teacher;






