create database QLCuaHangBanQA

go 

use QLCuaHangBanQA

go

--table user 


create FUNCTION Auto_iduser()
RETURNS VARCHAR(4)
AS
BEGIN
	DECLARE @ID VARCHAR(4)
	IF (SELECT COUNT(U_id) FROM users) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(u_id, 3)) FROM users
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'U00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'U0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

go



--table product

CREATE FUNCTION Auto_idproduct()
RETURNS VARCHAR(4)
AS
BEGIN
	DECLARE @ID VARCHAR(4)
	IF (SELECT COUNT(P_id) FROM Product) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(P_id, 3)) FROM Product
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'P00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'P0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

go



--table comment

create FUNCTION Auto_idcomment()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(COM_id) FROM Comment) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(COM_id, 3)) FROM Comment
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'COM00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'COM0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END



go

create FUNCTION Auto_idstyle()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(ST_id) FROM style) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ST_id, 3)) FROM style
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'ST00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'ST0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

go



--table Catalog

CREATE FUNCTION Auto_idcatalog()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(Ca_id) FROM Catalog) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(Ca_id, 3)) FROM catalog
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CA00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CA0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

go



-- table size

CREATE FUNCTION Auto_idsize()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(S_id) FROM Size) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(S_id, 4)) FROM size
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'S000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'S00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'S0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END


go



-- table Color

CREATE FUNCTION Auto_idcolor()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(COL_id) FROM Color) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(COL_id,4)) FROM Color
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'COL000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'COL00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'COL0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

go



-- table Cart

CREATE FUNCTION Auto_idcart()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(CAR_id) FROM Cart) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(CAR_id, 3)) FROM Cart
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CAR00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CAR0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END








go

-- table CartDEta

CREATE FUNCTION Auto_idCartDeta()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(CD_id) FROM CartDeta) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(CD_id, 3)) FROM Cartdeta
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CD00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CD0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END


go


--create table

create table Users(
	U_id varchar(10) primary key ,
	U_Fname nvarchar(200),
	U_Lname nvarchar(200),
	U_email nvarchar(200) not null unique,
	U_status nvarchar(10) not null CHECK (U_status IN('true','false')),
	U_add nvarchar(200),
	U_name nvarchar(200) unique,
	U_contact nvarchar(200) null unique,
	U_created datetime,
	U_pass nvarchar(200) null
)

go

create table style(
	ST_id varchar(10) primary key,
	ST_name nvarchar(200) unique,
	ST_slug nvarchar(200)

)


go

create table catalog(
	CA_id varchar(10) primary key ,
	CA_name nvarchar(200) ,
	CA_STID varchar(10) FOREIGN KEY REFERENCES style (ST_id)
	
)



go

create table Product(
	P_id varchar(10) primary key ,
	P_name nvarchar(200) unique,
	P_discount float,
	P_Price money,
	P_image nvarchar(300) ,
	P_note nvarchar(2000),
	P_amount int,
	P_content nvarchar(2000),
	P_CAID varchar(10) FOREIGN KEY REFERENCES Catalog (CA_id),
	P_slug nvarchar(100) 


)


go

create table Size(
	S_id varchar(10) primary key ,
	S_name nvarchar(200) ,
	S_PID varchar(10) FOREIGN KEY REFERENCES Product (P_id)


)

go

Create table Color(
	COL_id varchar(10) primary key ,
	COL_name nvarchar(200) ,
	COL_slug nvarchar(100),
	COL_PID varchar(10) FOREIGN KEY REFERENCES Product (P_id)


)



go

create table Cart(
	CAR_id varchar(10) primary key ,
	CAR_UID varchar(10) FOREIGN KEY REFERENCES Users (U_id),
	CAR_select nvarchar(20) not null  CHECK (car_select IN('online','offline')),
	CAR_status nvarchar(20) NOT NULL CHECK (car_status IN('true','false')),
	car_date datetime

)

go

create table Comment(
	COM_id varchar(10) primary key ,
	COM_content nvarchar(300),
	COM_UID varchar(10) FOREIGN KEY REFERENCES Users (U_id),
	COM_PID varchar(10) FOREIGN KEY REFERENCES Product (P_id)


)

go



create table Cartdeta(
	CD_id varchar(10) primary key ,
	CD_PID varchar(10) FOREIGN KEY REFERENCES Product (P_id),
	CD_CarID varchar(10) FOREIGN KEY REFERENCES Cart  (CAr_id),
	CD_COLslug nvarchar(20),
	CD_S_name nvarchar(20),
	CD_amount int

)


go

--tao trigger insert


create trigger insertuser on users for insert 
as
begin 
	declare @U_id varchar(10)
	set @U_id=(select top 1 U_id from Users order by U_id desc)
	update Users set u_id=dbo.Auto_iduser() where U_id=''

end

go


create trigger insertproduct on product for insert 
as
begin 
	declare @P_id varchar(10)
	set @P_id=(select top 1 P_id from product order by P_id desc)
	update product set P_id=dbo.Auto_idproduct() where p_id=''

end

go


create trigger insertcomment on comment for insert 
as
begin 
	declare @COM_id varchar(10)
	set @COM_id=(select top 1 COM_id from comment order by COM_id desc)
	update comment set COM_id=dbo.Auto_idcomment() where com_id=''

end

go

