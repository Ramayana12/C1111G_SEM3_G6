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
	BranchID int CONSTRAINT fk_Account_Branch FOREIGN KEY (BranchID) REFERENCES Branch(ID),
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
	DeleveryEmployeeID int CONSTRAINT fk_Oder_Account2 FOREIGN KEY (DeleveryEmployeeID) REFERENCES Account(ID),
	ReceiveDate datetime,
	
	--MAIL
	ServiceChargeID int CONSTRAINT fk_Order_ServiceCharge FOREIGN KEY (ServiceChargeID) REFERENCES ServiceCharge(ID),
	DistanceChargeID int CONSTRAINT fk_Order_DistanceCharge FOREIGN KEY (DistanceChargeID) REFERENCES DistanceCharge(ID),
	WeightChargeID int CONSTRAINT fk_Order_WeightCharge FOREIGN KEY (WeightChargeID) REFERENCES WeightCharge(ID),

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
@ID int
AS
	SELECT * FROM Account
	WHERE ID = @ID
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

CREATE PROCEDURE checkLoginAccount
@UserName varchar(50),
@Password varchar(20)
AS
	SELECT * FROM Account
	WHERE UserName = @UserName AND [Password] = @Password	
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

-------------------------------------------------------------------------------------------------------------------

INSERT INTO Branch VALUES('Ha Noi','HN@abc.com','123456789','Ha noi',''),
						('Hai Phong','HP@abc.com','963258741','Hai phong',''),
						('TP HCM','HCM@abc.com','258741369','Sai Gon','')

-------------------------------------------------------------------------------------------------------------------
GO
						