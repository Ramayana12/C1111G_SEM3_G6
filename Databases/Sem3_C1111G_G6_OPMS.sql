USE master
GO

IF EXISTS (SELECT * FROM sysdatabases WHERE NAME = 'OPMS')
	DROP DATABASE OPMS
GO

--- **** _____ CREATE NEW DATABASE  _____ **** ---
CREATE DATABASE OPMS
GO

USE OPMS
GO

-------------------------------------------------------------------------------------------------------------
--- **** _____ CREATE TABLES  _____ **** ---

CREATE TABLE Branch
(
	ID int IDENTITY(1,1) CONSTRAINT pk_Branch_ID PRIMARY KEY,
	Name NVarchar(50) NOT NULL CONSTRAINT uq_Branch_Name UNIQUE,
	Email Varchar(50),
	Phone Varchar(20),
	[Address] NVarchar(100),
	[Description] NVarchar(MAX)
);

CREATE TABLE Account
(
	ID int IDENTITY(1,1) CONSTRAINT pk_Account_ID PRIMARY KEY,
	BranchID int CONSTRAINT fk_Account_Branch FOREIGN KEY (BranchID) REFERENCES Branch(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	UserName varchar(50) NOT NULL CONSTRAINT uq_Account_UserName UNIQUE,
	[Password] varchar(32) NOT NULL,
	[Role] Varchar(15) NOT NULL CONSTRAINT ck_Account_Role CHECK ([Role] IN ('Administrator', 'Employee')),
	FullName NVarchar(50) NOT NULL,
	Email Varchar(50),
	Phone varchar(20),
	[Address] NVarchar(100),
	BirthDate datetime,
	CreateDate datetime CONSTRAINT df_Account_CreateDate DEFAULT GETDATE(),
	Picture Varchar(300) CONSTRAINT df_Account_Picture DEFAULT '~/Admin/imageEmployees/anonymous.png',
	[Description] NVarchar(MAX),
	Active bit CONSTRAINT df_Account_Active DEFAULT 1
);

CREATE TABLE ServiceCharge
(
	ID int IDENTITY(1,1) CONSTRAINT pk_ServiceCharge_ID PRIMARY KEY,
	Name Nvarchar(20) NOT NULL CONSTRAINT uq_ServiceCharge_Name UNIQUE,
	Charge money,
	[Description] NVarchar(MAX)
);

CREATE TABLE DistanceCharge
(
	ID int IDENTITY(1,1) CONSTRAINT pk_DistanceCharge_ID PRIMARY KEY,
	Name Nvarchar(20) NOT NULL CONSTRAINT uq_DistanceCharge_Name UNIQUE,
	Charge money,
	[Description] NVarchar(MAX)
);

CREATE TABLE WeightCharge
(
	ID int IDENTITY(1,1) CONSTRAINT pk_WeightCharge_ID PRIMARY KEY,
	Name Nvarchar(20) NOT NULL CONSTRAINT uq_WeightCharge_Name UNIQUE,
	Charge money,
	[Description] NVarchar(MAX)
);

CREATE TABLE [Order]
(
	ID int IDENTITY(1,1) CONSTRAINT pk_Order_ID PRIMARY KEY,
	CreateDate datetime CONSTRAINT df_Order_CreateDate DEFAULT GETDATE(),	
	
	--SENDER
	SenderName Nvarchar(50) NOT NULL,
	SenderAddress NVarchar(300) NOT NULL,
	SenderPhone Varchar(15) NOT NULL,
	EmployeeID int CONSTRAINT fk_Oder_Account1 FOREIGN KEY (EmployeeID) REFERENCES Account(ID),
	
	--RECEIVER
	ReceiverName Nvarchar(50) NOT NULL,
	ReceiverAddress NVarchar(300) NOT NULL,
	ReceiverPhone Varchar(15) NOT NULL,
	DeliveryEmployeeID int CONSTRAINT fk_Oder_Account2 FOREIGN KEY (DeliveryEmployeeID) REFERENCES Account(ID),
	ReceiveDate datetime,
	
	--MAIL
	ServiceChargeID int CONSTRAINT fk_Order_ServiceCharge FOREIGN KEY (ServiceChargeID) REFERENCES ServiceCharge(ID),
	DistanceChargeID int CONSTRAINT fk_Order_DistanceCharge FOREIGN KEY (DistanceChargeID) REFERENCES DistanceCharge(ID),
	WeightChargeID int CONSTRAINT fk_Order_WeightCharge FOREIGN KEY (WeightChargeID) REFERENCES WeightCharge(ID),
	Total money,

	--STATUS
	[Status] NVarchar(20) DEFAULT 'Sending' CONSTRAINT ck_Order_Status CHECK ([Status] IN ('Sending', 'Sent', 'Return')),
	Note NVarchar(300),
);

CREATE TABLE News
(
	ID int IDENTITY(1,1) CONSTRAINT pk_News_ID PRIMARY KEY,
	Title NVarchar(500),
	[Subject] NText,
	Content NText,
	CreateDate datetime CONSTRAINT df_News_CreateDate DEFAULT GETDATE(),
	Active bit CONSTRAINT df_News_Active DEFAULT 1
);

CREATE TABLE FeedBack
(
	ID int IDENTITY(1,1) CONSTRAINT pk_FeedBack_ID PRIMARY KEY,
	FullName NVarchar(50) NOT NULL,
	Email Varchar(50) NOT NULL,
	Content NText,
	CreateDate datetime CONSTRAINT df_FeedBack_CreateDate DEFAULT GETDATE(),
);

GO

-------------------------------------------------------------------------------------------------------------

							/******************** PROCEDURE **********************/

-------------------------------------------------------------------------------------------------------------

									--- **** _____ BRANCHES _____ **** ---
CREATE PROCEDURE insertBranch
@Name NVarchar(50),
@Email Varchar(50),
@Phone Varchar(20),
@Address NVarchar(100),
@Description NVarchar(MAX)
AS
	INSERT INTO Branch 
	VALUES (@Name, @Email, @Phone, @Address, @Description);
GO

CREATE PROCEDURE updateBranch
@ID int,
@Name NVarchar(50),
@Email Varchar(50),
@Phone Varchar(20),
@Address NVarchar(100),
@Description NVarchar(MAX)
AS
	UPDATE Branch 
	SET Name = @Name,
		Email = @Email, 
		Phone = @Phone,
		[Address] = @Address,
		[Description] = @Description
	WHERE ID = @ID
GO

CREATE PROCEDURE deleteBranch
@ID int
AS
	DELETE FROM Branch
	WHERE ID = @ID
GO

CREATE PROCEDURE getAllBranch
AS
	SELECT * FROM Branch
GO

CREATE PROCEDURE getBranchByID
@ID int
AS
	SELECT * FROM Branch
	WHERE ID = @ID
GO

CREATE PROCEDURE getBranchByName
@Name NVarchar(50)
AS
	SELECT * FROM Branch
	WHERE Name = @Name
GO

CREATE PROCEDURE searchBranchByName
@Name NVarchar(50)
AS
	SELECT * FROM Branch
	WHERE Name LIKE ('%'+@Name+'%')
GO

									--- **** _____ ACCOUNTS _____ **** ---

CREATE PROCEDURE insertAccount
@BranchID int,
@UserName varchar(50),
@Password varchar(20) ,
@Role Varchar(15),
@FullName NVarchar(50),
@Email Varchar(50),
@Phone varchar(20),
@Address NVarchar(100),
@BirthDate datetime,
@Picture Varchar(300),
@Description NVarchar(MAX)
AS
	INSERT INTO Account(BranchID, UserName, [Password], [Role], FullName, Email, Phone, [Address], BirthDate, Picture, [Description])
	VALUES (@BranchID, @UserName, @Password, @Role, @FullName, @Email, @Phone, @Address, @BirthDate, @Picture, @Description);
GO

CREATE PROCEDURE updateAccount
@ID int,
@BranchID int,
@UserName varchar(50),
@Password varchar(20) ,
@Role Varchar(15),
@FullName NVarchar(50),
@Email Varchar(50),
@Phone varchar(20),
@Address NVarchar(100),
@BirthDate datetime,
@Picture Varchar(300),
@Description NVarchar(MAX),
@Active bit
AS
	UPDATE Account
	SET BranchID = @BranchID,
		UserName = @UserName,
		[Password] = @Password,
		[Role] = @Role,
		FullName = @FullName,
		Email = @Email,
		Phone = @Phone,
		[Address] = @Address,
		BirthDate = @BirthDate,
		Picture = @Picture,
		[Description] = @Description,
		Active = @Active
	WHERE ID = @ID
GO

CREATE PROCEDURE deleteAccount
@ID int
AS
	DELETE FROM Account
	WHERE ID = @ID
GO
									
CREATE PROCEDURE getAllAccount
AS
	SELECT * FROM Account
GO

CREATE PROCEDURE getAccountByID
@ID int
AS
	SELECT * FROM Account
	WHERE ID = @ID
GO

CREATE PROCEDURE getAccountByBranchID
@BranchID int
AS
	SELECT * FROM Account A
	INNER JOIN Branch B
	ON A.BranchID = B.ID
	WHERE A.BranchID = @BranchID
GO

CREATE PROCEDURE getAccountByUserName
@UserName NVarchar(50)
AS
	SELECT * FROM Account
	WHERE UserName = @UserName
GO

CREATE PROCEDURE getAccountByActive
@Active bit
AS
	SELECT * FROM Account
	WHERE Active = @Active
GO

CREATE PROCEDURE getAccountByRole
@Role Varchar(15)
AS
	SELECT * FROM Account
	WHERE Role = @Role
GO

CREATE PROCEDURE searchAccountByUserName
@UserName NVarchar(50)
AS
	SELECT * FROM Account
	WHERE UserName LIKE ('%'+@UserName+'%')
GO

CREATE PROCEDURE searchAccountByFullName
@FullName NVarchar(50)
AS
	SELECT * FROM Account
	WHERE FullName LIKE ('%'+@FullName+'%')
GO

CREATE PROCEDURE searchAccountByName
@Name NVarchar(50)
AS
	SELECT * FROM Account
	WHERE UserName LIKE ('%'+@Name+'%') OR FullName LIKE ('%'+@Name+'%')
GO

CREATE PROCEDURE checkLoginAccount
@UserName varchar(50),
@Password varchar(20)
AS
	SELECT * FROM Account
	WHERE UserName = @UserName AND [Password] = @Password	
GO

									--- **** _____ Order _____ **** ---
									
CREATE PROCEDURE insertOrder
@SenderName Nvarchar(50),
@SenderAddress NVarchar(300),
@SenderPhone Varchar(15),
@EmployeeID int,	
@ReceiverName Nvarchar(50),
@ReceiverAddress NVarchar(300),
@ReceiverPhone Varchar(15),
@ServiceChargeID int,
@DistanceChargeID int,
@WeightChargeID int,
@Total money,
@Note NVarchar(300)
AS
	INSERT INTO [Order](SenderName,SenderAddress,SenderPhone,EmployeeID,ReceiverName,ReceiverAddress,ReceiverPhone,ServiceChargeID,DistanceChargeID,WeightChargeID,Total,Note) 
	VALUES (@SenderName,@SenderAddress,@SenderPhone,@EmployeeID,@ReceiverName,@ReceiverAddress,@ReceiverPhone,@ServiceChargeID,@DistanceChargeID,@WeightChargeID,@Total,@Note)
GO

CREATE PROCEDURE updateOrder
@ID int,
@SenderName Nvarchar(50),
@SenderAddress NVarchar(300),
@SenderPhone Varchar(15),
@EmployeeID int,	
@ReceiverName Nvarchar(50),
@ReceiverAddress NVarchar(300),
@ReceiverPhone Varchar(15),
@DeliveryEmployeeID int,
@ReceiveDate datetime,
@ServiceChargeID int,
@DistanceChargeID int,
@WeightChargeID int,
@Total money,
@Status NVarchar(20),
@Note NVarchar(300)
AS
	UPDATE [Order] 
	SET SenderName = @SenderName,
		SenderAddress = @SenderAddress,
		SenderPhone = @SenderPhone,
		EmployeeID = @EmployeeID,	
		ReceiverName = @ReceiverName,
		ReceiverAddress = @ReceiverAddress,
		ReceiverPhone = @ReceiverPhone,
		DeliveryEmployeeID = @DeliveryEmployeeID,
		ReceiveDate = @ReceiveDate,
		ServiceChargeID = @ServiceChargeID,
		DistanceChargeID = @DistanceChargeID,
		WeightChargeID = @WeightChargeID,
		Total = @Total,
		[Status] = @Status,
		Note = @Note
	WHERE ID = @ID
GO

CREATE PROCEDURE deleteOrder
@ID int
AS
	DELETE FROM [Order]
	WHERE ID = @ID
GO

CREATE PROCEDURE getAllOrder
AS
	SELECT * FROM [Order]
GO

CREATE PROCEDURE getOrderByID
@ID int
AS
	SELECT * FROM [Order]
	WHERE ID = @ID
GO

CREATE PROCEDURE searchOrderByName
@Name NVarchar(50)
AS
	SELECT * FROM [Order]
	WHERE SenderName LIKE ('%'+@Name+'%') OR ReceiverName LIKE ('%'+@Name+'%')
GO

CREATE PROCEDURE getOrderByStatus
@Status NVarchar(20)
AS
	SELECT * FROM [Order]
	WHERE [Status] = @Status
GO	

CREATE PROCEDURE getOrderByServiceID
@ServiceChargeID int
AS
	SELECT * FROM [Order]
	WHERE ServiceChargeID = @ServiceChargeID
GO	

CREATE PROCEDURE getOrderByDistanceID
@DistanceChargeID int
AS
	SELECT * FROM [Order]
	WHERE DistanceChargeID = @DistanceChargeID
GO	

CREATE PROCEDURE getOrderByWeightID
@WeightChargeID int
AS
	SELECT * FROM [Order]
	WHERE WeightChargeID = @WeightChargeID
GO											

									--- **** _____ ServiceCharge _____ **** ---		
									
CREATE PROCEDURE insertServiceCharge
@Name Nvarchar(20),
@Charge money,
@Description NVarchar(MAX)
AS
	INSERT INTO ServiceCharge 
	VALUES (@Name, @Charge, @Description);
GO

CREATE PROCEDURE updateServiceCharge
@ID int,
@Name Nvarchar(20),
@Charge money,
@Description NVarchar(MAX)
AS
	UPDATE ServiceCharge 
	SET Name = @Name,
		Charge = @Charge,
		[Description] = @Description
	WHERE ID = @ID
GO

CREATE PROCEDURE deleteServiceCharge
@ID int
AS
	DELETE FROM ServiceCharge
	WHERE ID = @ID
GO

CREATE PROCEDURE getAllServiceCharge
AS
	SELECT * FROM ServiceCharge
GO

CREATE PROCEDURE getServiceChargeByID
@ID int
AS
	SELECT * FROM ServiceCharge
	WHERE ID = @ID
GO

CREATE PROCEDURE getServiceChargeByName
@Name Nvarchar(20)
AS
	SELECT * FROM ServiceCharge
	WHERE Name = @Name
GO												

									--- **** _____ DistanceCharge _____ **** ---		
									
CREATE PROCEDURE insertDistanceCharge
@Name Nvarchar(20),
@Charge money,
@Description NVarchar(MAX)
AS
	INSERT INTO DistanceCharge 
	VALUES (@Name, @Charge, @Description);
GO

CREATE PROCEDURE updateDistanceCharge
@ID int,
@Name Nvarchar(20),
@Charge money,
@Description NVarchar(MAX)
AS
	UPDATE DistanceCharge 
	SET Name = @Name,
		Charge = @Charge,
		[Description] = @Description
	WHERE ID = @ID
GO

CREATE PROCEDURE deleteDistanceCharge
@ID int
AS
	DELETE FROM DistanceCharge
	WHERE ID = @ID
GO

CREATE PROCEDURE getAllDistanceCharge
AS
	SELECT * FROM DistanceCharge
GO

CREATE PROCEDURE getDistanceChargeByID
@ID int
AS
	SELECT * FROM DistanceCharge
	WHERE ID = @ID
GO

CREATE PROCEDURE getDistanceChargeByName
@Name Nvarchar(20)
AS
	SELECT * FROM DistanceCharge
	WHERE Name = @Name
GO													

									--- **** _____ WeightCharge _____ **** ---		
									
CREATE PROCEDURE insertWeightCharge
@Name Nvarchar(20),
@Charge money,
@Description NVarchar(MAX)
AS
	INSERT INTO WeightCharge 
	VALUES (@Name, @Charge, @Description);
GO

CREATE PROCEDURE updateWeightCharge
@ID int,
@Name Nvarchar(20),
@Charge money,
@Description NVarchar(MAX)
AS
	UPDATE WeightCharge 
	SET Name = @Name,
		Charge = @Charge,
		[Description] = @Description
	WHERE ID = @ID
GO

CREATE PROCEDURE deleteWeightCharge
@ID int
AS
	DELETE FROM WeightCharge
	WHERE ID = @ID
GO

CREATE PROCEDURE getAllWeightCharge
AS
	SELECT * FROM WeightCharge
GO

CREATE PROCEDURE getWeightChargeByID
@ID int
AS
	SELECT * FROM WeightCharge
	WHERE ID = @ID
GO

CREATE PROCEDURE getWeightChargeByName
@Name Nvarchar(20)
AS
	SELECT * FROM WeightCharge
	WHERE Name = @Name
GO	

									--- **** _____ News _____ **** ---

CREATE PROCEDURE insertNews
@Title NVarchar(500),
@Subject NText,
@Content NText
AS
	INSERT INTO News(Title, [Subject], Content) 
	VALUES (@Title, @Subject, @Content);
GO

CREATE PROCEDURE updateNews
@ID int,
@Title NVarchar(500),
@Subject NText,
@Content NText,
@Active bit
AS
	UPDATE News 
	SET Title = @Title,
		[Subject] = @Subject,
		Content = @Content,
		Active = @Active
	WHERE ID = @ID
GO

CREATE PROCEDURE deleteNews
@ID int
AS
	DELETE FROM News
	WHERE ID = @ID
GO

CREATE PROCEDURE getAllNews
AS
	SELECT * FROM News
GO

CREATE PROCEDURE getNewsByID
@ID int
AS
	SELECT * FROM News
	WHERE ID = @ID
GO

CREATE PROCEDURE SearchNewsByTitle
@Title NVarchar(500)
AS
	SELECT * FROM News
	WHERE Title LIKE ('%'+@Title+'%')
GO

									--- **** _____ FeedBack _____ **** ---

CREATE PROCEDURE insertFeedBack
@FullName NVarchar(50),
@Email Varchar(50),
@Content NText
AS
	INSERT INTO FeedBack (FullName, Email, Content)
	VALUES (@FullName, @Email, @Content);
GO

CREATE PROCEDURE updateFeedBack
@ID int,
@FullName NVarchar(50),
@Email Varchar(50),
@Content NText
AS
	UPDATE FeedBack 
	SET FullName = @FullName,
		Email = @Email,
		Content = @Content
	WHERE ID = @ID
GO

CREATE PROCEDURE deleteFeedBack
@ID int
AS
	DELETE FROM FeedBack
	WHERE ID = @ID
GO

CREATE PROCEDURE getAllFeedBack
AS
	SELECT * FROM FeedBack
GO

CREATE PROCEDURE getFeedBackByID
@ID int
AS
	SELECT * FROM FeedBack
	WHERE ID = @ID
GO

CREATE PROCEDURE searchFeedBackByName
@FullName NVarchar(50)
AS
	SELECT * FROM FeedBack
	WHERE FullName LIKE ('%'+@FullName+'%')
GO

-------------------------------------------------------------------------------------------------------------------

INSERT INTO Branch VALUES('Ha Noi','HN@abc.com','0123456789','Ha noi','Viet Nam capital'),
						('Hai Phong','HP@abc.com','0987654321','Hai phong',''),
						('Hue','Hue@abc.com','0852147963','Hai phong',''),
						('Da Nang','DN@abc.com','0963258741','Hai phong',''),
						('Nha Trang','NT@abc.com','0852369741','Hai phong',''),
						('TP HCM','HCM@abc.com','0147852369','Sai Gon','big city')

EXECUTE insertAccount 1, 'Admin', 'e10adc3949ba59abbe56e057f20f883e', 'Administrator', 'Super Admin', 'sa@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', 'Default Admin';

EXECUTE insertAccount 1, 'Employee', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Staff', 'sf@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 1, 'QuanDN', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Duong Ngoc Quan', 'Quandn@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 2, 'Dungnt', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Nguyen Tan Dung', 'dungnt@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 2, 'DuyTV', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Tran Van Duy', 'Duytv@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 3, 'Chinhdt', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Do Trung Chinh', 'Chinhdt@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 4, 'VietNV', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Ngo Van Viet', 'VietNV@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 5, 'LinhHT', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Hoang Thuy Linh', 'LinhHT@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 6, 'Trinh', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Ngoc Trinh', 'Trinh@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 6, 'AnNV', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Nguyen Van An', 'Annv@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 1, 'NghiPQ', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Pham Quang Nghi', 'NghiPQ@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 2, 'DoanNH', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Nguyen Huu Doan', 'DoanNH@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 3, 'DatPT', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Pham Tien Dat', 'DatPT@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 4, 'LuongLV', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Le Van Luong', 'LuongLV@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 5, 'ThanhNC', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Nguyen Chi Thanh', 'ThanhNC@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 6, 'QuatCB', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Cao Ba Quat', 'QuatCB@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 1, 'DonLQ', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Le Quy Don', 'DonLQ@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 2, 'NghiLT', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Le Thanh Nghi', 'NghiLT@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 3, 'TungTT', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Ton That Tung', 'TungTT@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';
EXECUTE insertAccount 4, 'ThaiHV', 'e10adc3949ba59abbe56e057f20f883e', 'Employee', 'Hoang Van Thai', 'ThaiHV@abc.com', '', '', '', '~/Admin/imageEmployees/anonymous.png', '';

GO

INSERT INTO ServiceCharge VALUES ('NORMAL MAIL', 3, 'This service usually transfer mail allows the sender of the parcel or letter. This service is offered to customers who do not require in terms of time, with features such Normal Mail is the appropriate choice for customers.'),
								 ('EXPRESS MAIL', 5, 'This service allows people to send parcels quickly and ensures on-time service will be transported in the shortest possible time, possibly within a day.'),								 
								 ('VPP', 7, 'This is a service that allows people to send parcels to recipients, and recipients will pay for the cost of parcel post.')							 

INSERT INTO DistanceCharge VALUES ('Local', 2, ''),
								 ('Up to 100 Km', 4, ''),
								 ('Over 100 - 300 Km', 8, ''),
								 ('Over 300 - 500 Km', 14, ''),
								 ('Over 500 Km', 22, '')

INSERT INTO WeightCharge VALUES ('Up to 100 gr', 1, ''),
								 ('Over 100 - 300 gr', 2, ''),
								 ('Over 300 - 500 gr', 4, ''),
								 ('Over 500 - 1000 gr', 7, ''),
								 ('Over 1000 - 2000 gr', 11, ''),
								 ('Over 2000 gr', 16, '')

INSERT INTO News(Title, [Subject], Content) 
	VALUES ('2013 Holiday Press Room','DELIVERING the HOLIDAYS, DELIVERING DREAMS',
	'Nobody delivers the holidays like TARS Delivery System. And we have a track
	record of more than 230 years to prove it. So, whether at the Post Office or
	online at opms.com, you can count on us for all your holiday mailing needs.'),
			('Postal Service Ready for Busiest Mailing Day','More Than 860 Milion
	Pieces of Mail Expected Today','Today marks the Postal Service s busiest mailing
	day of the year, with more than 860 milion pieces of mailing entering the system,
	This represents an increase of more than 40 percent in the average daily volume
	of 583 milion pieces of mail.'),
			('Delivering Deeams One Letter at a Time','Postal Service and Disney
	Make Holiday Wishes Come True','What do the TARS Delivery System, the Muppet and 
	Santa Claus have in common? Neither rain nor snow nor heat nor gloom of night
	will keep them from delivering dreams this holiday season.')

GO								 

-------------------------------------------------------------------------------------------------------------------
						