create trigger insertstyle on style for insert 
as
begin 
	declare @ST_id varchar(10)
	set @ST_id=(select top 1 ST_id from style order by ST_id desc)
	update style set ST_id=dbo.Auto_idstyle() where ST_id=''

end

go

create trigger insertcatalog on catalog for insert 
as
begin 
	declare @CA_id varchar(10)
	set @CA_id=(select top 1 CA_id from catalog  order by CA_id desc)
	update catalog set CA_id=dbo.Auto_idcatalog() where ca_id=''

end

go


create trigger insertsize on size for insert 
as
begin 
	declare @S_id varchar(10)
	set @S_id=(select top 1 S_id from size order by S_id desc)
	update size set S_id=dbo.Auto_idsize() where s_id=''

end

go

create trigger insertcolor on color for insert 
as
begin 
	declare @COL_id varchar(10)
	set @COL_id=(select top 1 COL_id from Color order by COL_id desc)
	update color set COL_id=dbo.Auto_idcolor() where col_id=''

end

go

create trigger insertcart on cart for insert 
as
begin 
	declare @CAR_id varchar(10)
	set @CAR_id=(select top 1 CAR_id from cart order by CAR_id desc)
	update cart set CAR_id=dbo.Auto_idcart() where car_id=''

end




go

create trigger insertcartdeta on cartdeta for insert 
as
begin 
	declare @CD_id varchar(10)
	set @CD_id=(select top 1 cD_id from cartdeta order by CD_id desc)
	update cartdeta set CD_id=dbo.Auto_idCartDeta() where cd_id=''

end

go


--insert data

 






insert into Users (U_id, U_fname, U_lname, U_email, U_status, U_name, U_contact, U_created, U_pass, U_add) values ('', 'Aldric', 'Simchenko', 'asimchenko0@wix.com', 'true', 'user1', '312-426-5177', '10/13/2021', '5UywCSYyrR', '123123');
insert into Users (U_id, U_fname, U_lname, U_email, U_status, U_name, U_contact, U_created, U_pass, U_add) values ('', 'Juli', 'Chezier', 'jchezier1@comsenz.com', 'true', 'user2', '608-321-6060', '3/26/2022', '8ebvwJYEQ51', '123123');
insert into Users (U_id, U_fname, U_lname, U_email, U_status, U_name, U_contact, U_created, U_pass, U_add) values ('', 'Gregorio', 'Elton', 'gelton2@wordpress.org', 'true', 'Gregorio Elton', '900-828-3359', '9/15/2021', 'EczV5m86', '37 Summerview Drive');
insert into Users (U_id, U_fname, U_lname, U_email, U_status, U_name, U_contact, U_created, U_pass, U_add) values ('', 'Ilysa', 'Rabier', 'irabier3@ihg.com', 'true', 'Ilysa Rabier', '905-997-1874', '4/11/2022', 'tnkHaGLp', '1708 American Ash Park');
insert into Users (U_id, U_fname, U_lname, U_email, U_status, U_name, U_contact, U_created, U_pass, U_add) values ('', 'Skipton', 'Ciccotto', 'sciccotto4@google.es', 'true', 'Skipton Ciccotto', '624-726-6465', '9/16/2021', 'i3mBNjB5', '9 Ridge Oak Way');
insert into Users (U_id, U_fname, U_lname, U_email, U_status, U_name, U_contact, U_created, U_pass, U_add) values ('', 'Stearne', 'Lindfors', 'slindfors5@umn.edu', 'true', 'Stearne Lindfors', '883-425-2041', '3/29/2022', '1DY8tFwtHr6', '56756 Duke Road');
insert into Users (U_id, U_fname, U_lname, U_email, U_status, U_name, U_contact, U_created, U_pass, U_add) values ('', 'Felicle', 'Hanshawe', 'fhanshawe6@yahoo.com', 'true', 'Felicle Hanshawe', '282-924-4339', '8/5/2021', 'IrpIM3Zq', '258 Lindbergh Crossing');
insert into Users (U_id, U_fname, U_lname, U_email, U_status, U_name, U_contact, U_created, U_pass, U_add) values ('', 'Job', 'Clissold', 'jclissold7@opera.com', 'true', 'Job Clissold', '127-483-4083', '6/10/2021', 'L1lSXdNPQ', '39075 Forster Court');
insert into Users (U_id, U_fname, U_lname, U_email, U_status, U_name, U_contact, U_created, U_pass, U_add) values ('', 'Leonard', 'Stolte', 'lstolte8@livejournal.com', 'true', 'Leonard Stolte', '565-704-2511', '12/24/2021', '4uLeb1Avc', '1 Morningstar Drive');
insert into Users (U_id, U_fname, U_lname, U_email, U_status, U_name, U_contact, U_created, U_pass, U_add) values ('', 'Veronika', 'Huws', 'vhuws9@ucoz.com', 'true', 'Veronika Huws', '353-377-5619', '12/5/2021', '6bMNx25SE', '0 Victoria Plaza');






go


INSERT INTO [dbo].[style]([ST_id],[ST_name],[ST_slug])VALUES('',N'nam','men')
INSERT INTO [dbo].[style]([ST_id],[ST_name],[ST_slug])VALUES('',N'nữ','women')
INSERT INTO [dbo].[style]([ST_id],[ST_name],[ST_slug])VALUES('',N'trẻ em','kids')

go


