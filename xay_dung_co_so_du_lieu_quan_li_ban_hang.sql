use quanlisanpham;
insert into Customer(cID,cName,cAge) value (1,"Minh Quan",10),
(2,"Ngoc Oanh",20),
(3,"Hong Ha",50)
;
insert into orders(oID,cID,oDate) value (1,1,3/21/2006),
(2,2,3/23/2006),
(3,1,3/16/2006)
;
insert into products(pID,pName,pPrice) value (1,"May Giat",3),
(2,"Tu Lanh",5),
(3,"Dieu Doa",7),
(4,"Quat",1),
(5,"Bep Dien",2)
;
insert into orderdetails(oID,pID,oQuantity) value (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3)
;
select oID,oDate,oTotalPrice from orders;
select C.cName,P.pName 
from customer C join orders on C.cID = orders.cID
join orderdetails on orders.oID = orderdetails.oID
join products P on orderdetails.pID = P.pID;
select cName 
from customer left join orders on customer.cID = orders.cID
where oID is null;
select O.oID,customer.cName,O.oDate,sum(orderdetails.oQuantity*products.pPrice) as oTotalPrice
from orders O join orderdetails on O.oID = orderdetails.oID
join products on products.pID = orderdetails.pID
join customer on customer.cID = O.cID
GROUP BY O.oID, O.oDate;