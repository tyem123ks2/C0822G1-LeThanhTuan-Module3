create database sales_manager;
use sales_manager;

create table customer (
cID int auto_increment primary key,
cName varchar(45),
cAge int
);

create table order1 (
oID int auto_increment primary key,
cID int,
foreign key (cID) references customer(cID),
oDate date,
oTotalPrice double
);

create table product (
pID int auto_increment primary key,
pName varchar(45),
pPrice double
);

create table order_detail (
id_od int,
id_pr int,
odQTY int,
primary key(id_od,id_pr),
foreign key(id_od) references order1(oID),
foreign key(id_pr) references product(pID)
);