INSERT INTO [dbo].[catalog]([CA_id],[CA_name],[CA_STID])VALUES('',N'áo','ST001')
INSERT INTO [dbo].[catalog]([CA_id],[CA_name],[CA_STID])VALUES('',N'Quần','ST001')
INSERT INTO [dbo].[catalog]([CA_id],[CA_name],[CA_STID])VALUES('',N'đồ mặc trong ','ST001')
INSERT INTO [dbo].[catalog]([CA_id],[CA_name],[CA_STID])VALUES('',N'áo','ST002')
INSERT INTO [dbo].[catalog]([CA_id],[CA_name],[CA_STID])VALUES('',N'Quần','ST002')
INSERT INTO [dbo].[catalog]([CA_id],[CA_name],[CA_STID])VALUES('',N'váy nữ','ST002')
INSERT INTO [dbo].[catalog]([CA_id],[CA_name],[CA_STID])VALUES('',N'áo','ST003')
INSERT INTO [dbo].[catalog]([CA_id],[CA_name],[CA_STID])VALUES('',N'Quần','ST003')
INSERT INTO [dbo].[catalog]([CA_id],[CA_name],[CA_STID])VALUES('',N'váy đầm trẻ em','ST003')
INSERT INTO [dbo].[catalog]([CA_id],[CA_name],[CA_STID])VALUES('',N'bộ đồ trẻ em ','ST003')

go

INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo thun thể thao','','150000','men_ao_anh1.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA001','ao-thun-the-thao')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo phông nam cổ tròn','','150000','men_ao_anh2.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA001','ao-phong-nam-co-tron')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo sơ mi nam dài tay','','1500000','men_ao_anh3.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA001','ao-so-mi-nam-dai-tay')


INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo phông nam cotton','','130000','men_ao_anh4.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA001','ao-phong-nam-cotton')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo polo thể thao','','150000','men_ao_anh5.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA001','ao-polo-the-thao')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo polo nam ngắn tay','','1500000','men_ao_anh6.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA001','ao-polo-nam-ngan-tay')


INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo sơ mi nam tay ngắn','','150000','men_ao_anh7.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA001','ao-so-mi-nam-tay-ngan')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo khoác nam có mũ','','150000','men_ao_anh8.jpg','',100,N'Chất liệu: Polyester cao cấp bao gồm 3 lớp

Lớp ngoài: 100% Nylon,

Lớp giữa: 100% Polyester, lớp lót: 100% Nylon

Chất liệu siêu nhẹ và có độ mềm mịn vượt trội.

Chống thấm nước tốt, yên tâm khi trời mưa nhẹ lất phất.

Chất liệu cao cấp chống tĩnh điện giúp bảo vệ sức khỏe người mặc.

Chất vải ít nhăn, bền màu.','CA001','ao-khoac-nam-co-mu')

INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo polo nam mắt chim','','1500000','men_ao_anh9.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA001','ao-polo-nma-mat-chim')




INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần sooc nam ống xuông','','150000','men_quan_anh1.jpg','',100,N'Quần short nam kaki ngang gối
Sản phẩm basic thiết yếu dành cho mọi chàng trai
Cạp quần thiết kế bản to có đỉa mang lại sự chỉn chu có thể mặc ra ngoài cafe, hẹn hò
Tụi hậu có cúc tiện lợi
Chất vải kaki mềm nhẹ, thoải mái, thích hợp với điều kiện thời tiết nhiệt đới ','CA002','quan-sooc-nam-ong-xuong')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần jeen nam cotton','','150000','men_quan_anh2.jpg','',100,N'Quần short nam kaki ngang gối

Sản phẩm basic thiết yếu dành cho mọi chàng trai

Cạp quần thiết kế bản to có đỉa mang lại sự chỉn chu có thể mặc ra ngoài cafe, hẹn hò

Tụi hậu có cúc tiện lợi

Chất vải kaki mềm nhẹ, thoải mái, thích hợp với điều kiện thời tiết nhiệt đới ','CA002','quan-jeen-nam-cotton')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần jeen nam co giãn','15','1500000','men_quan_anh3.jpg','',100,N'Quần short nam kaki ngang gối

Sản phẩm basic thiết yếu dành cho mọi chàng trai

Cạp quần thiết kế bản to có đỉa mang lại sự chỉn chu có thể mặc ra ngoài cafe, hẹn hò

Tụi hậu có cúc tiện lợi

Chất vải kaki mềm nhẹ, thoải mái, thích hợp với điều kiện thời tiết nhiệt đới ','CA002','quan-jeen-nam-co-gian')

INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần tây nam nano','15','150000','men_quan_anh4.jpg','',100,N'Chất liệu 100% Polyester

Bề mặt vải mềm và nhẹ giúp cho khách hàng cảm thấy vô cùng thoải mái

Quần âu nam slim được thiết kế trên chất liệu nano solid

Thiết kế cơ bản túi trước chéo sườn có lé, túi hậu cài cúc khắc logo Yody

Cạp quần có lớp vải lót phía trong thêu logo yody và 2 đường cao su giúp ôm sát vòng bụng

Màu sắc đa dạng phù hợp với đặc thù công việc cũng như mục đích sử dụng của từng người','CA002','quan-tay-nam-nano')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần âu nam cổ điển','10','150000','men_quan_anh5.jpg','',100,N'Chất liệu 100% Polyester

Bề mặt vải mềm và nhẹ giúp cho khách hàng cảm thấy vô cùng thoải mái

