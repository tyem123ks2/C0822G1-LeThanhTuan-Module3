create database demo1;
use demo1;

-- Tạo bảng Product
create table Product (
id int not null auto_increment primary key,
productCode varchar(45),
productName varchar(45),
productPrice int,
productAmount int,
productDescription varchar(45),
productStatus varchar(45)
);

-- drop database demo1;

-- Thêm dữ liệu vào bảng demo
INSERT INTO `demo1`.`product` (`id`, `productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) VALUES ('1', 'M41', 'Valorant', '45000', '2', 'FPS', 'In stock');
INSERT INTO `demo1`.`product` (`id`, `productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) VALUES ('2', 'C09', 'League of Legend', '56000', '3', 'MOBA', 'Out of stock');
INSERT INTO `demo1`.`product` (`id`, `productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) VALUES ('3', 'J97', 'Fifa Online 4', '48000', '8', 'FIFA', 'In stock');
INSERT INTO `demo1`.`product` (`id`, `productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) VALUES ('4', 'L78', 'Genshin Impact', '90000', '6', 'Adventure Game', 'In stock');
INSERT INTO `demo1`.`product` (`id`, `productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) VALUES ('5', 'D21', 'PlayerUnknowsBattleGround', '150000', '13', 'FPS', 'Out of stock');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique INDEX p_code on 
Product(productCode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create INDEX p_name_price on
Product(productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from Product where productCode;
explain select * from Product where productCode = 'M41';
EXPLAIN SELECT * FROM Product WHERE productCode = 'M41' or productCode = 'L78';

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view w_product as
select productCode, productName, productPrice, productStatus from Product;
select * from w_product;

-- Tiến hành sửa đổi view
UPDATE w_product SET productName = 'Uptown Funk' where productCode = 'M41';

-- Tiến hành xoá view
drop view w_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_product()
begin
select * from product;
end//
delimiter ;
call sp_product();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure sp_product_add()
begin
insert into product (productCode, productName, productPrice, productAmount, productDescription, productStatus)
		values ('K98', 'CrossFire', '786000', '6', 'FPS', 'In stock');
        select * from product;
end//
delimiter ;
call sp_product_add();

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure sp_product_update()
begin
update product set productName = 'Boom Online' where id = '3';
select * from product;
end//
delimiter ;
call sp_product_update();

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure sp_product_delete()
begin
delete product from product where id = '6';
select * from product;
end//
delimiter ;
call sp_product_delete();

