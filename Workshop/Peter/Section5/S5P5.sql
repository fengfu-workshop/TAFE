-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 11/03/2014
-- Description:	Solution of  Subqueries and Union
-- =============================================
CREATE PROCEDURE usp_S5P5

	-- Using subqueries only (using only products), list the name of each judge who does not live in Melbourne, 
	-- and who has judged an event entered by any horse with a gender of ‘S’

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	DISTINCT judge_name
	FROM	Judge, Event, Entry, Horse
	WHERE	Judge.judge_id = Event.judge_id
	AND		Event.event_id = Entry.event_id
	AND		Entry.horse_id = Horse.horse_id
	AND		address != 'Melbourne'
	AND		gender = 'S'
				
END
GO