Quần âu nam slim được thiết kế trên chất liệu nano solid

Thiết kế cơ bản túi trước chéo sườn có lé, túi hậu cài cúc khắc logo Yody

Cạp quần có lớp vải lót phía trong thêu logo yody và 2 đường cao su giúp ôm sát vòng bụng

Màu sắc đa dạng phù hợp với đặc thù công việc cũng như mục đích sử dụng của từng người ','CA002','quan-au-nam-co-dien')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần tây nam công sở','','3000000','men_quan_anh6.jpg','',100,N'Quần short nam kaki ngang gối

Sản phẩm basic thiết yếu dành cho mọi chàng trai

Cạp quần thiết kế bản to có đỉa mang lại sự chỉn chu có thể mặc ra ngoài cafe, hẹn hò

Tụi hậu có cúc tiện lợi

Chất vải kaki mềm nhẹ, thoải mái, thích hợp với điều kiện thời tiết nhiệt đới ','CA002','quan-tay-nam-cong-so')

INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần short nam lưng thun','20','2800000','men_quan_anh7.jpg','',100,N'Quần short nam kaki ngang gối
Sản phẩm basic thiết yếu dành cho mọi chàng trai
Cạp quần thiết kế bản to có đỉa mang lại sự chỉn chu có thể mặc ra ngoài cafe, hẹn hò
Tụi hậu có cúc tiện lợi
Chất vải kaki mềm nhẹ, thoải mái, thích hợp với điều kiện thời tiết nhiệt đới ','CA002','quan-short-nam-lung-thun')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần âu vải nam nano','','100000','men_quan_anh8.jpg','',100,N'Chất liệu 100% Polyester

Bề mặt vải mềm và nhẹ giúp cho khách hàng cảm thấy vô cùng thoải mái

Quần âu nam slim được thiết kế trên chất liệu nano solid

Thiết kế cơ bản túi trước chéo sườn có lé, túi hậu cài cúc khắc logo Yody

Cạp quần có lớp vải lót phía trong thêu logo yody và 2 đường cao su giúp ôm sát vòng bụng

Màu sắc đa dạng phù hợp với đặc thù công việc cũng như mục đích sử dụng của từng người ','CA002','quan-au-vai-nam-nano')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần lót nam boxer','20','1300000','men_quan_anh9.jpg','',100,N'Chất liệu: 95% CVC 5% Spandex.

Quần sip nam dáng ôm dạng BOXER phù hợp với đa số người dùng

Form dáng ôm gọn tạo cảm giác thoải mái do chất liệu co giãn tốt

Chất liệu vải thoáng mát thấm hút và mềm mại.','CA003','quan-lot-nam-boxer')




INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo phông nữ cotton','33','150000','women_ao_anh1.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA004','ao-phong-nu-cotton')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo polo nữ cafe','33','150000','women_ao_anh2.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA004','ao-polo-nu-cafe')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo phông nữ cổ xuông','40','1700000','women_ao_anh3.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA004','ao-phong-nu-co-xuong')

INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo phông nữ vissco','','330000','women_ao_anh4.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA004','ao-phong-nu-vissco')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo phông nữ xuông cổ tròn','','180000','women_ao_anh5.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA004','ao-phong-nu-xuong-co-tron')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo phông nữ vải iscra','','1100000','women_ao_anh6.jpg','',100,N'Chất liệu vải thể thao co giãn, không quá dày.Thấm hút mồ hôi, thoáng mát phù hợp với các hoạt động ngoài trời trong mùa hè. Thiết kế cổ tròn thanh lịch, form áo suông giúp dễ dàng che được khuyết điểm trên cơ thể.','CA004','ao-phong-nu-vai-iscra')

INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo T-shirt nữ cotton USA','','110000','women_ao_anh7.jpg','',100,N'Chất liệu 100% Cotton USA

Vải Cotton được dệt từ sợi bông USA cao cấp

Cotton bền vững: Góp phần bảo vệ môi trường sống

Loại sợi chất lượng cao: Độ mảnh và khả năng nhuộm ưu việt

Thấm hút mồ hôi tốt, thoáng mát, rất thích hợp với thời tiết nóng ẩm việt Nam

In hoa Iris (Diên vĩ) - Van Gogh điểm nhấn trẻ trung, nghệ thuật','CA004','ao-T-shirt-nu-cotton-usa')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo T-shirt nữ thể thao','','150000','women_ao_anh8.jpg','',100,N'Chất liệu 100% Cotton USA

Vải Cotton được dệt từ sợi bông USA cao cấp

Cotton bền vững: Góp phần bảo vệ môi trường sống

Loại sợi chất lượng cao: Độ mảnh và khả năng nhuộm ưu việt

Thấm hút mồ hôi tốt, thoáng mát, rất thích hợp với thời tiết nóng ẩm việt Nam

In hoa Iris (Diên vĩ) - Van Gogh điểm nhấn trẻ trung, nghệ thuật','CA004','ao-T-shirt-nu-the-thao')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo T-shirt nữ in ngực thể thao','','1700000','women_ao_anh9.jpg','',100,N'Chất liệu 100% Cotton USA

Vải Cotton được dệt từ sợi bông USA cao cấp

Cotton bền vững: Góp phần bảo vệ môi trường sống

Loại sợi chất lượng cao: Độ mảnh và khả năng nhuộm ưu việt

Thấm hút mồ hôi tốt, thoáng mát, rất thích hợp với thời tiết nóng ẩm việt Nam

