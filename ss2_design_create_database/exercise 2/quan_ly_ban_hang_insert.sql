use sales_manager;

insert into customer
	values (1, 'Minh Quan', 10),
		   (2, 'Ngoc Oanh', 20),
		   (3, 'Hong Ha', 50);

insert into order1 (cID, oDate, oTotalPrice)
	values (1, '2006-03-21', null),
		   (2, '2006-03-23', null),
		   (3, '2006-03-16', null);
          
insert into product 
	values (1, 'May Giat', 3),
		   (2, 'Tu Lanh', 5),
		   (3, 'Dieu Hoa', 7),
		   (4, 'Quat', 1),
		   (5, 'Bep Dien', 2);
           
insert into order_detail
	values (1, 1, 3),
		   (1, 3, 7),
		   (1, 4, 2),
		   (2, 1, 1),
		   (3, 1, 8),
		   (2, 5, 4),
		   (2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate, oTotalPrice from order1;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cName, p.pName 
from order_detail as od
inner join order1 as o on o.oID = od.id_od
inner join customer as c on c.cID = o.oID
inner join product as p on p.pID = od.id_od;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cID, c.cName, c.cAge 
from customer as c
where c.cID not in (
select 
o.cID 
from order1 as o
);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

