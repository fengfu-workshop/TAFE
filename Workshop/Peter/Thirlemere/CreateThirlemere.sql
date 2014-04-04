USE MASTER
GO

IF EXISTS (SELECT * FROM MASTER..sysdatabases
					WHERE name = N'Thirlemere_Fengfu_Chen')
	DROP DATABASE Thirlemere_Fengfu_Chen
GO

CREATE DATABASE Thirlemere_Fengfu_Chen;
GO

USE Thirlemere_Fengfu_Chen
GO

CREATE TABLE horse (
	horse_id	nchar(3) NOT NULL,
	horse_name	nvarchar(15),
	colour		nvarchar(8),
	sire		nchar(3),
	dam			nchar(3),
	born		smallint,
	died		smallint,
	gender		nchar(1),
	CONSTRAINT horse_pk PRIMARY KEY(horse_id),
	CONSTRAINT horse_sire_fk FOREIGN KEY (sire) REFERENCES horse,
	CONSTRAINT horse_dam_fk FOREIGN KEY (dam) REFERENCES horse
)
GO

CREATE TABLE show (
	show_id			nchar(2) NOT NULL,
	show_name		nvarchar(15),
	show_held		datetime,
	show_address	nvarchar(30),
	CONSTRAINT show_pk PRIMARY KEY(show_id)
)
GO

CREATE TABLE judge (
	judge_id	nchar(2) NOT NULL,
	judge_name	nvarchar(15),
	address		nvarchar(30),
	CONSTRAINT judge_pk PRIMARY KEY(judge_id)
)
GO

CREATE TABLE event (
	event_id	nchar(4) NOT NULL,
	show_id		nchar(2),
	event_name	nvarchar(15),
	judge_id	nchar(2),
	CONSTRAINT event_pk PRIMARY KEY(event_id),
	CONSTRAINT event_showd_fk FOREIGN KEY (show_id) REFERENCES show,
	CONSTRAINT event_judge_fk FOREIGN KEY (judge_id) REFERENCES judge
)
GO

CREATE TABLE entry (
	event_id	nchar(4) NOT NULL,
	horse_id	nchar(3) NOT NULL,
	place		tinyint,
	CONSTRAINT entry_pk PRIMARY KEY(event_id, horse_id),
	CONSTRAINT entry_horse_fk FOREIGN KEY (horse_id) REFERENCES horse,
	CONSTRAINT entry_event_fk FOREIGN KEY (event_id) REFERENCES [event]
)
GO

CREATE TABLE prize (
	event_code	nchar(4) NOT NULL,
	place		tinyint NOT NULL,
	prizemoney	money,
	CONSTRAINT prize_pk PRIMARY KEY(event_code, place),
	CONSTRAINT prize_event_fk FOREIGN KEY (event_code) REFERENCES [event]
)
GO

use Thirlemere_Fengfu_Chen --Your DATABASE name here....
go
SET DATEFORMAT dmy;
go
-- Table 'horse'
INSERT INTO horse VALUES ('502', 'Sally','white', NULL, NULL,1974,1987,'M')
INSERT INTO horse VALUES ('501','Bluebell','grey ', NULL, NULL,1975,1982,'M')
INSERT INTO horse VALUES ('401','Snowy','white', NULL, NULL,1976,1984,'S')
INSERT INTO horse VALUES ('302','Tinkle','brown','401','501',1981,1994,'M')
INSERT INTO horse VALUES ('301','Daisy','white','401','502',1981,NULL,'M')
INSERT INTO horse VALUES ('201','Boxer','grey ','401','501',1980,NULL,'S')
INSERT INTO horse VALUES ('102','Star','brown','201','302',1991,NULL,'M')
INSERT INTO horse VALUES ('101','Flash','white','201','301',1990,NULL,'S')
-- Table 'show' 
INSERT INTO show VALUES ('01', 'Dubbo', '05/07/1995', '23 Wingewarra St, Dubbo')
INSERT INTO show VALUES ('02', 'Young', '13/09/1995', '13 Cherry Lane, Young')
INSERT INTO show VALUES ('03', 'Castle Hill', '04/05/1996', 'Showground Rd, Castle Hill')
INSERT INTO show VALUES ('04', 'Royal Easter', '21/04/1996', 'PO Box 13, GPO Sydney')
INSERT INTO show VALUES ('05', 'Dubbo', '01/07/1996', '17 Fitzroy St, Dubbo')
-- Table 'judge'
INSERT INTO judge VALUES ('01', 'Smith', 'Melbourne')
INSERT INTO judge VALUES ('02', 'Green', 'Cootamundra')
INSERT INTO judge VALUES ('03', 'Gates', 'Dunkeld')
INSERT INTO judge VALUES ('04', 'Smith', 'Sydney')
-- Table 'event'
INSERT INTO event VALUES ('0101', '01', 'Dressage', '01')
INSERT INTO event VALUES ('0102', '01', 'Jumping', '02')
INSERT INTO event VALUES ('0103', '01', 'Led in', '01')
INSERT INTO event VALUES ('0201', '02', 'Led in', '02')
INSERT INTO event VALUES ('0301', '03', 'Led in', '01')
INSERT INTO event VALUES ('0401', '04', 'Dressage', '04')
INSERT INTO event VALUES ('0501', '05', 'Dressage', '01')
INSERT INTO event VALUES ('0502', '05', 'Flag and Pole', '02')
-- Table 'prize'
INSERT INTO prize VALUES ('0101', 1, 120)
INSERT INTO prize VALUES ('0101', 2, 60)
INSERT INTO prize VALUES ('0101', 3, 30)
INSERT INTO prize VALUES ('0102', 1, 10)
INSERT INTO prize VALUES ('0102', 2, 5)
INSERT INTO prize VALUES ('0103', 1, 100)
INSERT INTO prize VALUES ('0103', 2, 60)
INSERT INTO prize VALUES ('0103', 3, 40)
INSERT INTO prize VALUES ('0201', 1, 10)
INSERT INTO prize VALUES ('0201', 2, 5)
INSERT INTO prize VALUES ('0401', 1, 1000)
INSERT INTO prize VALUES ('0401', 2, 500)
INSERT INTO prize VALUES ('0401', 3, 250)
INSERT INTO prize VALUES ('0501', 1, 10)
INSERT INTO prize VALUES ('0501', 2, 5)
-- Table 'entry'
INSERT INTO entry VALUES ('0101', '101', 1)
INSERT INTO entry VALUES ('0101', '102', 2)
INSERT INTO entry VALUES ('0101', '201', 3)
INSERT INTO entry VALUES ('0101', '301', 4)
INSERT INTO entry VALUES ('0102', '201', 2)
INSERT INTO entry VALUES ('0103', '102', 3)
INSERT INTO entry VALUES ('0201', '101', 1)
INSERT INTO entry VALUES ('0301', '301', 2)
INSERT INTO entry VALUES ('0401', '102', 7)
INSERT INTO entry VALUES ('0501', '102', 1)
INSERT INTO entry VALUES ('0501', '301', 3)