In hoa Iris (Diên vĩ) - Van Gogh điểm nhấn trẻ trung, nghệ thuật','CA004','ao-T-shirt-nu-in-nguc-the-thao')




INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần jeen ngố nữ','','150000','women_quan_anh1.jpg','',100,N'Quần short jean nữ dáng ôm, chất liệu vải Cotton USA

Sợi vải Cotton USA có chứng nhận của Mỹ với độ bền cao, mềm mại và thân thiện cho da của bạn

Sản phẩm basic, chất liệu bền bỉ, thoải mái cho đôi chân của bạn

Thiết kế trên gối trẻ trung, năng động','CA005','quan-jeen-ngo-nu')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần âu nữ','','150000','women_quan_anh2.jpg','',100,N'Quần short jean nữ dáng ôm, chất liệu vải Cotton USA

Sợi vải Cotton USA có chứng nhận của Mỹ với độ bền cao, mềm mại và thân thiện cho da của bạn

Sản phẩm basic, chất liệu bền bỉ, thoải mái cho đôi chân của bạn

Thiết kế trên gối trẻ trung, năng động','CA005','quan-au-nu')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần jeen nữ ống đứng','','1500000','women_quan_anh3.jpg','',100,N'Quần short jean nữ dáng ôm, chất liệu vải Cotton USA

Sợi vải Cotton USA có chứng nhận của Mỹ với độ bền cao, mềm mại và thân thiện cho da của bạn

Sản phẩm basic, chất liệu bền bỉ, thoải mái cho đôi chân của bạn

Thiết kế trên gối trẻ trung, năng động','CA005','quan-jeen-nu-ong-dung')



INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần tây nữ ống đứng','','150000','women_quan_anh4.jpg','',100,N'Quần âu nữ cơ bản đỉa oze là dáng quần cơ bản, must-have-item trong tủ đồ các chị em công sở

Điểm nhấn đỉa oze đắt giá giúp sản phẩm không còn đơn điệu

Sản phẩm sử dụng chât liệu kate dày dặn vừa phải, form quần đứng, thoải mái mặc hàng ngày,

Dễ dàng mix cùng các sản phẩm như phông, sơ mi, polo...

YODY - Look good. Feel good.','CA005','quan-tay-nu-ong-dung')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần short nữ kaki','','170000','women_quan_anh5.jpg','',100,N'Quần short jean nữ dáng ôm, chất liệu vải Cotton USA

Sợi vải Cotton USA có chứng nhận của Mỹ với độ bền cao, mềm mại và thân thiện cho da của bạn

Sản phẩm basic, chất liệu bền bỉ, thoải mái cho đôi chân của bạn

Thiết kế trên gối trẻ trung, năng động','CA005','quan-short-nu-kaki')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần jeen nữ ống đứng cào xước','','100000','women_quan_anh6.jpg','',100,N'Quần jean nữ dáng ôm, chất liệu vải Cotton USA

Sợi vải Cotton USA có chứng nhận của Mỹ với độ bền cao, mềm mại và thân thiện cho da của bạn

Sản phẩm basic, chất liệu bền bỉ, thoải mái cho đôi chân của bạn

Thiết kế trên gối trẻ trung, năng động','CA005','quan-jeen-nu-ong-dung-cao-xuoc')


INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần short jean nữ','','140000','women_quan_anh7.jpg','',100,N'Quần short jean nữ dáng ôm, chất liệu vải Cotton USA

Sợi vải Cotton USA có chứng nhận của Mỹ với độ bền cao, mềm mại và thân thiện cho da của bạn

Sản phẩm basic, chất liệu bền bỉ, thoải mái cho đôi chân của bạn

Thiết kế trên gối trẻ trung, năng động','CA005','quan-short-jean-nu')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần short nữ ống rộng','','150000','women_quan_anh8.jpg','',100,N'Quần short jean nữ dáng ôm, chất liệu vải Cotton USA

Sợi vải Cotton USA có chứng nhận của Mỹ với độ bền cao, mềm mại và thân thiện cho da của bạn

Sản phẩm basic, chất liệu bền bỉ, thoải mái cho đôi chân của bạn

Thiết kế trên gối trẻ trung, năng động','CA005','quan-short-nu-ong-rong')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần short jean nữ bó cạp','','1100000','women_quan_anh9.jpg','',100,N'Quần short jean nữ dáng ôm, chất liệu vải Cotton USA

Sợi vải Cotton USA có chứng nhận của Mỹ với độ bền cao, mềm mại và thân thiện cho da của bạn

Sản phẩm basic, chất liệu bền bỉ, thoải mái cho đôi chân của bạn

Thiết kế trên gối trẻ trung, năng động','CA005','quan-short-jean-nu-bo-cap')









INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'chân váy xòe ','','150000','women_vay_anh1.jpg','',100,N'Chân váy chấm bi vải voan cát nhẹ nhàng, mềm mại

Một thiết kế nữ tính, thanh lịch cho các chị em

Độ bền cao, họa tiết chấm bi basic nhưng được thiết kế tỉ mỉ, chỉn chu

Chất liệu voan tạo cảm giác thoải mái khi sử dụng','CA006','chan-vay-xoe')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'chân váy ôm','','150000','women_vay_anh2.jpg','',100,N'Chân váy chấm bi vải voan cát nhẹ nhàng, mềm mại

