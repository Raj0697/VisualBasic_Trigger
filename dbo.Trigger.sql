CREATE TRIGGER car_trig
	ON [dbo].[car]
	FOR UPDATE
	AS IF UPDATE (price)
	begin
	declare @price int 
	declare @new_price int
	declare @name char(14)
	select @price = (select price from deleted)
	select @new_price = (select price from inserted)
	select @name =  (select Name from deleted)
	insert into cartmp values (@name, getdate(), @price, @new_price);
	end