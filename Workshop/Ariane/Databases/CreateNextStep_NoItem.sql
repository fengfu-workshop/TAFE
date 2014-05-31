
USE MASTER
GO

IF EXISTS ( SELECT * FROM master..sysdatabases WHERE name = N'NextStep')
	DROP DATABASE NextStep;
GO

CREATE DATABASE NextStep;
GO

USE NextStep
GO

CREATE TABLE Category (
	CategoryId		INT IDENTITY(1,1) NOT NULL,
	CategoryName	NVARCHAR(100) NOT NULL,
	Active			BIT DEFAULT 1
	CONSTRAINT pk_Category PRIMARY KEY (CategoryId)
)
GO

CREATE TABLE Item (
	ItemId			INT IDENTITY(1,1) NOT NULL,
	ItemName		NVARCHAR(100) NOT NULL,
	Price			MONEY NOT NULL,
	PhotoName 		VARCHAR(100),
	PhotoGuid		VARCHAR(36),
	Quantity		INT,
	Description		TEXT,
	CategoryId		INT,
	Active			BIT DEFAULT 1
	CONSTRAINT pk_Item PRIMARY KEY (ItemId),
	CONSTRAINT fk_Item_Category FOREIGN KEY (CategoryId) REFERENCES Category
)
GO

CREATE TABLE CreditCard (
	CreditCardNo	NVARCHAR(19) NOT NULL,
	ExpiryDate		DATETIME NOT NULL,
	NameOnCard		NVARCHAR(50) NOT NULL
	
	CONSTRAINT pk_CreditCard PRIMARY KEY (CreditCardNo)
)

CREATE TABLE [Order] (
	OrderId			INT IDENTITY(1,1) NOT NULL,
	FirstName		NVARCHAR(50) NOT NULL,
	LastName		NVARCHAR(50) NOT NULL,
	Address			NVARCHAR(100) NOT NULL,
	ContactNumber	NVARCHAR(50) NOT NULL,
	Email			NVARCHAR(50) NOT NULL,
	Payment			NVARCHAR(20) NOT NULL,
	CreditCardNo	NVARCHAR(19) NOT NULL,
	ExpiryDate		DATETIME NOT NULL,		-- for test only
	NameOnCard		NVARCHAR(50) NOT NULL	-- for test only
	
	CONSTRAINT pk_Order PRIMARY KEY (OrderId)
	CONSTRAINT fk_Order_CreditCard FOREIGN KEY (CreditCardNo) REFERENCES CreditCard,
)
GO

CREATE TABLE OrderDetail (
	OrderId			INT	NOT NULL,
	ItemId			INT NOT NULL,
	Quantity		INT NOT NULL

	CONSTRAINT pk_OrderDetail PRIMARY KEY (OrderId, ItemId),
	CONSTRAINT fk_OrderDetail_Order FOREIGN KEY (OrderId) REFERENCES [Order],
	CONSTRAINT fk_OrderDetail_Item FOREIGN KEY (ItemId) REFERENCES Item
)
GO

INSERT INTO Category VALUES ('Footwear - Men', 1)
INSERT INTO Category VALUES ('Footwear - Women', 1)
INSERT INTO Category VALUES ('Footwear - Kid', 1)
INSERT INTO Category VALUES ('Clothing - Men', 1)
INSERT INTO Category VALUES ('Clothing - Women', 1)
INSERT INTO Category VALUES ('Clothing - Kid', 1)
INSERT INTO Category VALUES ('Sports', 1)
INSERT INTO Category VALUES ('Gym and Fitness', 1)
INSERT INTO Category VALUES ('Game and Leisure', 1)
INSERT INTO Category VALUES ('FanGear', 1)
INSERT INTO Category VALUES ('Gift Cards', 1)
INSERT INTO Category VALUES ('Others', 1)


INSERT INTO CreditCard VALUES ('1111-1111-1111-1111', '1 DEC 2021', 'Name1')
INSERT INTO CreditCard VALUES ('2222-2222-2222-2222', '1 DEC 2022', 'Name2')
INSERT INTO CreditCard VALUES ('3333-3333-3333-3333', '1 DEC 2023', 'Name3')
