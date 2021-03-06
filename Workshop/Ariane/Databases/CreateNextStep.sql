
USE MASTER
GO

--DECLARE @NewDatabase BIT = 1
--IF @NewDatabase = 1
--BEGIN
--	IF EXISTS ( SELECT * FROM master..sysdatabases WHERE name = N'NextStep')
--		DROP DATABASE NextStep;
--	--GO

--	CREATE DATABASE NextStep;
--	--GO
--END

--USE NextStep
----GO

--IF @NewDatabase = 0
--BEGIN
--	DROP TABLE	Item;
--	--GO
--	DROP TABLE Category;
--	--GO
--	DROP TABLE [Order];
--	--GO
--	DROP TABLE OrderDetail;
--	--GO
--	DROP TABLE CreditCard;
--	--GO
--END
--GO

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

INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 2, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 3, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 4, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 5, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 2, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 6, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 7, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 3, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 8, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 9, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 10, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 11, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 11, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 9, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 3, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 8, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 5, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1, 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 2, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 8, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 7, 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1, 1)

INSERT INTO CreditCard VALUES ('1111-1111-1111-1111', '1 DEC 2021', 'Name1')
INSERT INTO CreditCard VALUES ('2222-2222-2222-2222', '1 DEC 2022', 'Name2')
INSERT INTO CreditCard VALUES ('3333-3333-3333-3333', '1 DEC 2023', 'Name3')
