-- =======================================================
-- Create the Rob's Rentals Database
-- =======================================================
USE MASTER
GO

-- Executes all commands that are waiting to be executed. i.e
-- all commands between this 'go' and the last go.
-- First check to see if the Database (Robs' Rentals) already exists so
-- that it can be deleted.
IF EXISTS ( SELECT * FROM master..sysdatabases
					 WHERE name = N'RobsRentals_Fengfu_Chen')
	DROP DATABASE RobsRentals_Fengfu_Chen;
GO

CREATE DATABASE RobsRentals_Fengfu_Chen;
GO

USE RobsRentals_Fengfu_Chen
GO

CREATE TABLE customer(
	cust_num	NCHAR(4),
	title		NVARCHAR(4),
	cust_name	NVARCHAR(20)
	CONSTRAINT customer_pk PRIMARY KEY (cust_num)
)
GO

CREATE TABLE model(
	model_code   NVARCHAR(5),
	model_name   NVARCHAR(40),
	mth_charge   MONEY
	CONSTRAINT model_pk PRIMARY KEY (model_code)
)
GO

CREATE TABLE appliance(
	stock_num    NCHAR(4), 
	model_num    NVARCHAR(5), 
	condition    NVARCHAR(1), 
	date_maint   DATETIME 
	CONSTRAINT appliance_pk PRIMARY KEY (stock_num), 
	CONSTRAINT appliance_model_fk FOREIGN KEY (model_num) REFERENCES model
)
GO

CREATE TABLE hire(
	stock_num   NCHAR(4),
	date_hired  DATETIME,
	cust_num	NCHAR(4),
	paid_till   DATETIME,
	date_ret    DATETIME
	CONSTRAINT hire_pk PRIMARY KEY (stock_num, date_hired),
	CONSTRAINT hire_appliance_fk FOREIGN KEY (stock_num) REFERENCES appliance,
	CONSTRAINT hire_customer_fk FOREIGN KEY (cust_num) REFERENCES customer
)
GO

-- ===========================================================================
-- Load the Tables with Test Data.
-- ===========================================================================
USE RobsRentals_Fengfu_Chen;
GO

SET DATEFORMAT dmy;
GO

INSERT INTO customer VALUES ('1001','Mr','Isaac Newton')
INSERT INTO customer VALUES ('1002','Ms','Freda Bloggs')
INSERT INTO customer VALUES ('1003','Dr','Stan Smith')
INSERT INTO customer VALUES ('1004','Ms','Alice Adams')
INSERT INTO customer VALUES ('1005','Mr','Max Miller')
INSERT INTO customer VALUES ('1006','Dr','Zeg Zebra')

INSERT INTO model VALUES ('AX323','50 cm National Colour TV',89)
INSERT INTO model VALUES ('AX747','90 cm Sanyo Colour TV',169)
INSERT INTO model VALUES ('BX111','4 channel integrated video rectifier',45)

INSERT INTO appliance VALUES ('2001','AX323','E',null)
INSERT INTO appliance VALUES ('2002','AX323','S','07/07/1991')
INSERT INTO appliance VALUES ('2003','BX111','R',null)
INSERT INTO appliance VALUES ('2004','AX323','E','06/06/1991')
INSERT INTO appliance VALUES ('2005','AX747','E',null)
INSERT INTO appliance VALUES ('2006','AX747','R','08/08/1991')

INSERT INTO hire VALUES ('2001','01/01/1980','1005','01/02/1980','01/02/1980')
INSERT INTO hire VALUES ('2001','05/01/1990','1001','05/03/1990','05/03/1990')
INSERT INTO hire VALUES ('2001','08/03/1990','1002','07/06/1990','08/06/1990')
INSERT INTO hire VALUES ('2002','08/03/1990','1002','08/04/1990','08/04/1990')
INSERT INTO hire VALUES ('2003','05/01/1990','1001','05/07/1990','05/07/1990')
INSERT INTO hire VALUES ('2004','05/01/1990','1001','05/02/1990','05/02/1990')
INSERT INTO hire VALUES ('2004','01/02/1991','1001','02/02/1992',null)
INSERT INTO hire VALUES ('2005','10/02/1991','1003','12/12/1992',null)
INSERT INTO hire VALUES ('2006','01/07/1989','1003','30/11/1989','30/11/1989')
