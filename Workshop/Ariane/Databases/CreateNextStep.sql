
USE MASTER
GO

DECLARE @NewDatabase BIT = 0

IF @NewDatabase = 1
BEGIN
	IF EXISTS ( SELECT * FROM master..sysdatabases WHERE name = N'NextStep')
		DROP DATABASE NextStep;
	--GO

	CREATE DATABASE NextStep;
	--GO
END

USE NextStep
--GO

IF @NewDatabase = 0
BEGIN
	DROP TABLE	Item;
	--GO
	DROP TABLE Category;
	--GO
END
GO

CREATE TABLE Category (
	CategoryId		INT IDENTITY(1,1) NOT NULL,
	CategoryName	NVARCHAR(100) NOT NULL,
	CONSTRAINT pk_category PRIMARY KEY (CategoryId)
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
	CategoryId		INT
	CONSTRAINT pk_item PRIMARY KEY (ItemId)
	CONSTRAINT fk_item_category FOREIGN KEY (CategoryId) REFERENCES Category
)
GO

INSERT INTO Category VALUES ('Foorwear - Men')
INSERT INTO Category VALUES ('Foorwear - Women')
INSERT INTO Category VALUES ('Foorwear - Kid')
INSERT INTO Category VALUES ('Clothing - Women')
INSERT INTO Category VALUES ('Clothing - Women')
INSERT INTO Category VALUES ('Clothing - Kid')
INSERT INTO Category VALUES ('Sports')
INSERT INTO Category VALUES ('Gym and Fitness')
INSERT INTO Category VALUES ('Game and Leisure')
INSERT INTO Category VALUES ('FanGear')
INSERT INTO Category VALUES ('Gift Cards')

INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 2)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 3)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 4)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 5)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 2)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 6)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 7)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 3)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 8)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 9)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 10)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 11)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 11)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 9)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 3)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 8)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 5)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 1)
INSERT INTO Item VALUES ('Asics Gel DS Trainer 19 Men''s Running Shoes', 199.99, '34926301.jpg', '34926301.jpg', 10, 'The Asics Gel DS Trainer 19 Men''s Running Shoes are a stable yet cushioned and lightweight design made for fast-paced training and racing. The engineered mesh upper is super-lightweight and offers an enhanced fit and comfort while the rearfoot and forefoot GEL cushioning inserts minimise shock during impact.', 2)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 8)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 7)
INSERT INTO Item VALUES ('adidas F5 TRX FG Women''s Football Boots', 69.99, '42707801.jpg', '42707801.jpg', 10, 'Designed for fast acceleration, adidas F5 TRX FG Women''s Football Boots have an incredibly lightweight upper outsole. TRAXION stud placement delivers reliable grip while an asymmetrical lacing system creates a large kicking surface for greater contact.', 1)