Một thiết kế nữ tính, thanh lịch cho các chị em

Độ bền cao, họa tiết chấm bi basic nhưng được thiết kế tỉ mỉ, chỉn chu

Chất liệu voan tạo cảm giác thoải mái khi sử dụng','CA006','chan-vay-om')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'chân váy dài','','1500000','women_vay_anh3.jpg','',100,N'Chân váy chấm bi vải voan cát nhẹ nhàng, mềm mại

Một thiết kế nữ tính, thanh lịch cho các chị em

Độ bền cao, họa tiết chấm bi basic nhưng được thiết kế tỉ mỉ, chỉn chu

Chất liệu voan tạo cảm giác thoải mái khi sử dụng','CA006','chan-vay-dai')



INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'chân polo cafe nữ ','','1000000','women_vay_anh4.jpg','',100,N'Kiếm soát mùi cực kỳ hiệu quả

Chống tia UV, thoải mái khi sử dụng

Đầm polo nữ dáng A, vừa tôn dáng vừa thanh lịch

Bo cổ, bo tay, phối màu hiện đại, thích hợp mặc đi làm, đi chơi, đi học

YODY - Look good. Feel good.','CA006','chan-vay-polo-cafe-nu')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'váy chữ A cổ V','','150000','women_vay_anh5.jpg','',100,N'Váy có độ bóng mờ đặc trưng của chất vải, khi cầm vào rất mịn, dày dặn và rất “đứng vải”, không rủ mềm bám vào da.

Thiết kế đầm dáng xòe cùng với chi tiết chiết eo ôm sát cực kỳ điệu đà giúp tôn lên vòng eo thon thả.

Chi tiết bông hoa ở ngực tạo điểm nhấn tạo nên sự sang trọng, uyển chuyển.','CA006','vay-chu-A-co-V')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'váy xòe da báo','','1100000','women_vay_anh6.jpg','',100,N'Chân váy chấm bi vải voan cát nhẹ nhàng, mềm mại

Một thiết kế nữ tính, thanh lịch cho các chị em

Độ bền cao, họa tiết chấm bi basic nhưng được thiết kế tỉ mỉ, chỉn chu

Chất liệu voan tạo cảm giác thoải mái khi sử dụng','CA006','vay-xoe-da-bao')

INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'váy xòe voan hoa ','','150000','women_vay_anh7.jpg','',100,N'Chân váy chấm bi vải voan cát nhẹ nhàng, mềm mại

Một thiết kế nữ tính, thanh lịch cho các chị em

Độ bền cao, họa tiết chấm bi basic nhưng được thiết kế tỉ mỉ, chỉn chu

Chất liệu voan tạo cảm giác thoải mái khi sử dụng','CA006','vay-xoe-voan-hoa')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'đầm nữ phối ren','','150000','women_vay_anh8.jpg','',100,N'Chân váy chấm bi vải voan cát nhẹ nhàng, mềm mại

Một thiết kế nữ tính, thanh lịch cho các chị em

Độ bền cao, họa tiết chấm bi basic nhưng được thiết kế tỉ mỉ, chỉn chu

Chất liệu voan tạo cảm giác thoải mái khi sử dụng','CA006','dam-nu-phoi-ren')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'đầm nữ sơ mi da báo','','1500000','women_vay_anh9.jpg','',100,N'Chân váy chấm bi vải voan cát nhẹ nhàng, mềm mại

Một thiết kế nữ tính, thanh lịch cho các chị em

Độ bền cao, họa tiết chấm bi basic nhưng được thiết kế tỉ mỉ, chỉn chu

Chất liệu voan tạo cảm giác thoải mái khi sử dụng','CA006','dam-nu-so-mi-da-bao')




INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo thun trẻ em','','150000','kid_ao_anh1.jpg','',100,N'Chất liệu Cotton

Vải mềm mại, bền bỉ, an toàn với làn da bé

Thấm hút mồ hôi cực tốt, thoáng mát rất thích hợp với thời tiết nóng ẩm của Việt Nam

Kiểu dáng suông rộng phù hợp mọi vóc dáng','CA007','ao-thun-tre-em')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo polo trẻ em','','150000','kid_ao_anh2.jpg','',100,N'Chất liệu Cotton

Vải mềm mại, bền bỉ, an toàn với làn da bé

Thấm hút mồ hôi cực tốt, thoáng mát rất thích hợp với thời tiết nóng ẩm của Việt Nam

Kiểu dáng suông rộng phù hợp mọi vóc dáng','CA007','ao-polo-tre-em')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo phông trẻ em','','1500000','kid_ao_anh3.jpg','',100,N'Chất liệu Cotton

Vải mềm mại, bền bỉ, an toàn với làn da bé

Thấm hút mồ hôi cực tốt, thoáng mát rất thích hợp với thời tiết nóng ẩm của Việt Nam

Kiểu dáng suông rộng phù hợp mọi vóc dáng','CA007','ao-phong-tre-em')

INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo polo trẻ em cafe','','150000','kid_ao_anh4.jpg','',100,N'Chất liệu Cotton

Vải mềm mại, bền bỉ, an toàn với làn da bé

Thấm hút mồ hôi cực tốt, thoáng mát rất thích hợp với thời tiết nóng ẩm của Việt Nam

