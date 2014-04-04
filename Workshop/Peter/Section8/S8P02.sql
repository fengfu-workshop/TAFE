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
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
CREATE PROCEDURE usp_S8P02
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		Event.event_id,  
				Entry.horse_id, 
				Prize.place, 
				FORMAT(prizemoney, 'C', 'en-us') AS prizemoney
	FROM		Entry
	INNER JOIN	Event ON Entry.event_id = Event.event_id
	INNER JOIN	Prize ON Event.event_id = Prize.event_code
	WHERE		entry.place = prize.place
	ORDER BY	event.event_id, entry.horse_id

END
GO
