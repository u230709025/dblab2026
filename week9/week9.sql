use company;
DELIMITER $$
create procedure SelectCustomerByCountry(IN c varchar(45))
begin
	select * from customers
    where country = c;
end $$
DELIMITER ;

set @country = "USA";
select @country;
call SelectCustomerByCountry(@country);
select @country;

DELIMITER $$
create procedure GetOrderCountByShipper(in shipper varchar(45), out COUNT int)
begin
	select COUNT(OrderID) INTO count
    from Orders
    join shippers on Orders.ShipperID = Shippers.ShipperID
    where ShipperName = shipper;
END $$
DELIMITER ;

SET @order_cnt = 0;
select @order_cnt;
call GetOrderCountByShipper("United Package", @order_cnt);
select @order_cnt;

DELIMITER $$
create procedure GetCustomerOut(
	in inCustomerID int,
    out outName varchar(255),
    out outSales float)
begin
	select CustomerName into outName
	from Customers
	where CustomerID = inCustomerID;

	select IFNULL(SUM(p.Price * od.Quantity), 0) into outSales
    from Orders o
    join OrderDetails od on o.OrderID = od.OrderID
    join Products p on p.ProductID = od.ProductID
    where o.CustomerID = inCustomerID;
end $$
DELIMITER ;

call GetCustomerOut(5, @name, @sales); SELECT @name, @sales;
    

