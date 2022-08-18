CREATE TRIGGER [validtrigger]
	ON [dbo].[acme]
	FOR insert
	AS
	BEGIN
		declare @Firstname varchar(50)
		declare @Mobile varchar(50)
		declare @Email varchar(50)
		declare @Password varchar(50)
		declare @DOB date
		select @Firstname = (select Firstname from inserted)
		select @Mobile = (select Mobile from inserted)
		select @Email = (select Email from inserted)
		select @Password = (select Password from inserted)
		select @DOB = (select DOB from inserted)
		insert into details values (@Firstname,@Mobile,@Email,@Password,@DOB);
	END