Kiểu dáng suông rộng phù hợp mọi vóc dáng','CA007','ao-polo-tre-em-cafe')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo polo trẻ em thể thao','','150000','kid_ao_anh5.jpg','',100,N'Chất liệu Cotton

Vải mềm mại, bền bỉ, an toàn với làn da bé

Thấm hút mồ hôi cực tốt, thoáng mát rất thích hợp với thời tiết nóng ẩm của Việt Nam

Kiểu dáng suông rộng phù hợp mọi vóc dáng','CA007','ao-polo-tre-em-the-thao')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'áo polo trẻ em mắt chim','','1500000','kid_ao_anh6.jpg','',100,N'Chất liệu Cotton

Vải mềm mại, bền bỉ, an toàn với làn da bé

Thấm hút mồ hôi cực tốt, thoáng mát rất thích hợp với thời tiết nóng ẩm của Việt Nam

Kiểu dáng suông rộng phù hợp mọi vóc dáng','CA007','ao-polo-tre-em-mat-chim')



INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần short bé gái','','150000','kid_quan_anh1.jpg','',100,N'Chất liệu: Vải kaki với thành phần  97% Cotton + 3% Spandex

Bền chắc, ít nhăn và không xù lông

Thoáng mát, dễ chịu

Thoải mái vận động với sợi vải co giãn từ Spandex

Thân thiện với môi trường','CA008','quan-short-be-gai')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần short bé trai','','150000','kid_quan_anh2.jpg','',100,N'Chất liệu: Vải kaki với thành phần  97% Cotton + 3% Spandex

Bền chắc, ít nhăn và không xù lông

Thoáng mát, dễ chịu

Thoải mái vận động với sợi vải co giãn từ Spandex

Thân thiện với môi trường','CA008','quan-short-be-trai')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần sooc trẻ em','','1500000','kid_quan_anh3.jpg','',100,N'Chất liệu: Vải kaki với thành phần  97% Cotton + 3% Spandex

Bền chắc, ít nhăn và không xù lông

Thoáng mát, dễ chịu

Thoải mái vận động với sợi vải co giãn từ Spandex

Thân thiện với môi trường','CA008','quan-sooc-tre-em')



INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần short bé trai kaki','','140000','kid_quan_anh4.jpg','',100,N'Chất liệu: Vải kaki với thành phần  97% Cotton + 3% Spandex

Bền chắc, ít nhăn và không xù lông

Thoáng mát, dễ chịu

Thoải mái vận động với sợi vải co giãn từ Spandex

Thân thiện với môi trường','CA008','quan-short-be-trai-kaki')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần short bé gái cạp chun','','150000','kid_quan_anh5.jpg','',100,N'Chất liệu: Vải kaki với thành phần  97% Cotton + 3% Spandex

Bền chắc, ít nhăn và không xù lông

Thoáng mát, dễ chịu

Thoải mái vận động với sợi vải co giãn từ Spandex

Thân thiện với môi trường','CA008','quan-short-be-gai-cap-chun')
INSERT INTO [dbo].[Product]([P_id],[P_name],[P_discount],[P_Price],[P_image],[P_note],[P_amount],[P_content],[P_CAID],[P_slug])
VALUES('',N'quần sooc bé gái kaki','','1500000','kid_quan_anh6.jpg','',100,N'Chất liệu: Vải kaki với thành phần  97% Cotton + 3% Spandex

Bền chắc, ít nhăn và không xù lông

Thoáng mát, dễ chịu

Thoải mái vận động với sợi vải co giãn từ Spandex

Thân thiện với môi trường','CA008','quan-sooc-be-gai-kaki')


go


INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P001')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P001')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P001')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P001')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','3XL','P001')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P002')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P002')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P002')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P003')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P003')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P003')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P003')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P004')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P004')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P004')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P004')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','3XL','P004')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P005')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P005')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P005')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P006')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P006')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P006')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P006')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','3XL','P006')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P007')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P007')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P008')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P008')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P008')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P010')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P010')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P010')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P010')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P011')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P011')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P011')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P011')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P012')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P012')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P012')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P012')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P013')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P013')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P013')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P013')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P014')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P014')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P014')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P015')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P015')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P016')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P016')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P016')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P017')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P017')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P017')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P018')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P018')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P018')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P019')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P019')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P019')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P020')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P020')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P020')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P020')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P021')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P021')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P021')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P021')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P022')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P022')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P023')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P023')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P023')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P023')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P024')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P024')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P024')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P025')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P025')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P025')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P025')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P026')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P026')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P026')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P026')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','3XL','P026')


INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P027')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P027')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P027')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P028')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P028')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P028')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','S','P029')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P029')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P029')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P029')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P029')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','S','P030')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P030')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P030')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P030')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P030')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','S','P031')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P031')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P031')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','S','P032')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P032')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P032')



INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P033')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P033')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P033')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P033')



INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P034')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P034')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P034')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P035')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P035')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P035')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P035')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P036')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P036')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P037')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P037')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P037')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P037')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P038')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P038')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P038')



INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','S','P039')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XS','P039')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P039')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P039')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P040')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P040')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P040')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P040')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','3XL','P040')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P041')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P041')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P041')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P041')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','4XL','P041')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P042')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P042')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P042')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P043')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P043')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P044')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P044')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P044')


INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P045')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P045')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P045')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P045')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P046')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P046')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P046')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P047')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P047')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P047')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P047')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P048')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P048')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P048')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P048')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','3XL','P048')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P049')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P049')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P049')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P049')


INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P050')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P050')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P051')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P051')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P051')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P051')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P052')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P052')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P052')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P052')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P053')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P053')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P053')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','S','P054')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XS','P054')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P055')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P055')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P055')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P055')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P056')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P056')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P056')

INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','L','P057')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','M','P057')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','XL','P057')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','2XL','P057')
INSERT INTO [dbo].[Size]([S_id],[S_name],[S_PID])VALUES('','3XL','P057')


go


INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P001','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P001','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P001','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'xanh','P001','blue')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P002','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P002','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P003','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P003','black')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P004','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P004','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P004','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P005','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P005','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P005','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P006','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P006','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P006','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'xanh','P006','blue')


INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P007','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P007','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P008','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P008','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P008','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P009','red')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P010','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P010','black')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P011','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P011','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P011','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'xanh','P011','blue')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P012','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P012','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P012','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P013','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P013','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P013','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P014','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P014','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P014','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'xanh','P014','blue')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P015','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P015','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P015','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'vàng','P015','yellow')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P016','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P016','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P017','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P017','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P017','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P018','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P018','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P018','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'vàng','P015','yellow')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P019','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P019','black')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P020','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P020','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P020','white')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P021','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P021','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P021','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P022','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P022','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P022','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P023','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P023','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P023','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P024','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P024','black')


INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P025','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P025','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P026','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P026','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P026','white')


INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P027','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P027','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P027','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P028','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P028','black')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P029','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P029','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P029','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P030','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P030','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P030','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'vàng ','P030','yellow')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'xanh','P030','blue')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P031','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P031','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P031','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'xanh','P031','blue')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P032','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P032','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P032','white')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P033','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P033','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P033','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P034','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P034','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P034','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P035','red')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P035','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P036','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P036','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P036','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P037','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P037','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P037','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P038','red')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P038','white')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P039','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P039','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P039','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P040','red')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P040','white')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P041','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P042','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P042','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P042','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P043','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P043','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P043','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P044','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P044','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P044','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'vàng','P044','yellow')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'xanh','P044','blue')



INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P045','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P045','white')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P046','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P046','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P047','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P047','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P047','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P048','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P048','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P048','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P049','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P049','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P049','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P050','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P050','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P050','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'vàng','P050','yellow')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'xanh','P050','blue')


INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P051','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P051','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P051','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'vàng','P051','yellow')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'xanh','P051','blue')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P052','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P052','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P052','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P053','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P053','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P053','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P054','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P054','black')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P055','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P055','black')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đỏ','P056','red')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P056','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P056','white')

INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'Đen','P057','black')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'trắng','P057','white')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'vàng','P057','yellow')
INSERT INTO [dbo].[Color]([COL_id],[COL_name],[COL_PID],[COL_slug]) VALUES('',N'xanh','P057','blue')
go


insert into cart values('','U001','online','true','2022-2-2')
insert into cart values('','U002','online','true','2022-2-12')
insert into cart values('','U003','online','true','2022-11-2')
insert into cart values('','U004','online','true','2022-6-2')
insert into cart values('','U005','online','true','2022-2-8')
insert into cart values('','U006','online','true','2022-2-2')
insert into cart values('','U007','online','true','2022-11-2')
insert into cart values('','U008','online','true','2022-2-2')
insert into cart values('','U010','online','true','2022-2-4')


go


INSERT INTO cartdeta VALUES('','P001','CAR001',N'Red','L',1)
INSERT INTO cartdeta VALUES('','P001','CAR002',N'Red','L',1)
INSERT INTO cartdeta VALUES('','P001','CAR003',N'Black','XL',1)
INSERT INTO cartdeta VALUES('','P002','CAR004',N'Red','L',1)
INSERT INTO cartdeta VALUES('','P002','CAR005',N'Black','M',1)
INSERT INTO cartdeta VALUES('','P001','CAR006',N'Red','L',1)
INSERT INTO cartdeta VALUES('','P001','CAR007',N'White','2XL',1)
INSERT INTO cartdeta VALUES('','P001','CAR008',N'Red','L',1)
INSERT INTO cartdeta VALUES('','P004','CAR009',N'Black','XL',1)



go






select * from Product 
join catalog on catalog.CA_id =Product.P_CAID 
join style on style.ST_id =catalog.CA_STID 
join Color on Color.COL_PID= Product.P_id
join Size on P_id = S_PID
where ST_slug = 'men'

select * from Users
join Cart on users.U_id = cart.CAR_UID
where u_name = 'user1'

select * from Cartdeta
join cart on Cartdeta.CD_CarID = cart.CAR_id
join users on users.U_id = cart.CAR_UID
where u_name = 'user1'

delete from Cartdeta
where Cartdeta.CD_id = 'CD012'
delete from Cartdeta
where Cartdeta.CD_id = 'CD013'
delete from Cartdeta
where Cartdeta.CD_id = 'CD014'
delete from Cartdeta
where Cartdeta.CD_id = 'CD015'
delete from Cartdeta
where Cartdeta.CD_id = 'CD016'

select * from Cartdeta
where CD_CarID = 'CAR001'

select * from Cartdeta
where CD_PID = 'P001'
and CD_CarID = 'CAR001'

select * from cart
join users on cart.CAR_UID = users.U_id
join Cartdeta on Cart.CAR_id = Cartdeta.CD_CarID

select * from users